# Storm_Surge_ Analysis _Code: 
This is the code described in Al-Attabi et al. 2022 (submitted) contains scripts that used to prepare boundary conditions data for model simulation, metrological forcing data, and storm surge damage analysis. The storm surge damage analysis is based on depth-damage function that estimate the proportion of flood damage based on the average flood height, dominant property type and total property value associated with each hexagon in map file. The depth- damage functions used is described in Huizinga et al (2017). This code uses regression fitting analysis to convert the binned depth-damage data in Huizinga et al (2017) to a continuous function applicable at any flood depth.
- Code Citation:  
Zaid Al-Attabi, and Siddharth Narayan (2022, Aug 17). Analysis_Storm_Surge_Damages Code V1.0 (Version V1.0). Zenodo. http://doi.org/cc.cccc/zenodo.xxxxxxx

- Method Citation:  
Al-Attabi, Z.R., Y. Xu, G. Tso. And S. Narayan, 2022. The combined influence of wetland loss, coastal development and sea-level rise on storm surge damage: a case-study of Hurricane Ike. 2022 (submitted)

Copyright 2022(c) Zaid Al-Attabi, and Siddharth Narayan 
Storm_Surge_ Analysis _Code is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.

- Storm_Surge_ Analysis _Code/data  
  It contains the data files used by BC_prep.m and Meteo_prep.m to create input data for model simulation. Also it contains data of flood depth, Land Cover and Land Use, and Property value to estimate storm surge damages using Damage_Fucntion.m  
- Main Functions: 
 
BC_prep.m,  
Meteo_prep.m,  
Damage_Fucntion.m,  

- Data Files (../data):

….mat   - MAT file with …,  
…..mat       - MAT file with ….,
…..NC          - NetCDF file with,
….xls   -Excel sheet with , 
