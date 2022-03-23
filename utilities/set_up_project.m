function set_up_project()
%set_up_project:  Configure the task for this project
%
%   Set up the task for the current project. This function is set to
%   Run at Startup.

%  Copyright 2020-2021 The MathWorks, Inc.

%% Store user created variables for cleanup upon exit
    evalin('base', 'userVars = who;');

    %% Initialize Project variables

    evalin('base', 'InitUAVParams;');

    %% Set up work folders
    project = simulinkproject;
    projectRoot = project.RootFolder;

    %% Store project created variables for cleanup upon exit
    evalin('base', 'setupAndUserVars = who;');

    myCacheFolder = fullfile(projectRoot, 'work','cache');
    myCodeFolder = fullfile(projectRoot,'work','code');

    Simulink.fileGenControl('set',...
                            'CacheFolder', myCacheFolder,...
                            'CodeGenFolder', myCodeFolder,...
                            'createDir', true)
end
