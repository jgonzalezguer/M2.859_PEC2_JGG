clc;clear;close all; %https://es.mathworks.com/help/matlab/ref/plot.html

DATA=xlsread('RGUef.xlsx');

EN(1,:)=DATA(1,:);EF(1:12,:)=DATA(2:13,:);

LNEN=log(EN);
LNEF=log(EF);

filas=size(EF,1);
C=zeros(filas,4);

for i=1:filas
P=polyfit(LNEN,LNEF(i,:),3);
C(i,:)=P(:);
end

en=46:1765;
for i=1:filas
    for k=1:length(en)
        ef(i,k)=exp(C(i,4)+C(i,3)*log(en(k))+C(i,2)*log(en(k)).^2+C(i,1)*log(en(k)).^3);
    end
end



i=1;j=1;
while i<=filas;
    for k=1:length(en)
        Dr(j,k)=((ef(i,k)-ef(i+1,k))./ef(i+1,k))*100;
    end
i=i+2;  
j=j+1;
end


subplot(2,2,1)

leyenda2={'o','<','s','>','x','+'};

hold on;box('on');


for i=1:2:(filas-1);
   hold on;
    colour(i+1)=plot(en,ef(i+1,:),'LineWidth',1,'Color',[1 0.5 0.5]);axis([0 1800 0 0.225]);
    colour(i)=plot(en,ef(i,:),'--k','LineWidth',0.5); axis([0 1800 0 0.225]);
end
j=0;
for i=1:2:(filas-1);
    j=j+1;
   marker(i+1)=plot(en(1:100:length(en)),ef(i+1,1:100:length(en)),leyenda2{j},'markersize',3,'Color',[1 0.5 0.5]);
   marker(i)=plot(en(1:100:length(en)),ef(i,1:100:length(en)),leyenda2{j},'markersize',3,'Color',[0 0 0]);   
end

Marker(1)=marker(1);Marker(2)=marker(3);Marker(3)=marker(5);Marker(4)=marker(7);Marker(5)=marker(9);Marker(6)=marker(11);Marker(7)=colour(1);Marker(8)=colour(2);


xlabel('Energy(keV)');ylabel('Efficiency');
legend(Marker,'\fontsize{3} VG1 H=2 mm','\fontsize{3} VG1 H=72.2 mm','\fontsize{3} VG2 H=68.2 mm','\fontsize{3} VG2 H=120 mm','\fontsize{3} VG3 H=2 mm','\fontsize{3} VG3 H=26.6 mm','\fontsize{3} PENELOPE','\fontsize{3} LabSOCS','Location', 'northeast')


text(-350,0.28,'\fontsize{8} a)');


axis([0 1800 0 0.28]);set(gca,'XTick',[0  300  600  900 1200 1500 1800]);set(gca,'YTick',[0 0.03 0.06 0.09 0.12 0.15 0.18 0.21 0.24 0.27 ]);






subplot(2,2,2)
leyenda1={'r','b','k','g','m','y'};
leyenda2={'or','<b','sk','>g','xm','+y'};

hold on;box('on');
h=zeros(1,6);
for i=1:1:filas/2;
 
   if i~=filas/2;
   h(i)=plot(en(1:100:length(en)),Dr(i,1:100:length(en)),leyenda2{i},'markersize',3);axis([0 1800 -4 4]);
   else
   h(i)= plot(en(1:100:length(en)),Dr(i,1:100:length(en)),leyenda2{i},'markersize',3,'Color',[1 0.687 0.387]);axis([0 1800 -4 4]);   
   end
      
end


xlabel('Energy(keV)');ylabel('Dr(%)');
text(-200,4,'\fontsize{8} b)');

for i=1:1:filas/2;
   hold on;
   
    if i~=filas/2;
   plot(en,Dr(i,:),leyenda1{i});axis([0 1800 -4 4]);
   
    else
       plot(en,Dr(i,:),'markersize',3,'Color',[1 0.687 0.387]);axis([0 1800 -4 4]); 
    end
    
      
end
axis([0 1800 -4 4]);set(gca,'XTick',[0  300  600  900 1200 1500 1800]);set(gca,'YTick',[-4 -3 -2 -1 0 1 2 3 4]);
legend(h(1:6),'\fontsize{3} VG1 H=2 mm','\fontsize{3} VG1 H=72.2 mm','\fontsize{3} VG2 H=68.2 mm','\fontsize{3} VG2 H=120 mm','\fontsize{3} VG3 H=2 mm','\fontsize{3} VG3 H=26.6 mm','Location','North')


