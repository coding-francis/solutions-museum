#!/bin/bash

# Load package.json and whitelist.json
package_json=$(jq -r '.dependencies, .devDependencies | to_entries[] | "\(.key)=\(.value)"' ./package.json)
leaves_service_json=$(jq -r '.dependencies, .devDependencies | to_entries[] | "\(.key)=\(.value)"' ./whitelist.json)

# Convert to associative arrays
declare -A package_json_arr
for entry in $package_json; do
    key=${entry%=*}
    value=${entry#*=}
    package_json_arr["$key"]="$value"
done

declare -A whitelist_json_arr
for entry in $leaves_service_json; do
    key=${entry%=*}
    value=${entry#*=}
    whitelist_json_arr["$key"]="$value"
done

# Find unauthorized dependencies
unauthorized_dependencies=()

for package_name in "${!package_json_arr[@]}"; do
    package_version="${package_json_arr[$package_name]}"
    whitelist_version="${whitelist_json_arr[$package_name]}"

    if [[ -z "$whitelist_version" || "$whitelist_version" != "$package_version" ]]; then
        unauthorized_dependencies+=("$package_name")
    fi
done

# Report unauthorized dependencies or successful validation
if [ ${#unauthorized_dependencies[@]} -gt 0 ]; then
    echo "Unauthorized dependencies found: ${unauthorized_dependencies[@]}"
    exit 1
else
    echo "Package scan and validation done"
fi
