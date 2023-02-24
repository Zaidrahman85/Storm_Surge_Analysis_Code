%% %% extract WL map and BL from map.nc
clc
clear

for k = 1:3

    if k == 1
    elseif k == 1
        filename_nc = 'R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\wetland_run\fm\output\GB_80_all_wetland_0012_map.nc';
    elseif k == 2
        filename_nc = 'R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\without wetland_run\fm\output\GB_80_all_nowetland_0012_map.nc';
    elseif k == 3
        filename_nc = 'R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\run_2019_use_2008mdu\fm\output\GB_80_all_wetland_0012_19_map.nc';
    end

    ncdisp(filename_nc);

    Time = ncread(filename_nc,'time');
    Time = datetime(2008,1,1,0,0,Time(2:end));
    WL = ncread(filename_nc,'mesh2d_s1');
    WL = WL(:,2:end);
    BL= ncread(filename_nc,'mesh2d_flowelem_bl');
    xxx = ncread(filename_nc,'mesh2d_face_x');
    yyy = ncread(filename_nc,'mesh2d_face_y');

    if k == 1 || k == 2 || k == 3 %|| k == 6 || k == 7 || k == 8
        j = load('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\New_setting_oct\GB_area_Index_Oct_Correct5.txt');
        WL = WL(j,:);
        BL = BL(j);
        xxx = xxx(j);
        yyy = yyy(j);
    else
    end

    BL(BL<0)= NaN;
    q=find(~isnan(BL));

    WLx = WL;

    WL = WLx(q,:);
    BL = BL(q);
    Xi = xxx(q);
    Yi = yyy(q);

    BLt = repmat(BL,1,length(Time));
    Flood = WL-BLt;

    [ind,iv] = max(Flood,[],2);
    Time_iv = Time(iv);
    Time_iv_d = hours(Time_iv-Time(1));
    mFloodi = max(Flood,[],2);


    clearvars -except mFloodi Xi Yi Time_iv_d Time_xv_d mFloodx mFloodi Xx Yy k

    % for wetland run
    if k == 1
        fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\wetland_run\fm\output\maxFlood_wetland_2008lc_Oct.xyz','w');
        C = [Xi,Yi,mFloodi];
        fprintf(fid,'%17.15E  %17.15E  %8.4f\n',C');
        fclose(fid);

        fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\wetland_run\fm\output\T_maxFlood_wetland_2008lc_Oct.xyz','w');
        H = [Xi,Yi,Time_iv_d];
        fprintf(fid,'%17.15E  %17.15E  %8.4f\n',H');
        fclose(fid);

    elseif k == 2
        fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\without wetland_run\fm\output\maxFlood_nowetland_2008lc_Oct.xyz','w');
        C = [Xi,Yi,mFloodi];
        fprintf(fid,'%17.15E  %17.15E  %8.4f\n',C');
        fclose(fid);

        fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\without wetland_run\fm\output\T_maxFlood_nowetland_2008lc_Oct.xyz','w');
        H = [Xi,Yi,Time_iv_d];
        fprintf(fid,'%17.15E  %17.15E  %8.4f\n',H');
        fclose(fid);


    elseif k == 3
        fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\run_2019_use_2008mdu\fm\output\maxFlood_wetland_2019lc_2019wl_Oct.xyz','w');
        C = [Xi,Yi,mFloodi];
        fprintf(fid,'%17.15E  %17.15E  %8.4f\n',C');
        fclose(fid);

        fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\run_2019_use_2008mdu\fm\output\T_maxFlood_wetland_2019lc_2019wl_Oct.xyz','w');
        H = [Xi,Yi,Time_iv_d];
        fprintf(fid,'%17.15E  %17.15E  %8.4f\n',H');
        fclose(fid);
    end
end

%% find difference based on

clc
clear

%for i = 3:4
%for i  = 5:6
for i  = 1:2

    if i == 1
        a1 = load('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\wetland_run\fm\output\maxFlood_wetland_2008lc_Oct.xyz');
        a2 = load('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\wetland_run\fm\output\T_maxFlood_wetland_2008lc_Oct.xyz');

        b1 = load('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\without wetland_run\fm\output\maxFlood_nowetland_2008lc_Oct.xyz');
        b2 = load('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\without wetland_run\fm\output\T_maxFlood_nowetland_2008lc_Oct.xyz');

    elseif i == 2
        b1 = load('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\run_2019_use_2008mdu\fm\output\maxFlood_wetland_2019lc_2019wl_Oct.xyz');
        b2 = load('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\run_2019_use_2008mdu\fm\output\T_maxFlood_wetland_2019lc_2019wl_Oct.xyz');

        a1 = load('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\wetland_run\fm\output\maxFlood_wetland_2008lc_Oct.xyz');
        a2 = load('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\wetland_run\fm\output\T_maxFlood_wetland_2008lc_Oct.xyz');


    end
end


c1 = b1(:,3)-a1(:,3);
c2 = b2(:,3)-a2(:,3);
x = a1(:,1);
y = a1(:,2);
c = c1;

clearvars -except x y c2 c q i

% for map height flood_peak map diff

if i == 1
    G2 = [x,y,c];
    fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\diff_maxFlood_nowetland_wetland_2008lc_Oct.xyz','w')
    fprintf(fid,'%17.15E  %17.15E  %8.4f\n',G2');
    fclose(fid);

    % for map time flood_peak map diff
    G2 = [x,y,c2];
    fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\T_diff_maxFlood_nowetland_wetland_2008lc_Oct.xyz','w')
    fprintf(fid,'%17.15E  %17.15E  %8.4f\n',G2');
    fclose(fid);


elseif i == 2

    G2 = [x,y,c];
    fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\diff_maxFlood_wetland_2019lc_2008lc_Oct.xyz','w')
    fprintf(fid,'%17.15E  %17.15E  %8.4f\n',G2');
    fclose(fid);

    % for map time flood_peak map diff
    G2 = [x,y,c2];
    fid = fopen('R:\Zaid\TXGB_Wave_Model\Delft3D_code_zd\June15\GoM\Final_GoM_DB_TA\All_needed_GoM\Grid_100m_new\New_NLCD_run_all\New_Oct_run_finished\T_diff_maxFlood_wetland_2019lc_2008lc_Oct.xyz','w')
    fprintf(fid,'%17.15E  %17.15E  %8.4f\n',G2');
    fclose(fid);

end


%%