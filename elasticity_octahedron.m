clear all
close all

%% Outer layer before force 
so = [1 1 1 1 3 4 5 2 6 6 6 6];
to = [4 5 2 3 4 5 2 3 4 5 2 3];
[~,nedgeo] = size(so) ; 
Go = graph(so, to);
No = [0 ;1 ; 0 ;-1 ; 0 ; 0];
No(:,:,2) = [0 ;0 ;-1 ; 0 ; 1 ; 0];
No(:,:,3) = [1 ;0 ; 0 ; 0 ; 0 ;-1];

%Incidence Matrix (can be also defined as sparse)
Io = [1  0  0 -1  0  0 ;    
      1  0  0  0 -1  0 ;    
      1 -1  0  0  0  0 ;    
      1  0 -1  0  0  0 ;    
      0  0  1 -1  0  0 ;    
      0  0  0  1 -1  0 ;    
      0 -1  0  0  1  0 ;      
      0  1 -1  0  0  0 ;    
      0  0  0 -1  0  1 ;    
      0  0  0  0 -1  1 ;    
      0 -1  0  0  0  1 ;    
      0  0 -1  0  0  1  ] ; 

S = [0.5  0   0   0.5 0   0 ;
     0.5  0   0   0   0.5 0 ;
     0.5  0.5 0   0   0   0 ;
     0.5  0   0.5 0   0   0 ;
     0    0   0.5 0.5 0   0 ;
     0    0   0   0.5 0.5 0 ;
     0    0.5 0   0   0.5 0 ;
     0    0.5 0.5 0   0   0 ;
     0    0   0   0.5 0   0.5 ;
     0    0   0   0   0.5 0.5 ; 
     0    0.5 0   0   0   0.5 ;
     0    0   0.5 0   0   0.5 ] ;  
 
Eo = pagemtimes(Io,No) ;
magEo = zeros(nedgeo,1);
for i=1:nedgeo
   magEo(i) = sqrt( Eo(i,1)^2 + Eo(i,2)^2 + Eo(i,3)^2 ) ;  
end    
%% Inner layer before force 
si = [1 1 1 1 1 1 2 2 2 2  2 3 3 3  3 4 4  4 5 5 5  5 6 6  6 7  7  7  8  8  9  9  9 10 10 11];
ti = [2 3 4 5 6 9 3 4 6 7 10 4 7 8 11 5 8 12 6 8 9 12 7 9 10 8 10 11 11 12 10 11 12 11 12 12];
[~,nedgei] = size(si) ; 
Gi = graph(si, ti);
Gi.Nodes.Name = {'$\hat N_1$' '$\hat N_2$' '$\hat N_3$' '$\hat N_4$' '$\hat N_5$' '$\hat N_6$' '$\hat N_7$' '$\hat N_8$' '$\hat N_9$' '$\hat N_{10}$' '$\hat N_{11}$' '$\hat N_{12}$'}';

Ni = pagemtimes(S,No) ;

