# Simulink Model Comparison for GitHub Pull Requests
<!-- This is the "Title of the contribution" that was approved during the Community Contribution Review Process --> 

Automate the generation of Simulink model diffs for GitHub® pull requests and push events using GitHub actions. Automatically attach the comparison reports to the pull request or push event for easy viewing outside of MATLAB® and Simulink®. 

## Prerequisites 
1. The GitHub actions, defined in the YML-files, use a self-hosted runner. To add a self-hosted runner to your repository, see https://docs.github.com/en/actions/hosting-your-own-runners.
2. Ensure that you have MATLAB and Simulink installed on the self-hosted runner you are using. See http://www.mathworks.com.

## Setup 
To setup the workflows on GitHub:
1. Download the M-files and YML-files.
2. Add the M-files to your repository.
3. Add the YML-files to the .github/workflows folder in your repository.

To see the setup and the workflow in action, watch https:/... <- To add when YouTube link is provided.

## Details
This repository provides two YML-files and two M-files.
The YML-files setup workflows to be triggered on push and pull request on GitHub. 
The workflows use the M-files to:
1) Get the list of modified model files and their ancestors using Git™ commands.
3) Compare every modified model to its ancestor and publish the comparison report.
2) Upload all model comparison reports to the job when it is complete.
3) Run all project tests.

## License
The license is available in the License file within this repository.

Copyright (c) 2022, The MathWorks, Inc.
