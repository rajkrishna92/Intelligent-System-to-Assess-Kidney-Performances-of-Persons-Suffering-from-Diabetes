function [out1,out2]=kidney1(x,y1,y2,t2,z1,z2)
%1st stage risk factors

Blood_sugar=@(x)[sigmf(x,[-4.4,5.7]);gaussmf(x,[0.3,6]);sigmf(x,[4.4,6.4])];
Blood_pressue=@(y1,y2)[[sigmf(y1,[-0.2,119]);gaussmf(y1,[8,130]);sigmf(y1,[0.2,140])],...
    [sigmf(y2,[-0.2,79]);gaussmf(y2,[4,85]);sigmf(y2,[0.2,90])]];

%x=input('enter blood sugar');

[r1(1,1),r1(1,2)]=max(Blood_sugar(x));

BP=Blood_pressue(y1,y2);
[r(1,1),r(1,2)]=max(BP(:,1));
[r(2,1),r(2,2)]=max(BP(:,2));
r1(2,1)=mean(r(:,1));
[~,t]=max(r(:,1));
tt=r(:,2);
r1(2,2)=tt(t);



%% 2nd stage risk factors
% for i=1:7
%     risk{i}=[1 2 3 4 5];
% end
% comb=combvec(risk{1},risk{2},risk{3},risk{4},risk{5},risk{6},risk{7});
% av=mean(comb);
% data=[comb',av',av'./5];

tt2=1:5;
tt3=combvec(tt2,tt2,tt2,tt2,tt2,tt2,tt2);
n=normalize(1:5^7,'range');
for i=1:length(tt3)
  if isequal(tt3(:,i),t2')==1 
      break
  end
end


r1(3,:)=[n(i),round(mean(t2))];


%% 3rd stage Risk factors
Albumin=@(z)[sigmf(z,[-0.05,30]);...
    gaussmf(z,[115,165]);...
    sigmf(z,[0.05,300])];

GFR=@(z)[sigmf(z,[0.3,90]);...
        gaussmf(z,[12,74.5]);...
        gaussmf(z,[12,44.5]);...
        gaussmf(z,[6,22]);...
        sigmf(z,[-0.3,15])];
    

[r1(4,1),r1(4,2)]=max(Albumin(z1));
[r1(5,1),r1(5,2)]=max(GFR(z2));

%%
t1=linspace(1,5,3*3*5*3*5);
t2=combvec(1:3,1:3,1:5,1:3,1:5);


for i=1:length(t2)
  if isequal(t2(:,i),r1(:,2))==1 
      break
  end
end
out1=t1(i);
xx=r1(:,1)';
out2=(xx*r1(:,2))/0.19;
end

