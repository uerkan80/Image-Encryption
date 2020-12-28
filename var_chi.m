function [Var1 Var2 chi_2_Encryption chi_2_plain]=var_chi(I,I1)
[m n]=size(I);
[r1 c1]=imhist(I);
[r2 c2]=imhist(I1);
topla=0;
topla2=0;
for i=1:256
    for j=1:256
      topla=topla+0.5*(r1(i)-r1(j))^2;  
      topla2=topla2+0.5*(r2(i)-r2(j))^2; 
    end
end
Var1=topla/(256^2);
Var2=topla2/(256^2);

[r c]=imhist(I1);
Var2=var(r(:));

topla=0;
for i=1:256
    for j=1:256
      topla=topla+0.5*(r(i)-r(j))^2;  
    end
end
Var3=topla/(256^2);

topla=0;
topla_2=0;
piksel_say=m*n;
for i=1:256  
  topla=topla+((r(i)-(piksel_say/256))^2)/(piksel_say/256);  
  topla_2=topla_2+((r1(i)-(piksel_say/256))^2)/(piksel_say/256); 
end
chi_2_Encryption=topla;
chi_2_plain=topla_2;
end