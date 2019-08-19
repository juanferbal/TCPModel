clc
close all 
clear all

% B variable
Cfij=5000;
for i = 1000:10000
    Bvar(i-999)=i;
    PBvar(i-999)=tcpmod(i,Cfij); 
end

figure(1)
hold on
plot(Bvar,PBvar)
axis([1000 inf 0 inf])
hold off

% C variable
Bfij=5000;
for i = 2000:50000
    Cvar(i-1999)=i;
    PCvar(i-1999)=tcpmod(Bfij,i);
    PC2(i-1999)=1-PCvar(i-1999);
end

figure(2)
hold on
plot(Cvar,PCvar)
axis([2000 inf 0 inf])
hold off

%figure(3)
%hold on
%plot(Cvar,PC2)
%axis([2000 inf 0 inf])
%hold off