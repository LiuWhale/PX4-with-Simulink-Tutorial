function launchSimulinkNumberThree
%

%   Copyright 2021 The MathWorks, Inc.

    project = simulinkproject;
    projectRoot = project.RootFolder;
    open_system(fullfile(projectRoot,'models','No3_RWSerialData.slx'));
end
