% Selected functions to be executed subsequently
tephraProb_JC

%% Set all run parameters manually
%project.grd_pth= 'Krak_local_2500';
%project.vent= struct;
%project.seasonality= 1;
%project.seasons= {'all'  'dry'  'rainy'};
%project.seasons_tag= {'All months'  'Nov-Mar'  'Apr-Oct'};
%project.grd_type= 0;
%project.run_pth= 'G:TephraProb\RUNS\krak_cord\9\';
%project.run_name= 'krak_cord';
%project.points= -9999;
%project.par= 0;
%project.cores= 2

% More functions
runT2_JC
process_T2_JC
probability_maker_JC
exportASCII_JC
exit(0)
