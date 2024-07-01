clc
clear all
close all
syms a0 a1 a2 a3 a4 a5 f x dx_1 dx1 dx_2 dx2 dx
syms u(x)
syms  bU0  bU1  bU_1  bU_2  bU2
u=@(x) a0+a1*x+a2*x^2+a3*x^3;
eq0=u(0);
eq_2=u(-(dx_2+dx_1));
eq_1=u(-dx_1);
eq1=u(dx1);
eq2=u(dx1+dx2);
sol1=solve(eq1- bU1,eq0- bU0,eq_1- bU_1,eq_2- bU_2,a0,a1,a2,a3);
f1=simplify(sol1.a1);
disp('df/dx using FDM is')
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
