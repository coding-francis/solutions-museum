# Dependency Management and Security Guidelines (for Node Applications)

## Overview
This document outlines the guidelines and best practices for managing external code and package dependencies within our projects. These practices are essential for maintaining a secure, stable, and reliable software development environment. By adhering to these guidelines, you can minimize risks associated with external dependencies and ensure that our software distribution process is dependable and uniform.

This workflow prevents developers from haphazardly adding packages, which could potentially be vulnerable, insecure, unlicensed, or lacking support from a community. Such restrictions safeguard the application from potential risks and vulnerabilities.

To add a new dependency, the technical lead, or team lead must assess and approve the usage of the package and include it in list of whitelisted packages, to allow new packages to be installed.

## Usage
#### Prerequisites
Before using the script, ensure you have the following:
- jq: The script requires jq to parse JSON files. Install jq using your package manage:

    - On Ubuntu/Debian: sudo apt-get install jq
    - On macOS: brew install jq
    - On CentOS/RHEL: sudo yum install jq

#### Running the Script
1. Place the Script: Save the script as `node-whitelist-dependencies.sh`.
2. Make the Script Executable:
``` 
    chmod +x node-whitelist-dependencies.sh
```
3. Run the Script:
```
    ./node-whitelist-dependencies.sh
```

The script will: 
- Load the dependencies and devDependencies from package.json.
- Load the whitelisted dependencies from whitelist.json.
- Compare the packages in package.json with those in whitelist.json.
- Report any unauthorized dependencies or confirm that all dependencies are authorized.

#### Example Output
- When Unauthorized Dependencies Are Found:
```
Unauthorized dependencies found: [dependency1, dependency2]
```
The script will exit with a status of 1.

- When All Dependencies Are Authorized:
```
Package scan and validation done
```
The script will exit with a status of 0.

### Integrating the Script in CI/CD Pipeline
To automate the validation process, you can integrate the script into your Continuous Integration (CI) pipeline. Add the following step to your CI configuration file (e.g., .github/workflows/ci.yml, Jenkinsfile, etc.):

Here is a sample workflow file that implements the script
```
- name: Validate Dependencies
  run: ./node-whitelist-dependencies.sh

```

## Key Points
1. Package Versioning Policies
- Consistent Versioning: Enforce clear and consistent versioning policies for all packages used within our projects.

- Tested and Approved Versions: Ensure that only versions of packages that have been thoroughly tested and approved for compatibility, security, and stability are used.

- Deprecation Policy: Implement a policy for deprecating outdated or incompatible versions of packages, ensuring that developers upgrade to newer, secure versions.

2. License Compliance
- License Checks: Enforce strict license compliance checks to avoid legal issues associated with open-source licenses.

- Documenting Licenses: Ensure that all packages used in our projects have clearly documented licenses.

- License Review: Regularly review the licenses of all packages in use to ensure compliance with our organization's policies.

3. Community and Vendor Support
- Package Selection: Prioritize the use of packages that have active and reliable community or vendor support.

- Maintenance and Updates: Choose packages that receive regular updates, bug fixes, and security patches, reducing long-term maintenance and security challenges.

- Support Evaluation: Continuously evaluate the support level of the packages we use and consider alternatives if support becomes insufficient.