%Inner Layer Incidence Matrix
Ii = [1 -1  0  0  0  0  0  0  0  0  0  0 ;
      1  0  0 -1  0  0  0  0  0  0  0  0 ;
      1  0  0  0 -1  0  0  0  0  0  0  0 ;
      1  0  0  0  0 -1  0  0  0  0  0  0 ;
      0  1 -1  0  0  0  0  0  0  0  0  0 ;
      0  1  0  0  0 -1  0  0  0  0  0  0 ;
      0  1  0  0  0  0 -1  0  0  0  0  0 ;
      0  0  1 -1  0  0  0  0  0  0  0  0 ;
      0  0  0  1 -1  0  0  0  0  0  0  0 ;
      0  0  0  1  0  0  0 -1  0  0  0  0 ;
      0  0  1  0  0  0 -1  0  0  0  0  0 ;
      0  0  1  0  0  0  0 -1  0  0  0  0 ;
      0  1  0 -1  0  0  0  0  0  0  0  0 ;
      1  0  0  0  0  0  0  0 -1  0  0  0 ;
      0  1  0  0  0  0  0  0  0 -1  0  0 ;
      1  0 -1  0  0  0  0  0  0  0  0  0 ;
      0  0  0  0  0  0  0  0  1  0  0 -1 ;
      0  0  0  0  0  0  0  0  0  1 -1  0 ;    
      0  0  0  0  0  0  0  0  0  0  1 -1 ;
      0  0  0  0  0  1  0  0 -1  0  0  0 ;
      0  0  0  0  0  1  0  0  0 -1  0  0 ;
      0  0  0  0  0  0  1  0  0  0 -1  0 ;
      0  0  0  0  0  0  1  0  0 -1  0  0 ;
      0  0  0  0  1  0  0  0 -1  0  0  0 ;
      0  0  0  0  1  0  0  0  0  0  0 -1 ;
      0  0  0  0  0  0  0  1  0  0 -1  0 ;
      0  0  0  0  0  0  0  1  0  0  0 -1 ;
      0  0  0  0  0  0  0  0  1 -1  0  0 ;
      0  0  1  0  0  0  0  0  0  0 -1  0 ;
      0  0  0  1  0  0  0  0  0  0  0 -1 ;
      0  0  0  0  1 -1  0  0  0  0  0  0 ;
      0  0  0  0  1  0  0 -1  0  0  0  0 ;
      0  0  0  0  0  1 -1  0  0  0  0  0 ;
      0  0  0  0  0  0  1 -1  0  0  0  0 ;
      0  0  0  0  0  0  0  0  1  0 -1  0 ;
      0  0  0  0  0  0  0  0  0  1  0 -1 ] ; 

Ei = pagemtimes(Ii,Ni) ;
magEi = zeros(nedgei,1);
for i=1:nedgei
   magEi(i) = sqrt( Ei(i,1)^2 + Ei(i,2)^2 + Ei(i,3)^2 ) ;  
end    

%% Outer Layer System Elasticity 
co = 0.2121*ones(nedgeo,1);
do = 7.0711*ones(nedgeo,1);
kpow = -4 ;
ko = 10^(kpow)*sqrt(2)*ones(nedgeo,1);

%% Inner Layer System Elasticity 
ci1= 0.1061*ones(12,1);
ci2= 0.15*ones(4,1);
ci3= ci1 ;
ci4= 0.15*ones(8,1); 
ci = [ci1 ; ci2 ; ci3 ; ci4] ;
di1= 3.5355*ones(12,1);
di2= 5*ones(4,1);
di3= di1 ;
di4= 5*ones(8,1); 
di = [di1 ; di2 ; di3 ; di4] ;

ki1= 10^(kpow)*(1/sqrt(2))*ones(12,1);
ki2= 10^(kpow)*ones(4,1);
ki3= ki1 ;
ki4= 10^(kpow)*ones(8,1); 
ki = [ki1 ; ki2 ; ki3 ; ki4] ;
Kc3  = zeros(nedgeo,nedgeo) ;
Kc4  = zeros(nedgeo,nedgeo) ;
for i=1:nedgeo
    c4el1 = 2*ko(i) ; 
    c4el2 = 0 ; 
    c3el = 0 ; 
    for j=1:nedgei
        c3el  = c3el + ki(j)*ci(j)/magEo(i) ; 
        c4el1 = c4el1 + ( ci(j)/(2*do(i)) + di(j)/(2*co(i)) )*ki(j) ;
        c4el2 = c4el2 + ( co(i)*ci(j)/(2*do(i)) + do(i)*di(j)/(2*co(i)) )*ki(j) ;
    end    
    Kc3(i,i) = ( ko(i)*(1 - magEo(i)/(co(i)+magEo(i)) ) + c3el )/(2*co(i)) ;
    Kc4(i,i) = ( (co(i) + do(i))*ko(i) + c4el1*magEo(i) + c4el2 )/( 2*( co(i) + magEo(i) )*( do(i) + magEo(i) ) ) ;
end    
  
B1 = [0 ; 0.176 ; 0 ; -0.2169 ; 0] ;
B1(:,:,2) = [0 ; 0 ; -0.1954 ; 0 ; 0.2407] ;
B1(:,:,3) = [0.1586 ; 0 ; 0 ; 0 ; 0] ;

X2 = 0 ;
X2(:,:,2) =  0 ;
X2(:,:,3) = -1 ;

