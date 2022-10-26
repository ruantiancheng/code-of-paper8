n =5; % vehicle number
N = 3*n; 
hm= 0.3;% timedelay
hmin =0; 
h = hm;
dm = 1;
dmin = -1;
dot_h = dm;
tau = 0.2; %lower lag
% k1 = 0.3;
% k2 = 0.3;
% k3 = 0;
% ki = [k1,k2,k3]; % control gain
kij_1 =[[0.3,0.3,0.3],
        [0.3,0.3,0.3],
        [0.3,0.3,0.3],
        [0.3,0.3,0.3],
        [0.3,0.3,0.3]];
kij_2 =[[1,0.3,0.3],
        [1,0.3,0.3],
        [1,0.3,0.3],
        [1,0.3,0.3],
        [1,0.3,0.3]];
kij_3 =[[0.3,1,0.3],
        [0.3,1,0.3],
        [0.3,1,0.3],
        [0.3,1,0.3],
        [0.3,1,0.3]];
kij_4 =[[0.3,0.3,1],
        [0.3,0.3,1],
        [0.3,0.3,1],
        [0.3,0.3,1],
        [0.3,0.3,1]];

hij = [0.6,0.6,0.6,0.6,0.6];
% total_ift = ['pf','plf','bd','bdl'];
formatSpec = './res/parameter_%d_%s/';
for i = 1:4
   if i ==1
       kij = kij_1
       for j  =1:4
           if j ==1
               [A,Ad] = model_form_pf(n,tau,kij,hij);
               [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad);
               str = sprintf(formatSpec,i,'pf');
               write_func(str,PP,SS,RR,QQ,XX)
           elseif j ==2
               [A,Ad] = model_form_bd(n,tau,kij,hij);
               [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad);
               str = sprintf(formatSpec,i,'bd');
               write_func(str,PP,SS,RR,QQ,XX)
           elseif j ==3
               [A,Ad] = model_form_plf(n,tau,kij,hij);
               [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad);
               str = sprintf(formatSpec,i,'plf');
               write_func(str,PP,SS,RR,QQ,XX)
           elseif j ==4
               [A,Ad] = model_form_bdl(n,tau,kij,hij);
               [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad);
               str = sprintf(formatSpec,i,'bdl');
               write_func(str,PP,SS,RR,QQ,XX)
           end
       end
   elseif i ==2
       kij = kij_2
       [A,Ad] = model_form_plf(n,tau,kij,hij);
       [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad);
       str = sprintf(formatSpec,i,'plf');
       write_func(str,PP,SS,RR,QQ,XX)
    elseif i ==3
       kij = kij_3
       [A,Ad] = model_form_plf(n,tau,kij,hij);
       [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad);
       str = sprintf(formatSpec,i,'plf');
       write_func(str,PP,SS,RR,QQ,XX)
    elseif i ==4
       kij = kij_4
       [A,Ad] = model_form_plf(n,tau,kij,hij);
       [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad);
       str = sprintf(formatSpec,i,'plf'); 
       write_func(str,PP,SS,RR,QQ,XX)
   end
end
% [A,Ad] = model_form_pf(n,tau,kij,hij);
% [A,Ad] = model_form_bd(n,tau,kij,hij);
% [A,Ad] = model_form_plf(n,tau,kij,hij);
% [A,Ad] = model_form_bdl(n,tau,kij,hij);
% [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad)
% formatSpec = './res/Parameter_%d_%c/';
% 
% str = sprintf(formatSpec,index,ift);
% 
% csvwrite([str,'P.csv'],PP)
% csvwrite([str,'S.csv'],SS)
% csvwrite([str,'R.csv'],RR)
% csvwrite([str,'Q.csv'],QQ)
% csvwrite([str,'X.csv'],XX)



% [PP,SS,RR,QQ,XX] = lmi_figure(N, h,hm,dot_h,A,Ad)
% 
% 
% csvwrite('./res/P2.csv',PP)
% csvwrite('./res/S2.csv',SS)
% csvwrite('./res/R2.csv',RR)
% csvwrite('./res/Q2.csv',QQ)
% csvwrite('./res/X2.csv',XX)