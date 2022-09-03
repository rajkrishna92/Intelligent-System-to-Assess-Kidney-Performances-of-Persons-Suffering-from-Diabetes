clear all;
clc
level=1:5;

sugar=linspace(4.5,7.5,50);
Systolic=linspace(100,150,50);
Diastolic=linspace(60,110,50);
snd=combvec(level,level,level,level,level,level,level);
Albumin=linspace(0,350,100);
GFR=0:120;
l=1;


for i=1:length(Albumin)
for j=1:length(GFR)
[a(i),b(i)]=kid(6.2,143,94,snd(:,i)',160,65);
end
end
% syms x;
 %subplot(2,1,1)
% fplot(sigmf (x, [-0.22, 30]));
% hold on
% fplot(gaussmf (x, [-50, 165]));
% fplot(sigmf (x, [0.22, 300]));
% axis([10 350 0 1])
% subplot(2,1,2)
% fplot(sigmf (x, [1, 90]));
% hold on
% fplot(gaussmf (x, [6.5, 74.5]));
% fplot(gaussmf (x, [6.5, 44.5]));
% fplot(gaussmf (x, [3, 22]));
% fplot(sigmf (x, [-0.3, 15]));
% axis([5 100 0 1])
% 
% 
% [stage,chance]=kid(6.2,143,94,[2 4 3 1 4 2 2],160,65)




