close all
%Part(a):Create noise sequences u&v; 
u=wgn(100,1,-20);
v=wgn(100,1,20);

%Model data sequences y and x;
y=zeros(100,1);
y(1)=u(1);
y(2)=u(2);
for j=3:100
  y(j)=1.8*y(j-1)-0.8*y(j-2)+u(j);
end

x=zeros(100,1);
x(1)=v(1);
for j=2:100
  x(j)=1*y(j-1)+v(j);
end

%Part(b):Determine y_hat via Kalman filtering(Kalman filter state vector:Y[k]=columnvector{y[k],y[k-1]})
H=[1,0];
B=[2.8;0];
A=[1.8,-0.8;1,0];
Y_hatprediction=[0;0];
posterrorcv=[0,0;0,0];
Y_hat=zeros(100,2);
for k=1:100 
     X_hatprediction=H*Y_hatprediction;
     priorerrorcv=A*posterrorcv*A'+0.001*(B*B');
     Rww=H*priorerrorcv*H'+100;
     gain=priorerrorcv*H'*(1/Rww);
     Y_hat(k,:)=(Y_hatprediction+gain*(x(k)-X_hatprediction))';  
     posterrorcv=(eye(2)-gain*H)*priorerrorcv;
     Y_hatprediction=A*Y_hat(k,:)';
end
y_hat=Y_hat(:,1);

%Part(c):Plot the data sequences x, y and y_hat
 plot(1:100,y,1:100,x,1:100,y_hat)
 legend('y','x','y-hat:estimate')