% Get map preferences for a player over a set of maps
% If no preferences are found, by default set preferences to 3
function ratings = parsePreferences(player,maps)
    N = length(maps);
    ratings = 3*ones(N,1); %Default I don't care rating
    
    % Parse File
    f = fopen(['preferences/' player '.md']);
    prefs = textscan(f,'%s %d');
    fclose(f);

    % Get Map Ratings
    for n=1:N
        idx = find(strcmp(prefs{1},maps{n}));
        if( ~isempty(idx) )
            ratings(n) = prefs{2}(idx(1));
        end
    end
end

