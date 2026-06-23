#!/bin/bash
set -e

# Ensure VERSION is passed from the environment
if [ -z "$VERSION" ]; then
  echo "Error: VERSION environment variable is not set."
  exit 1
fi

# SKILL CONFIGURATION
# Format: "skill-name" "prebuilt" "toolset" "description"
# Looker ships two separate prebuilt configs (looker, looker-dev), each with its
# own toolset, and the skill names do not follow a "<prefix>-<toolset>"
# convention, so prebuilt + toolset + name are all configured explicitly.
SKILLS=(
  "looker"
  "looker"
  "looker_tools"
  "These skills are designed for data discovery and business intelligence. "

  "looker-dev"
  "looker-dev"
  "looker_dev_tools"
  "These skills are built for LookML developers, data engineers, and administrators who manage the backbone of Looker."
)

echo "VALIDATING TOOLSETS BEFORE GENERATION"

# Collect the unique prebuilt configs referenced by the SKILLS array.
PREBUILTS=()
set -- "${SKILLS[@]}"
while [ $# -gt 0 ]; do
  prebuilt="$2"
  case " ${PREBUILTS[*]} " in
    *" ${prebuilt} "*) ;;
    *) PREBUILTS+=("$prebuilt") ;;
  esac
  shift 4
done

# Validate each prebuilt's upstream toolsets against the toolsets we generate
# from that prebuilt. A new upstream toolset fails the job until a generator is
# added to the SKILLS array.
for prebuilt in "${PREBUILTS[@]}"; do
  # Supported toolsets for this specific prebuilt.
  SUPPORTED_TOOLSETS=()
  set -- "${SKILLS[@]}"
  while [ $# -gt 0 ]; do
    if [ "$2" = "$prebuilt" ]; then
      SUPPORTED_TOOLSETS+=("$3")
    fi
    shift 4
  done

  echo "Prebuilt '$prebuilt' supported toolsets: ${SUPPORTED_TOOLSETS[*]}"

  # Fetch the upstream source of truth YAML for this prebuilt and version.
  RAW_URL="https://raw.githubusercontent.com/googleapis/mcp-toolbox/v${VERSION}/internal/prebuiltconfigs/tools/${prebuilt}.yaml"
  echo "Fetching upstream config from: $RAW_URL"
  UPSTREAM_YAML=$(curl -sL --fail "$RAW_URL" || { echo "Error: Could not fetch upstream YAML for $prebuilt v$VERSION"; exit 1; })

  # Extract the list of toolsets. Each toolset is its own YAML document:
  #   kind: toolset
  #   name: <toolset>
  UPSTREAM_TOOLSETS=$(echo "$UPSTREAM_YAML" | awk '$1=="kind:" && $2=="toolset"{f=1; next} f && $1=="name:"{print $2; f=0}')

  for upstream_tool in $UPSTREAM_TOOLSETS; do
    if [ -z "$upstream_tool" ] || [ "$upstream_tool" == "-" ]; then continue; fi

    if [[ ! " ${SUPPORTED_TOOLSETS[*]} " =~ " ${upstream_tool} " ]]; then
      echo "ERROR: Upstream config '$prebuilt' contains a new toolset: '$upstream_tool'"
      echo "PIPELINE FAILED: Missing Toolset Generators"
      echo "The source of truth file has toolsets that your script does not support."
      echo "Please update the SKILLS array in generate_skills.sh to include a generator"
      echo "for the missing toolset above, then commit your changes to unblock this PR."
      exit 1
    fi
  done
done

echo "Validation passed. All upstream toolsets are supported."

echo "BEGINNING SKILL GENERATION"

LICENSE_HEADER="// Copyright 2026 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the \"License\");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an \"AS IS\" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License."

ADDITIONAL_NOTES="Note: The scripts automatically load the environment variables from various .env files. Do not ask the user to set vars unless skill executions fails due to env var absence."

# Base Command Function
generate_skill() {
  local SKILL_NAME="$1"
  local PREBUILT="$2"
  local TOOLSET="$3"
  local SKILL_DESC="$4"

  echo "Generating skill: $SKILL_NAME (prebuilt: $PREBUILT)..."

  npx "@toolbox-sdk/server@${VERSION}" --prebuilt "$PREBUILT" skills-generate \
    --name "$SKILL_NAME" \
    --description "$SKILL_DESC" \
    --toolset="$TOOLSET" \
    --license-header "$LICENSE_HEADER" \
    --additional-notes="$ADDITIONAL_NOTES"
}

set -- "${SKILLS[@]}"
while [ $# -gt 0 ]; do
  generate_skill "$1" "$2" "$3" "$4"
  shift 4
done

echo "All skills generated successfully!"
