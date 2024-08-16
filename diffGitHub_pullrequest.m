function diffGitHub_pullrequest(branchname)
    % Open project
    proj = openProject(pwd);

    % List modified models since branch diverged from main
    % Use *** to search recursively for modified SLX files starting in the current folder
    % git diff --name-only main..branchtomerge
    gitCommand = sprintf('git --no-pager diff --name-only origin/main..origin/%s ***.slx', branchname);
    [status,modifiedFiles] = system(gitCommand);
    assert(status==0, modifiedFiles);
    modifiedFiles = split(modifiedFiles);
    modifiedFiles(end) = []; % Removing last element because it is empty
    
    if isempty(modifiedFiles)
        disp('No modified models to compare.')
        return
    end
    
    % Create a temporary folder to store the ancestors of the modified models
    % If you have models with the same name in different folders, consider
    % creating multiple folders to prevent overwriting temporary models
    tempdir = fullfile(proj.RootFolder, "modelscopy");
    mkdir(tempdir)
    
    % Generate a comparison report for every modified model file
    for i = 1:numel(modifiedFiles)
        report = diffToAncestor(tempdir,string(modifiedFiles(i)));
    end
    
    % Delete the temporary folder
    rmdir modelscopy s
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function report = diffToAncestor(tempdir,fileName)
    
    ancestor = getAncestor(tempdir,fileName);

    % Compare models and publish results in a printable report
    % Specify the format using 'pdf', 'html', or 'docx'
    comp= visdiff(ancestor, fileName);
    filter(comp, 'unfiltered');
    report = publish(comp,'html');
    
end


function ancestor = getAncestor(tempdir,fileName)
    
    [relpath, name, ext] = fileparts(fileName);
    ancestor = fullfile(tempdir, name);
    
    % Replace seperators to work with Git and create ancestor file name
    fileName = strrep(fileName, '\', '/');
    ancestor = strrep(sprintf('%s%s%s',ancestor, "_ancestor", ext), '\', '/');
    % Build git command to get ancestor from main
    % git show origin/main:models/modelname.slx > modelscopy/modelname_ancestor.slx
    gitCommand = sprintf('git --no-pager show origin/main:%s > %s', fileName, ancestor);
    
    [status, result] = system(gitCommand);
    assert(status==0, result);

end

%   Copyright 2024 The MathWorks, Inc.
