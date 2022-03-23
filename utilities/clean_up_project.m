function clean_up_project()
%clean_up_project   Clean up local customizations of the task
%
%   Clean up the task for the current project. This function undoes
%   the settings applied in "set_up_project". It is set to Run at Shutdown.

%   Copyright 2020-2021 The MathWorks, Inc.

%% Clean up only project created Variables

if evalin('base','exist(''setupAndUserVars'')') && evalin('base','exist(''userVars'')')
    %setupVars will contain only the variables created by the project and
    %not the ones in base workspace which already existed before the
    %project was opened
    evalin('base', 'setupVars = setupAndUserVars(~cellfun(@(y) any(cellfun(@(x) isequal(x,y),userVars)),setupAndUserVars));')
    for i=1: evalin('base','length(setupVars)')
        evalin('base', ['clear(setupVars{' num2str(i) '});'])
    end
end

evalin('base', 'clear setupVars setupAndUserVars userVars');
Simulink.fileGenControl('reset');
