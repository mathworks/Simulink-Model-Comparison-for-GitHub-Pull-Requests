# Simulink Model Comparison for GitHub Pull Requests
<!-- This is the "Title of the contribution" that was approved during the Community Contribution Review Process --> 

Automate the generation of Simulink model diffs for GitHub® pull requests and push events using GitHub actions. Automatically attach the comparison reports to the pull request or push event for easy viewing outside of MATLAB® and Simulink®. 

## Prerequisites 
1. The GitHub actions, defined in the .yml files, use a self-hosted runner. To add a self-hosted runner to your repository, see https://docs.github.com/en/actions/hosting-your-own-runners.
2. Ensure that you have MATLAB and Simulink installed on the self-hosted runner you are using. See http://www.mathworks.com.

## Setup 
To set up the workflows on GitHub:
1. Download the .m files and .yml files.
2. Add the .m files to your repository.
3. Add the .yml files to the .github/workflows folder in your repository.

To see the setup and the workflow in action, watch https://www.youtube.com/watch?v=PNX7f0kPSYg.

## Details
This repository provides two .yml files and two .m files.
The .yml files set up workflows to be triggered on push and pull request on GitHub. 
The workflows use the .m files to:
1) Get the list of modified model files and their ancestors using Git™ commands.
3) Compare every modified model to its ancestor and publish the comparison report.
2) Upload all model comparison reports to the job when it is complete.
3) Run all project tests.

## License
The license is available in the License file within this repository.

Copyright (c) 2022, The MathWorks, Inc.
