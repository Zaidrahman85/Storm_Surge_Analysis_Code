clc
clear

cd 'D:\Damage\damgefunction20221107 (1)\damgefunction20221107'
num = xlsread('Structure_20221107.xlsx');


Hex_ID = num(:,1);
FHW_08 = num(:,2);
FHnoW_08 = num(:,3);
FHW_19 = num(:,4);
LU08_S = num(:,5);
LU19_S = num(:,6);
V08_S = num(:,7).*0.76;
V19_S = num(:,8);
%Shape_Leng = num(:,9);
%Shape_Area = num(:,10);
lat = num(:,9);
lon = num(:,10);

% [dvali,dffi,propv_landv] = Damage_fucntion_LU_updated(improv_val,lui,xi);

[damage_value_W08_S,damage_function_W08_S,propv_landv_W08_S] = Damage_fucntion_LU_updated(V08_S,LU08_S,FHW_08);
[damage_value_noW08_S,damage_function_noW08_S,propv_landv_noW08_S] = Damage_fucntion_LU_updated(V08_S,LU08_S,FHnoW_08);
[damage_value_W19_S,damage_function_W19_S,propv_landv_W19_S] = Damage_fucntion_LU_updated(V19_S,LU19_S,FHW_19);

num(:,9) = damage_value_W08_S;
	
DV08_S = propv_landv_W08_S;
DVnoW08_S = propv_landv_noW08_S;
DV19_S = propv_landv_W19_S;

T = table(Hex_ID,FHW_08,FHnoW_08,FHW_19,LU08_S,LU19_S,V08_S,V19_S,lat,lon,...
    damage_value_W08_S,damage_value_noW08_S,damage_value_W19_S,DV08_S,DVnoW08_S,DV19_S);

  filename = 'Structure_20221107_damage.csv';
  writetable(T,filename)


 % %


%num =xlsread('Farmland_20221107.xlsx');
num_F = xlsread('new_Farmland_median.xlsx')

Hex_ID = num_F(:,1);
FHW_08 = num_F(:,2);
FHnoW_08 = num_F(:,3);
FHW_19 = num_F(:,4);
LU08_F = num_F(:,5);
LU19_F = num_F(:,6);
V08_F = num_F(:,7).*0.89;
V19_F = num_F(:,8);
% %Shape_Leng = num(:,9);
% %Shape_Area = num(:,10);
% lat = num(:,9);
% lon = num(:,10);

[damage_value_W08_F,damage_function_W08_F,propv_landv_W08_F] = Damage_fucntion_LU_updated(V08_F,LU08_F,FHW_08);
[damage_value_noW08_F,damage_function_noW08_F,propv_landv_noW08_F] = Damage_fucntion_LU_updated(V08_F,LU08_F,FHnoW_08);
[damage_value_W19_F,damage_function_W19_F,propv_landv_W19_F] = Damage_fucntion_LU_updated(V19_F,LU19_F,FHW_19);

num_F(:,9) = damage_value_W08_F;


DV08_F = propv_landv_W08_F;
DVnoW08_F = propv_landv_noW08_F;
DV19_F = propv_landv_W19_F;

T = table(Hex_ID,FHW_08,FHnoW_08,FHW_19,LU08_F,LU19_F,V08_F,V19_F,...
    damage_value_W08_F,damage_value_noW08_F,damage_value_W19_F,DV08_F,DVnoW08_F,DV19_F);
% 
  %filename = 'Farmland_20221107_damage.csv';
  filename = 'new_Farmland_median_damage.csv'
  writetable(T,filename)

damage_val_W08 = damage_value_W08_F+damage_value_W08_S;
damage_val_noW08 = damage_value_noW08_F+damage_value_noW08_S;
WFH_08 = FHW_08;
NWFH_08=FHnoW_08;

damage_val_W19 = damage_value_W19_F+damage_value_W19_S;
%%