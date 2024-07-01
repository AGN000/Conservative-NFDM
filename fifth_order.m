function [t1] = fifth_order(f1)
syms dx1 dx_1 dx_2 dx2 x bU0 bU1 bU_1 bU_2 bU2 du d2u d3u d4u d5u d6u
t1=0;
u=@(h) bU0+h*du+h^2/factorial(2)*d2u+h^3/factorial(3)*d3u+h^4/factorial(4)*d4u +h^5/factorial(5)*d5u;% +h^6/factorial(6)*d6u;
f1=subs(f1,bU2,u(dx1+dx2));
f1=subs(f1,bU1,u(dx1));
f1=subs(f1,bU0,u(0));
f1=subs(f1,bU_1,u(-dx_1));
f1=subs(f1,bU_2,u(-dx_1-dx_2));
fa=simplify(f1-du);

if fa==0 
    t1=1;
else
    disp('The scheme is fourth-order')
end
end

