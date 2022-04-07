function launchReaduORBDataModel
%

%   Copyright 2021 The MathWorks, Inc.

    project = simulinkproject;
    projectRoot = project.RootFolder;
    open_system(fullfile(projectRoot,'models','No1_ReadUORBData.slx'));
end
