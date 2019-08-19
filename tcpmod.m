function Pattack = tcpmod(B,C)
%tcmod TCP Model
%   Get the attack probability
minRTO=1; %seconds
D=0.200; %200ms (ACK delay)
b=1;
d=0.090; %90ms (one way propagation delay)
N= 1; %number of flows
m=1; %packets
n=1; %round
Wk= B+(2*d*C)+(N/b);

i=1;
%W 
while true
 if i==1
     W(i)=N;
     i=i+1;
 elseif (i >1) && (((1+1/b)*W(i-1)) <= ((Wk+(n*N/b))/2))
     W(i)=(1+1/b)*W(i-1);
     i=i+1;
 elseif (W(i-1)<((Wk+(n*N/b))/2)) && ((1+1/b)*W(i-1) >= ((Wk+(n*N/b))/2))
     W(i)=(Wk+(n*N/b))/2;
     i=i+1;
 elseif (((Wk+(n*N/b))/2)<= W(i-1)) && (W(i-1) < Wk)
     W(i)=W(i-1)+(N/b);
     i=i+1;
 elseif (W(i-1)>=Wk)
     break
 end
end
k=i-1;

%T
O=0;

Temp=(B/C)+(3*d)+((n*(N+(max(2*d*C,Wk-(N/b)))))/C)+minRTO+(N*O)+(((ceil(m/b)-1)*(n+1)*b*N)/C)+((n*(n-1)*Wk)/(2*C))+(2*d+(N/C))+((b-1)*D);

Temp2=0;
for i2 = 2:k-1
 Temp2=Temp2+(max((2*d)+(N/C),W(i2-1)/C));
end
Temp=Temp+Temp2;

Pup=0;
for i3 = 1:k-1
 Pup=Pup+W(i3);
end
Pup=Pup+B-max(0,Wk-(N/b)-(2*d*C));
P=Pup/(Temp*C);
Pattack=(1-P);
end

