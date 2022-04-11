function [sys,x0,str,ts,simStateCompliance] = plot3dUAVTrajactory(t,x,u,flag)

switch flag,

  % Initialization %
  case 0,
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;

  % Derivatives %
  case 1,4,

  % Update %
  case 2,
    sys=mdlUpdate(t,x,u);

  case 3,
    sys=mdlOutputs(t,x,u);
  
  % Terminate %
  case 9,
    sys=mdlTerminate(t,x,u);

  % Unexpected flags %
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end


function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes
global h;
%
sizes = simsizes;

sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 0;
sizes.NumInputs      = 3;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed

sys = simsizes(sizes);

% initialize the initial conditions
x0  = [];

% str is always an empty matrix
str = [];

% initialize the array of sample times
ts  = [-1 0];

plot3(0,0,0,'o');
h = animatedline(0,0,'Color','r','LineWidth',2,'MaximumNumPoints',1000000);

simStateCompliance = 'UnknownSimState';

function sys=mdlUpdate(t,x,u)
global h;

addpoints(h,u(1),u(2),u(3));
drawnow

sys = [];

function sys=mdlOutputs(t,x,u)

sys = [];

function sys=mdlTerminate(t,x,u)

sys = [];


