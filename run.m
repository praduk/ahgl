clear;
close all;

%%%%%%%%%%%%% MODIFY BELOW %%%%%%%%%%%%%

% Uncomment Maps (Ctrl-R, Ctrl-T)
maps = {
    'Abiogenesis'
    'AcidPlant'
%    'Backwater'
    'Blackpink'
    'Catalyst'
%    'Eastwatch'
%    'NeonVioletSquare'
};

% Uncomment Players
players = {
    'MrSadPanda'
%    'Puzzle'
    'TemplarAF'
    'Slumdog'
%     'FireFerret'
     'Belgrat'
};

%%%%%%%%%%%%% MODIFY ABOVE %%%%%%%%%%%%%


N = length(players);
assert( N==length(maps) ,'Number of players must be equal to number of maps.');


%% Construct Cost Matrix and Solve Assignment Problem

J = zeros(length(maps));
for n=1:N
    J(:,n) = -parsePreferences(players{n},maps);
end
assignment = lapjv(J);


%% Display Results
for n=1:N
    fprintf('%16s - %-10s\n',maps{n},players{assignment(n)});
end
