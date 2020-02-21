%

close all
clear

DATA.MARKERSIZE=12;
DATA.FONTSIZE=24;
DATA.LINEWIDTH=5;

addpath(genpath('splines3'))


N=1500;
X=round(400*rand(N,1));

for II=1:N
Y(II)=(X(II)-100).*(X(II)-200).*(X(II)-300)/40000 +200+40*(rand(1)-0.5);
endfor
[X id]=sort(X);
X=X/400;
Y=Y(id);

Y(600:1000)=Y(600:1000)+40;

%figure;
%plot(X,Y,'.')


NPARTS=6;
WS=ones(size(X));
LEVEL=2;
[P XINT]=lms_splines3(X,Y,NPARTS,WS,LEVEL);

M=20;
for II=1:NPARTS
    x(:,II)=linspace(XINT(II,1),XINT(II,2),M);
    y(:,II)=polyval(P(II,:),x(:,II));
endfor


figure;
plot(X,Y,'.','linewidth',DATA.LINEWIDTH,x,y,'-','linewidth',DATA.LINEWIDTH);
hx=xlabel('x');
set(hx,'fontsize',DATA.FONTSIZE);
hy=ylabel('y');
set(hy,'fontsize',DATA.FONTSIZE);
set(gca,'fontsize',DATA.FONTSIZE);
print(gcf,'splines3demo.eps','-depsc');