[Xc3,Bc3, Xic3] = solvesystem(Io,Kc3,B1,X2,S) ;
[Xc4,Bc4, Xic4] = solvesystem(Io,Kc4,B1,X2,S) ;


%% Plot Objects before force 
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex') ;
set(groot, 'defaultTextInterpreter','latex') ;
set(groot, 'defaultGraphplotInterpreter','latex') ;
blue = [57 106 177]./255;
red = [204 37 41]./255;
black = [83 81 84]./255;
green = [62 150 81]./255;
brown = [146 36 40]./255;
purple = [107 76 154]./255;
fs = 15 ;

figure(1)
set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [5 5]); %Set the paper to have width 5 and height 5.
Go.Nodes.Name = {'$N_1$' '$N_2$' '$N_3$' '$N_4$' '$N_5$' '$N_6$'}';
plot(Go,'XData',No(:,:,2),'YData',No(:,:,1),'ZData',No(:,:,3),'EdgeColor',blue,'LineWidth',2.7, 'NodeFontSize', 15, 'MarkerSize', 8)
hold on
plot(Gi,'XData',Ni(:,:,2),'YData',Ni(:,:,1),'ZData',Ni(:,:,3),'EdgeColor',red,'LineWidth',2.7, 'NodeLabel',{}, 'MarkerSize', 8)
grid on
ax = gca;
ax.FontSize=15;
view(15,15) ;
xlabel('Axis 2','FontSize',fs) 
ylabel('Axis 1','FontSize',fs,'Position',[3 -6]) 
zlabel('Axis 3','FontSize',fs) 
saveas(gcf,'original.pdf')
% 
figure(2)
set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [5 5]); %Set the paper to have width 5 and height 5.
Go.Nodes.Name = {'$N_1$' '$N_2$' '$N_3$' '$N_4$' '$N_5$' '$N_6$'}';
plot(Go,'XData',No(:,:,2),'YData',No(:,:,1),'ZData',No(:,:,3),'EdgeColor',blue,'LineWidth',2.7, 'NodeFontSize', 15, 'MarkerSize', 8)
hold on
plot(Gi,'XData',Ni(:,:,2),'YData',Ni(:,:,1),'ZData',Ni(:,:,3),'EdgeColor',red,'LineWidth',2.7, 'NodeLabel',{}, 'MarkerSize', 8)
%maxval = 1.05 ;
%axis([-maxval maxval -maxval maxval -maxval maxval])
grid on
ax = gca;
ax.FontSize=15;
view(90,0) ;
xlabel('Axis 2','FontSize',fs) 
ylabel('Axis 1','FontSize',fs) 
zlabel('Axis 3','FontSize',fs) 
saveas(gcf,'original_2d1.pdf')
% 
% 

%% Plot Objects after force 
figure(3)
set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [5 5]); %Set the paper to have width 5 and height 5.
Go.Nodes.Name = {'$X_1$' '$X_2$' '$X_3$' '$X_4$' '$X_5$' '$X_6$'}';
plot(Go,'XData',Xc4(:,:,2),'YData',Xc4(:,:,1),'ZData',Xc4(:,:,3),'EdgeColor',blue,'LineWidth',2.7, 'NodeFontSize', fs, 'MarkerSize', 8)
hold on
plot(Gi,'XData',Xic4(:,:,2),'YData',Xic4(:,:,1),'ZData',Xic4(:,:,3),'EdgeColor',red,'LineWidth',2.7, 'NodeLabel',{}, 'MarkerSize', 8)
%maxval = 1.1 ;
%axis([-maxval maxval -maxval maxval -maxval maxval])
grid on
ax = gca;
ax.FontSize=fs;
view(15,15) ;
xlabel('Axis 2','FontSize',fs) 
ylabel('Axis 1','FontSize',fs,'Position',[3*6.0 -6*4.25]) 
zlabel('Axis 3','FontSize',fs) 
saveas(gcf,'case4.pdf')
% 
figure(4)
set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [5 5]); %Set the paper to have width 5 and height 5.
Go.Nodes.Name = {'$X_1$' '$X_2$' '$X_3$' '$X_4$' '$X_5$' '$X_6$'}';
plot(Go,'XData',Xc4(:,:,2),'YData',Xc4(:,:,1),'ZData',Xc4(:,:,3),'EdgeColor',blue,'LineWidth',2.7, 'NodeFontSize', fs, 'MarkerSize', 8)
hold on
plot(Gi,'XData',Xic4(:,:,2),'YData',Xic4(:,:,1),'ZData',Xic4(:,:,3),'EdgeColor',red,'LineWidth',2.7, 'NodeLabel',{}, 'MarkerSize', 8)
%maxval = 1.1 ;
%axis([-maxval maxval -maxval maxval -maxval maxval])
grid on
ax = gca;
ax.FontSize=fs;
view(90,0) ;
xlabel('Axis 2','FontSize',fs) 
ylabel('Axis 1','FontSize',fs) 
zlabel('Axis 3','FontSize',fs) 
saveas(gcf,'case4_2d1.pdf')

