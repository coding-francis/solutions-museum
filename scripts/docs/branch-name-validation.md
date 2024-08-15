# Branch Name Validation Script

## Overview
- This script validates Git branch names to ensure they follow a specified naming convention. It uses a regular expression to check if the branch name is valid based on predefined rules. This helps maintain consistency in branch naming across your repository.


## Usage
1. Save the script to a file, e.g., validate-branch-name.sh.

2. Make the script executable: chmod +x validate-branch-name.sh.

3. Run the script by passing the branch name as an argument (optional). If no argument is provided, it will validate the current branch name:

``` 
    ./validate-branch-name.sh <branch-name>
```
If the branch name is not provided, it defaults to the current local branch name.

## Validation Rules
- #### Valid Branch Names:
    - Optionally start with fix/, feat/, perf/, style/, test/, or refactor/.
    - Must include TICKET_NAME or TICKET_ID.
    - Must end with alphanumeric characters or hyphens.

Example of valid branch names:
- feat/TICKET_NAME-description
- fix/TICKET_ID-fix-description

- #### Reserved Branch Names
    - Branch names like dev, staging, and production are considered valid without validation.

## Benefits
- Ticket Organization: Helps organize and track assigned tasks and tickets on project management consoles, as it reflect the ticket id, correspondent to a PR activity or branch name on VCS platforms
- Consistency: Ensures all branch names follow a standardized format, which helps maintain consistency across your repository.
- Clarity: Helps developers understand the purpose of the branch at a glance, based on the naming convention.
- Automation: Integrates easily into CI/CD pipelines to enforce branch naming rules automatically.
- Error Prevention: Prevents the use of invalid branch names, reducing potential issues during development and integration.