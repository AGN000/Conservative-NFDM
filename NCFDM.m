clc
clear all
close all

syms a b c x dx dx_1 dx1 dx_2 dx2 dx3 dx_3

L0=1/(dx_1/2+dx1/2);
L1=1/(dx1/2+dx2/2);
L2=1/(dx2/2+dx3/2);
L_1=1/(dx_1/2+dx_2/2);
L_2=1/(dx_2/2+dx_3/2);
%cell average calculation
bu0=L0*int(a*x^2+b*x+c,-(dx_1/2),+(dx1/2));
bu1=L1*int(a*x^2+b*x+c,dx1/2,dx1+dx2/2);
bu2=L2*int(a*x^2+b*x+c,dx1+dx2/2,dx1+dx2+dx3/2);
bu_1=L_1*int(a*x^2+b*x+c,-(dx_1+dx_2/2),-(dx_1/2));
bu_2=L_2*int(a*x^2+b*x+c,-(dx_1+dx_2+dx_3/2),-(dx_1+dx_2/2));
syms bU0 bU_1 bU_2 bU1 bU2

%Cell interface (i+0.5) calculation
eq1=solve(bu_1-bU_1,bu0-bU0,bu1-bU1,a,b,c);
t1=0.5*dx1;
yp5=simplify(eq1.a*(t1).^2+eq1.b*(t1)+eq1.c); 
eq1=solve(bu_2-bU_2,bu_1-bU_1,bu0-bU0,a,b,c);
t1=-0.5*dx_1;
yp_5=simplify(eq1.a*(t1).^2+eq1.b*(t1)+eq1.c); 

%Cell interface (i-0.5) calculation
dy=(yp5-yp_5)*2/(dx1+dx_1); % final appoximation of df/dx
%Order of accuracy calculation
f1=simplify(dy);
disp('df/dx calculated using NCFDM is:')
disp(f1)
t1=first_order(f1);
if t1==1
t1=second_order(f1);
if t1==1
t1=third_order(f1);
if t1==1
t1=fourth_order(f1);
if t1==1
t1=fifth_order(f1);
end
end
end
end
