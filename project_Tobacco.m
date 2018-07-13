%-------------------------------------------------------
%------------PRP Project Crop Tobacoo-------------------
%------------Date:17/14/2016----------------------------
%------------Janvi Patel,Nishi Patel--------------------
%-------------------------------------------------------
clc;
clear;

Total_Plot=100;

fr_N=[70 75 80];
fr_P=[65 50 40];
fr_S=[40 30 20];
fr_K=[53 30 13];

fr_A_intersect_N=[0 0.8 1.5];
fr_A_intersect_P=[2 3 1.7];
fr_A_intersect_S=[0 1 1.5];
fr_A_intersect_K=[5 4 3.75];

fr_B_intersect_N=[6 3 6.2];
fr_B_intersect_P=[6 5 4.9];
fr_B_intersect_S=[8 5 10];
fr_B_intersect_K=[4 8 3];

mean=[57	46.25	38.25];
sd=[13.39154	21.36001	30.09291];

Yield_A=8316.5;    %unit lbs./acre
Yield_B=10350.5;
i=0;


for i=1:3
    Pr_tobacco_N(i)=fr_N(i)/Total_Plot;
    Pr_tobacco_P(i)=fr_P(i)/Total_Plot;
    Pr_tobacco_S(i)=fr_S(i)/Total_Plot;
    Pr_tobacco_K(i)=fr_K(i)/Total_Plot;

    Pr_A_intersect_N(i)=fr_A_intersect_N(i)/Total_Plot;
    Pr_A_intersect_P(i)=fr_A_intersect_P(i)/Total_Plot;
    Pr_A_intersect_S(i)=fr_A_intersect_S(i)/Total_Plot;
    Pr_A_intersect_K(i)=fr_A_intersect_K(i)/Total_Plot;

    Pr_A_given_N(i) = Pr_A_intersect_N(i)/Pr_tobacco_N(i);
    Pr_A_given_P(i) = Pr_A_intersect_P(i)/Pr_tobacco_P(i);
    Pr_A_given_S(i) = Pr_A_intersect_S(i)/Pr_tobacco_S(i);
    Pr_A_given_K(i) = Pr_A_intersect_K(i)/Pr_tobacco_K(i);
    
    Pr_N_intersect_A_given_N(i)=Pr_tobacco_N(i)*Pr_A_intersect_N(i);
    Pr_P_intersect_A_given_P(i)=Pr_tobacco_P(i)*Pr_A_intersect_P(i);
    Pr_S_intersect_A_given_S(i)=Pr_tobacco_S(i)*Pr_A_intersect_S(i);
    Pr_K_intersect_A_given_K(i)=Pr_tobacco_K(i)*Pr_A_intersect_K(i);
    
    
    % for B yield
    Pr_B_intersect_N(i)=fr_B_intersect_N(i)/Total_Plot;
    Pr_B_intersect_P(i)=fr_B_intersect_P(i)/Total_Plot;
    Pr_B_intersect_S(i)=fr_B_intersect_S(i)/Total_Plot;
    Pr_B_intersect_K(i)=fr_B_intersect_K(i)/Total_Plot;

    Pr_B_given_N(i) = Pr_B_intersect_N(i)/Pr_tobacco_N(i);
    Pr_B_given_P(i) = Pr_B_intersect_P(i)/Pr_tobacco_P(i);
    Pr_B_given_S(i) = Pr_B_intersect_S(i)/Pr_tobacco_S(i);
    Pr_B_given_K(i) = Pr_B_intersect_K(i)/Pr_tobacco_K(i);
    
    Pr_N_intersect_B_given_N(i)=Pr_tobacco_N(i)*Pr_B_intersect_N(i);
    Pr_P_intersect_B_given_P(i)=Pr_tobacco_P(i)*Pr_B_intersect_P(i);
    Pr_S_intersect_B_given_S(i)=Pr_tobacco_S(i)*Pr_B_intersect_S(i);
    Pr_K_intersect_B_given_K(i)=Pr_tobacco_K(i)*Pr_B_intersect_K(i);
    
    E_production_N_yield_A(i) = Pr_N_intersect_A_given_N(i)*Yield_A;
    E_production_N_yield_B(i) = Pr_N_intersect_B_given_N(i)*Yield_B;
    E_production_N(i) = E_production_N_yield_A(i)+E_production_N_yield_B(i);
    
    E_production_P_yield_A(i) = Pr_P_intersect_A_given_P(i)*Yield_A;
    E_production_P_yield_B(i) = Pr_P_intersect_B_given_P(i)*Yield_B;
    E_production_P(i) = E_production_P_yield_A(i)+E_production_P_yield_B(i);
    
    E_production_S_yield_A(i) = Pr_S_intersect_A_given_S(i)*Yield_A;
    E_production_S_yield_B(i) = Pr_S_intersect_B_given_S(i)*Yield_B;
    E_production_S(i) = E_production_S_yield_A(i)+E_production_S_yield_B(i);
    
    E_production_K_yield_A(i) = Pr_K_intersect_A_given_K(i)*Yield_A;
    E_production_K_yield_B(i) = Pr_K_intersect_B_given_K(i)*Yield_B;
    E_production_K(i) = E_production_K_yield_A(i)+E_production_K_yield_B(i);
   
    E_Total_Production(i) = E_production_N(i)+ E_production_P(i)+ E_production_S(i)+ E_production_K(i);
end
figure;
bar(E_Total_Production)
set(gca,'XTickLabel',{'2002','2007','2015'})

for i=1:3
    z_N(i)=(fr_N(i)-mean(i))/sd(i);
    z_P(i)=(fr_P(i)-mean(i))/sd(i);
    z_S(i)=(fr_S(i)-mean(i))/sd(i);
    z_K(i)=(fr_K(i)-mean(i))/sd(i);
end

temp_N_12=z_N(1)*z_N(2);
temp_P_12=z_P(1)*z_P(2);
temp_S_12=z_S(1)*z_S(2);
temp_K_12=z_K(1)*z_K(2);

temp_12=temp_N_12+temp_P_12+temp_S_12+temp_K_12;
correlation_coefficient_12=temp_12/3;

temp_N_23=z_N(3)*z_N(2);
temp_P_23=z_P(3)*z_P(2);
temp_S_23=z_S(3)*z_S(2);
temp_K_23=z_K(3)*z_K(2);

temp_23=temp_N_23+temp_P_23+temp_S_23+temp_K_23;
correlation_coefficient_23=temp_23/3;

temp_N_13=z_N(1)*z_N(3);
temp_P_13=z_P(1)*z_P(3);
temp_S_13=z_S(1)*z_S(3);
temp_K_13=z_K(1)*z_K(3);

temp_13=temp_N_13+temp_P_13+temp_S_13+temp_K_13;
correlation_coefficient_13=temp_13/3;

temp_N_123=z_N(1)*z_N(2)*z_N(3);
temp_P_123=z_P(1)*z_P(2)*z_P(3);
temp_S_123=z_S(1)*z_S(2)*z_S(3);
temp_K_123=z_K(1)*z_K(2)*z_K(3);

temp_123=temp_N_123+temp_P_123+temp_S_123+temp_K_123;
correlation_coefficient_123=temp_123/3;
correlation_coefficient=[correlation_coefficient_12 correlation_coefficient_23 correlation_coefficient_13 correlation_coefficient_123];
figure;
bar(correlation_coefficient)
set(gca,'XTickLabel',{'2002-2007','2007-2015','2002-2015','2002-2007-2015'})


