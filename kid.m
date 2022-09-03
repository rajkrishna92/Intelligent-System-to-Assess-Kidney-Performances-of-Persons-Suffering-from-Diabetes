%function [out1,out2]=kid(x,y1,y2,m1,z1,z2)
%1st stage risk factors
x=8;y1=115;y2=75;z1=157;z2=62;
t2=[3,1,2,3,3,3,2]

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
tt2=1:5;
tt3=combvec(tt2,tt2,tt2,tt2,tt2,tt2,tt2);
n=normalize(1:5^7,'range');
for i=1:length(tt3)
  if isequal(tt3(:,i),t2')==1 
      break
  end
end

i
mean(t2)
r1(3,:)=[n(i),round(mean(t2))];

r1

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

r1
%%
t1=linspace(1,5,3*3*5*3*5);
t2=combvec(1:3,1:3,1:5,1:3,1:5);


for k=1:length(t2)
  if isequal(t2(:,k),r1(:,2))==1 
      break
  end
end

k
t1(k)
A1(i)=round(t1(k));
xx=r1(:,1)';
xx
(xx*r1(:,2))/0.19
A2(i)=(xx*r1(:,2))/0.19;
%end