figure(5)
set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [5 5]); %Set the paper to have width 5 and height 5.
Go.Nodes.Name = {'$X_1$' '$X_2$' '$X_3$' '$X_4$' '$X_5$' '$X_6$'}';
plot(Go,'XData',Xc3(:,:,2),'YData',Xc3(:,:,1),'ZData',Xc3(:,:,3),'EdgeColor',blue,'LineWidth',2.7, 'NodeFontSize', fs, 'MarkerSize', 8)
hold on
plot(Gi,'XData',Xic3(:,:,2),'YData',Xic3(:,:,1),'ZData',Xic3(:,:,3),'EdgeColor',red,'LineWidth',2.7, 'NodeLabel',{}, 'MarkerSize', 8)
%maxval = 1.1 ;
%axis([-maxval maxval -maxval maxval -maxval maxval])
grid on
ax = gca;
ax.FontSize=15;
view(15,15) ;
xlabel('Axis 2','FontSize',fs) 
ylabel('Axis 1','FontSize',fs,'Position',[235 -290]) 
zlabel('Axis 3','FontSize',fs)  
saveas(gcf,'case3.pdf')
% 
figure(6)
set(gcf, 'PaperPosition', [0 0 5 5]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [5 5]); %Set the paper to have width 5 and height 5.
Go.Nodes.Name = {'$X_1$' '$X_2$' '$X_3$' '$X_4$' '$X_5$' '$X_6$'}';
plot(Go,'XData',Xc3(:,:,2),'YData',Xc3(:,:,1),'ZData',Xc3(:,:,3),'EdgeColor',blue,'LineWidth',2.7, 'NodeFontSize', fs, 'MarkerSize', 8, 'NodeColor',blue)
hold on
plot(Gi,'XData',Xic3(:,:,2),'YData',Xic3(:,:,1),'ZData',Xic3(:,:,3),'EdgeColor',red,'LineWidth',2.7, 'NodeLabel',{}, 'MarkerSize', 8, 'NodeColor',red)
%maxval = 1.1 ;
%axis([-maxval maxval -maxval maxval -maxval maxval])
grid on
ax = gca;
ax.FontSize=15;
view(90,0) ;
xlabel('Axis 2','FontSize',fs) 
ylabel('Axis 1','FontSize',fs) 
zlabel('Axis 3','FontSize',fs)  
saveas(gcf,'case3_2d1.pdf')

clearvars so to si ti maxval ci1 ci2 ci3 ci4 di1 di2 di3 red black blue brown purple
clearvars di4 ki1 ki2 ki3 ki4 i c4el1 c4el2 c3el j kpow fs green ax B1 X2



function [X,B, Xi] = solvesystem(Io,K,B1,X2,S)
    At = Io.' * K * Io ;
    A11 = At(1:5,1:5)  ;
    A12 = At(1:5,6)    ;
    A21 = At(6, 1:5)   ;
    A22 = At(6,6)      ;
    invA11 = inv(A11)  ;

    X1 = pagemtimes(invA11,B1) - pagemtimes(A12,X2)  ; 

    X = [X1 ; X2] ;
    Xi = pagemtimes(S,X) ;
    
    B2 = pagemtimes(A21,X1)+pagemtimes(A22,X2) ;
    B = [B1 ; B2] ;
end