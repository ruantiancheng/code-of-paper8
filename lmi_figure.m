function [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad)

% A=[-2 0;0 -0.9];
% Ad=[-1 0;-1 -1];
% N =2
setlmis([]);
R=lmivar(1,[N,1]);
S=lmivar(1,[N,1]);
Q=lmivar(1,[N,1]);
[P11,~,SP11]=lmivar(1,[N,1]);
[P12,~,SP12]=lmivar(1,[N,1]);
[P13,~,SP13]=lmivar(1,[N,1]);


[P21,~,SP21]=lmivar(3,SP12');
[P22,~,SP22]=lmivar(1,[N,1]);
[P23,~,SP23]=lmivar(1,[N,1]);


[P31,~,SP31]=lmivar(3,SP13');
[P32,~,SP32]=lmivar(3,SP23');
[P33,~,SP33]=lmivar(1,[N,1]);

[P,~,SP]=lmivar(3,[SP11,SP12,SP13;SP12',SP22,SP23;SP12',SP23',SP33]);

[X11,~,SX11]=lmivar(1,[N,1]);
[X12,~,SX12]=lmivar(1,[N,1]);

[X21,~,SX21]=lmivar(1,[N,1]);
[X22,~,SX22]=lmivar(1,[N,1]);
[X,~,SX]=lmivar(3,[SX11,SX12;SX21,SX22]);


lmiterm([1 1 1 R],-1,1); 

lmiterm([1 1 3 X11],-1,1); 
lmiterm([1 1 4 X12],-1,1); 

lmiterm([1 2 2 R],-3,1); 
lmiterm([1 2 3 X21],-1,1); 
lmiterm([1 2 4 X22],-1,1); 
lmiterm([1 3 1 -X11],-1,1); 
lmiterm([1 3 2 -X21],-1,1); 
lmiterm([1 3 3 R],-1,1); 

lmiterm([1 4 1 -X12],-1,1); 
lmiterm([1 4 2 -X22],-1,1); 

lmiterm([1 4 4 R],-3,1); 


% R
lmiterm([2 1 1 R],hm*A',A);
lmiterm([2 1 2 R],hm*A',Ad);

lmiterm([2 2 1 R],hm*Ad',A);
lmiterm([2 2 2 R],hm*Ad',Ad);

% S
lmiterm([2 1 1 S],1,1);

lmiterm([2 3 3 S],-1,1);

% Q
lmiterm([2 1 1 Q],1,1);

lmiterm([2 2 2 Q],-(1-dot_h),1);

% P
lmiterm([2 1 1 P11],1,A);
lmiterm([2 1 1 P12],1,1);
lmiterm([2 1 1 -P11],A',1);
lmiterm([2 1 1 -P12],1,1);

lmiterm([2 1 2 P11],1,Ad);
lmiterm([2 1 2 P12],-(1-dot_h),1);
lmiterm([2 1 2 P13],(1-dot_h),1);

lmiterm([2 1 3 P13],-1,1);

lmiterm([2 1 4 -P21],h*A',1);
lmiterm([2 1 4 -P22],h,1);

lmiterm([2 1 5 -P31],(hm-h)*A',1);
lmiterm([2 1 5 -P32],(hm-h),1);

lmiterm([2 2 4 -P21],h*Ad',1);
lmiterm([2 2 4 -P22],-(1-dot_h),1);
lmiterm([2 2 4 -P23],(1-dot_h),1);

lmiterm([2 2 5 -P31],(hm-h)*Ad',1);
lmiterm([2 2 5 -P32],-(hm-h)*(1-dot_h),1);
lmiterm([2 2 5 -P33],(hm-h)*(1-dot_h),1);

lmiterm([2 3 4 -P23],-h,1);
lmiterm([2 3 4 -P33],-(hm-h),1);

% Phi
lmiterm([2 1 1 R],-4/hm,1);

lmiterm([2 1 2 R],-2/hm,1);
lmiterm([2 1 2 X11],-1/hm,1);
lmiterm([2 1 2 X12],-1/hm,1);
lmiterm([2 1 2 X21],-1/hm,1);
lmiterm([2 1 2 X22],-1/hm,1);

lmiterm([2 1 3 X11],1/hm,1);
lmiterm([2 1 3 X12],-1/hm,1);
lmiterm([2 1 3 X21],1/hm,1);
lmiterm([2 1 3 X22],-1/hm,1);

lmiterm([2 1 4 R],6/hm,1);

lmiterm([2 1 5 X12],2/hm,1);
lmiterm([2 1 5 X22],2/hm,1);

lmiterm([2 2 2 R],-8/hm,1);
lmiterm([2 2 2 X11],1/hm,1);
lmiterm([2 2 2 X12],1/hm,1);
lmiterm([2 2 2 X21],-1/hm,1);
lmiterm([2 2 2 X22],-1/hm,1);
lmiterm([2 2 2 -X11],1/hm,1);
lmiterm([2 2 2 -X12],1/hm,1);
lmiterm([2 2 2 -X21],-1/hm,1);
lmiterm([2 2 2 -X22],-1/hm,1);

lmiterm([2 2 3 R],-2/hm,1);
lmiterm([2 2 3 X11],-1/hm,1);
lmiterm([2 2 3 X12],1/hm,1);
lmiterm([2 2 3 X21],1/hm,1);
lmiterm([2 2 3 X22],-1/hm,1);

lmiterm([2 2 3 R],6/hm,1);
lmiterm([2 2 3 -X21],2/hm,1);
lmiterm([2 2 3 -X22],2/hm,1);

lmiterm([2 2 5 R],6/hm,1);
lmiterm([2 2 5 X12],-2/hm,1);
lmiterm([2 2 5 X22],2/hm,1);

lmiterm([2 3 3 R],-4/hm,1);

lmiterm([2 3 4 -X21],-2/hm,1);
lmiterm([2 3 4 -X22],2/hm,1);

lmiterm([2 3 5 R],6/hm,1);

lmiterm([2 4 4 R],-12/hm,1);

lmiterm([2 4 5 X22],-4/hm,1);

lmiterm([2 5 5 R],-12/hm,1);

lmiterm([3 1 1 S],-1,1);
lmiterm([4 1 1 R],-1,1);
lmiterm([5 1 1 P],-1,1);
lmiterm([6 1 1 Q],-1,1);

lmisys=getlmis;
[tmin,xfeas]=feasp(lmisys);
% 
PP=dec2mat(lmisys,xfeas,P);
SS=dec2mat(lmisys,xfeas,S);
RR=dec2mat(lmisys,xfeas,R);
QQ=dec2mat(lmisys,xfeas,Q);
XX=dec2mat(lmisys,xfeas,X);