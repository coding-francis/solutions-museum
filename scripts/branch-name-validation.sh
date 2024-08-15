#!/bin/bash
get_pr_branch_name="$1"
local_branch_name="$(git rev-parse --abbrev-ref HEAD)"
branchName=''

if [[ -z "$get_pr_branch_name" ]]; then
  echo "$local_branch_name"
  branchName="$local_branch_name"
else
  echo "$get_pr_branch_name"
  branchName="$get_pr_branch_name"
  # Reserved/Protected branch names
  if [[ "$branchName" == "dev" || "$branchName" == "staging" ||  "$branchName" == "production" ]]; then
      exit 0
  fi
fi

# A valid branch name should optionally begin with any of [fix|feat|perf|style|test|refactor] and must strictly include a 
# TICKET_NAME or TICKET_ID and end with any alphaumeric characters to furthur label and describe what the branch is for
 
valid_branch_regex='^((fix|feat|perf|style|test|refactor)\/)?(TICKET_NAME|TICKET_ID)\-[a-zA-Z0-9\-]+$'

message="
        🚫⚠️🚫⚠️🚫⚠️🚫⚠️🚫⚠️🚫⚠️🚫⚠️🚫⚠️🚫⚠️🚫⚠️
        Branch name validation failed
        You should rename your branch to a valid name
        Branch names must include TICKET_NAME OR TICKET_ID
        Example (feat/TICKET_NAME, fix/TICKET_NAME etc )
        Please check and try again.
        "

if [[ ! "$branchName" =~ $valid_branch_regex ]]; then
    echo "$message"
    exit 1
else
    echo 'Branch name is valid 🔥🔥🔥🔥'
fi
exit 0
