function [dvali,dffi,propv_landv] = Damage_fucntion_LU_updated(improv_val,lui,xi);

% function to estimate the damage value for land and property based on damage flood
% fucntion. This function is created based on table provided in the study 'Global flood depth-damage functions: Methodology and the database with guidelines' by Huizinga etal 2017
%Source for Table: Huizinga JRC - https://publications.jrc.ec.europa.eu/repository/handle/JRC105688
%Huizinga, J., De Moel, H. and Szewczyk, W., 2017. Global flood depth-damage functions: Methodology and the database with guidelines (No. JRC105688). Joint Research Centre (Seville site).

%landu : 1 - Residential ; 2 - Commercial; 3 - Industrial; 4 - Agricultural ; 5 - infractrustcre


% Inputs:
% xi = flood depth in m
% lui = land use data with index  (1-6)
%     1 - residential
%     2 - commercial
%     3 - industrial
%     4 - agriculture
%     5 - infrastructure
%     6 -no-agricultural 

% improv_val = Market value for property (values in $)


% Outputs
% dvali = the damage value of the propetey in $
% dffi = the percengae damage (%)
% propv_landv = Market value for property that was considered to calculate
% the damage value.

dffi = [];
dvali = [];
propv_landv = [];
for i = 1:length(lui);

    lu = lui(i);
%    lc = lci(i);
    x = xi(i);
    %   land_valx =land_val(i);
    improv_valx = improv_val(i);

    if x >0.1
        if lu == 1
            % Damaged: Residential Rd
            dff = (-0.00156.*x.^4 + 0.02617.*x.^3-0.1655*x.^2 + 0.5201*x+ 0.2051).*100;  % updated
            valx = improv_valx;

        elseif lu == 2
            % Damaged: Commercial
            dff = (0.0008057*x.^5 - 0.01364*x.^4 + 0.08651*x.^3 - 0.2658*x.^2 + 0.5452*x + 0.02075).*100;
            valx = improv_valx;

        elseif lu == 3
            % Damaged: Industrial
            dff = (0.0006105*x.^5 - 0.01112*x.^4 + 0.07852*x.^3 -0.2901*x.^2 + 0.6867*x + 0.02226).*100;
            valx = improv_valx;

        elseif lu == 4
            % Damaged: Agricultural
            dff= (0.001054*x.^5 - 0.01874*x.^4 + 0.1243*x.^3 - 0.3932*x.^2 + 0.7287*x + 0.01348).*100;
            %      valx = land_valx;
            valx = improv_valx;

        elseif lu == 5
            % - infrastructure
            %         x = [0;0.5;1;1.5;2;3;4;5;6];
            % y = [0.00;0.23;0.40;0.58;0.68;0.80;0.89;0.98;1.00];
            dff = (-0.001202*x.^(4) + 0.02082*x.^(3) - 0.1461*x.^(2) + 0.5555*x - 0.007222).*100;
            valx = improv_valx;
        elseif lu == 6
            % Damaged: Residential Rd
            dff = (-0.00156.*x.^4 + 0.02617.*x.^3-0.1655*x.^2 + 0.5201*x+ 0.2051).*100;  % updated
            valx = improv_valx;
        end

    else
        dval = 0;
        dff = 0;
        valx = 0;
    end

    % to estimate the damage value in $
    dval = valx.*(dff./100);
    propv_landv = [propv_landv;valx];
    dffi = [dffi;dff];
    dvali = [dvali;dval];


end

end