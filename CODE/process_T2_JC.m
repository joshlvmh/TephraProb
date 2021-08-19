function process_T2
% Check that you are located in the correct folder!
if ~exist(fullfile(pwd, 'tephraProb.m'), 'file')
    errordlg(sprintf('You are located in the folder:\n%s\nIn Matlab, please navigate to the root of the TephraProb\nfolder, i.e. where tephraProb.m is located. and try again.', pwd), ' ')
    return
end

%% Load inputs and checks
%project = load_run;

% Set all run parameters manually
project.grd_pth= 'Krak_local_2500';
project.vent= struct;
project.seasonality= 1;
project.seasons= {'all'  'dry'  'rainy'};
project.seasons_tag= {'All months'  'Nov-Mar'  'Apr-Oct'};
project.grd_type= 0;
project.run_pth= getenv('PROJECT_RUN');
project.run_name= 'krak_cord';
project.points= -9999;
project.par= 0;
project.cores= 2

load(fullfile(getenv('CODE'), 'VAR', 'prefs'), 'prefs'); % Load prefs
if project.run_pth == -1; return; end
mkdir(fullfile(project.run_pth, 'DATA'));


% Check if seasonality was activated
runs = project.seasons;

% Check if model was run
if isempty(dir(fullfile(project.run_pth, 'OUT', 'all', '1', '*.out*')))    
    errordlg('No output file found. Did you already run the model?', ' ');
    return
end

disp('- Summing files...');

for iR = 1:length(runs)
    folds   = dir(fullfile(project.run_pth, 'OUT', runs{iR}));
    folds   = folds(~ismember({folds.name},{'.','..'}));  % Remove . and ..
    % Check output folders
    if isempty(folds); errordlg('No ouput file was found. Did you run Tephra2?'); return; end

    nbRuns = size(folds,1); % Number of runs

    for j = 1:nbRuns
        if strcmp(folds(j).name, '.') || strcmp(folds(j).name, '..') || strcmp(folds(j).name, '.DS_Store')
        else
            files = dir(fullfile(project.run_pth, 'OUT', runs{iR}, folds(j).name, '*.out'));
            
            for k = 1:length(files)
                fprintf('%s\n', project.run_pth)
                tmpF            = dlmread(fullfile(project.run_pth, 'OUT', runs{iR}, folds(j).name, files(k).name));
               % tmpF(:,1:2)     = round(tmpF(:,1:2));
                tmpF(:,4)       = round(tmpF(:,4),prefs.files.nbDigits);
                dlmwrite(fullfile(project.run_pth, 'OUT',runs{iR}, folds(j).name, files(k).name), tmpF, 'delimiter', '\t', 'precision', 8);
            end
        end
    end    
end
