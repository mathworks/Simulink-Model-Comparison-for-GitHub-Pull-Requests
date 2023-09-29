# Simulink Model Comparison for GitHub Pull Requests
<!-- This is the "Title of the contribution" that was approved during the Community Contribution Review Process --> 

Automate the generation of Simulink model diffs for GitHub® pull requests and push events using GitHub actions. Automatically attach the comparison reports to the pull request or push event for easy viewing outside of MATLAB® and Simulink®.

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=mathworks/Simulink-Model-Comparison-for-GitHub-Pull-Requests)

## Prerequisites 
1. The GitHub actions, defined in the Diff_runTests_push.yml and Diff_runTests_pullrequest.yml files, use a self-hosted runner. To add a self-hosted runner to your repository, see https://docs.github.com/en/actions/hosting-your-own-runners.
Using a self-hosted runner enables you to keep your repository private.
2. Ensure that you have MATLAB and Simulink installed on the self-hosted runner you are using. See https://www.mathworks.com.

Alternatively, if you prefer to use a GitHub-hosted runner, use the actions defined in the githubrunner_push.yml and githubrunner_pullrequest.yml files instead.

## Setup 
To set up the workflows on GitHub:
1. Download the .m files and .yml files.
2. Add the .m files to your repository.
3. Add the .yml files to the .github/workflows folder in your repository.

To see the setup and the workflow in action, watch https://www.youtube.com/watch?v=PNX7f0kPSYg.

Visit https://www.mathworks.com/help/simulink/ug/model-diff-pull-requests.html.

## Details
This repository provides two .yml files and two .m files.
The .yml files set up workflows to be triggered on push and pull request on GitHub. 
The workflows use the .m files to:
1) Get the list of modified model files and their ancestors using Git™ commands.
3) Compare every modified model to its ancestor and publish the comparison report.
2) Upload all model comparison reports to the job when it is complete.
3) Run all project tests.

## Notes
1) Taking screenshots to include in the comparison report requires your runner to have a display.  
On Linux, if your runner does not have a display, you can use one of the following workarounds in your YAML files:
- Start a display server before the "Compare Models to Ancestors" step. For an example, see the "Start Display Server" step in the githubrunner_pullrequest.yml file.
- Use xvfb-run to run commands on a display server implementing the X11 display server protocol.  
For example, in your .yml file, use:   
```yaml
 - name: Compare Models to Ancestors  
   run: xvfb-run path-to-matlab/bin/matlab -batch "branch ='${{ github.head_ref }}'; diffGitHub_pullrequest(branch)"
```

2) Starting in R2022b, the Comparison Tool allows you to generate comparison reports with no screenshots when you run jobs on a no-display machine.

## License
The license is available in the License file within this repository.

Copyright (c) 2022-2023, The MathWorks, Inc.