clc;clear;

DATA=xlsread('RGThef.xlsx');

EN(1,:)=DATA(1,:);EF(1:12,:)=DATA(2:13,:);

LNEN=log(EN);
LNEF=log(EF);

filas=size(EF,1);
C=zeros(filas,4);

for i=1:filas
P=polyfit(LNEN,LNEF(i,:),3);
C(i,:)=P(:);
end

en=129:1600;
for i=1:filas
    for k=1:length(en)
        ef(i,k)=exp(C(i,4)+C(i,3)*log(en(k))+C(i,2)*log(en(k)).^2+C(i,1)*log(en(k)).^3);
    end
end



i=1;j=1;
while i<=filas;
    for k=1:length(en)
        Dr(j,k)=((ef(i,k)-ef(i+1,k))./ef(i+1,k))*100;
    end
i=i+2;  
j=j+1;
end


subplot(2,2,3)

leyenda2={'o','<','s','>','x','+'};

hold on;box('on');


for i=1:2:(filas-1);
   hold on;
    colour(i+1)=plot(en,ef(i+1,:),'LineWidth',1,'Color',[1 0.5 0.5]);axis([0 1800 0 0.225]);
    colour(i)=plot(en,ef(i,:),'--k','LineWidth',0.5); axis([0 1800 0 0.225]);
end
j=0;
for i=1:2:(filas-1);
    j=j+1;
   marker(i+1)=plot(en(1:100:length(en)),ef(i+1,1:100:length(en)),leyenda2{j},'markersize',3,'Color',[1 0.5 0.5]);
   marker(i)=plot(en(1:100:length(en)),ef(i,1:100:length(en)),leyenda2{j},'markersize',3,'Color',[0 0 0]);   
end

Marker(1)=marker(1);Marker(2)=marker(3);Marker(3)=marker(5);Marker(4)=marker(7);Marker(5)=marker(9);Marker(6)=marker(11);Marker(7)=colour(1);Marker(8)=colour(2);


xlabel('Energy(keV)');ylabel('Efficiency');
legend(Marker,'\fontsize{3} VG1 H=2 mm','\fontsize{3} VG1 H=72.2 mm','\fontsize{3} VG2 H=68.2 mm','\fontsize{3} VG2 H=120 mm','\fontsize{3} VG3 H=2 mm','\fontsize{3} VG3 H=26.6 mm','\fontsize{3} PENELOPE','\fontsize{3} LabSOCS','Location', 'northeast')


text(-350,0.28,'\fontsize{8} c)');


axis([0 1800 0 0.28]);set(gca,'XTick',[300  600  900 1200 1500 1800]);set(gca,'YTick',[0 0.03 0.06 0.09 0.12 0.15 0.18 0.21 0.24 0.27 ]);






subplot(2,2,4)
leyenda1={'r','b','k','g','m','y'};
leyenda2={'or','<b','sk','>g','xm','+y'};

hold on;box('on');
h=zeros(1,6);
for i=1:1:filas/2;
 
   if i~=filas/2;
   h(i)=plot(en(1:100:length(en)),Dr(i,1:100:length(en)),leyenda2{i},'markersize',3);axis([0 1800 -4 4]);
   else
    h(i)=plot(en(1:100:length(en)),Dr(i,1:100:length(en)),leyenda2{i},'markersize',3,'Color',[1 0.687 0.387]);axis([0 1800 -4 4]);   
   end
      
end


xlabel('Energy(keV)');ylabel('Dr(%)');
text(-200,4,'\fontsize{8} d)');
axis([0 1800 -4 4]);set(gca,'XTick',[300  600  900 1200 1500 1800]);set(gca,'YTick',[-4 -3 -2 -1 0 1 2 3 4]);
for i=1:1:filas/2;
   hold on;
   
    if i~=filas/2
   plot(en,Dr(i,:),leyenda1{i});axis([0 1800 -4 4]);
   
    else
       plot(en,Dr(i,:),'markersize',3,'Color',[1 0.687 0.387]);axis([0 1800 -4 4]); 
    end
    
      
end

legend(h(1:6),'\fontsize{3} VG1 H=2 mm','\fontsize{3} VG1 H=72.2 mm','\fontsize{3} VG2 H=68.2 mm','\fontsize{3} VG2 H=120 mm','\fontsize{3} VG3 H=2 mm','\fontsize{3} VG3 H=26.6 mm','Location','North')


print('-dpng', '-r1200', 'curvas'); 
