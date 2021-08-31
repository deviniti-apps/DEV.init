#!/usr/bin/env bash

# https://github.com/MrOnyszko/replace-variables

# Sources that helped
# https://stackoverflow.com/a/53552555/5963700
# https://devhints.io/bash
# https://github.com/Fleshgrinder/kotlin-case-format
# https://unix.stackexchange.com/a/494146 https://stackoverflow.com/a/965069/5963700

VAR_RAW_NAME="_RAW_NAME_"
VAR_UPPER_CAMEL_CASE_NAME="_UPPER_CAMEL_CASE_NAME_"
VAR_CAMEL_CASE_NAME="_CAMEL_CASE_NAME_"
VAR_SNAKE_CASE_NAME="_SNAKE_CASE_NAME_"
VAR_DASH_CASE_NAME="_DASH_CASE_NAME_"

VERSION="1.0.0"
ARGUMENT=""
DIR=""
DESTINATION=""
POSTFIX_OFF=0

# Sourced from https://devhints.io/bash
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -h | --help )
    echo ""
    echo "Example usages:"
    echo ""
    echo './replace.sh --argument "magnificent outcome" --type "example" --destination "../hereYouNeedToUseCorrent/Path/Names"'
    echo ""
    echo "Options"
    echo ""
    echo "-h --help : prints help"
    echo "-v --version : prints version"
    echo "-a --argument : the value that is used to replace variables in your template"
    echo "-t --type : the directory of your templates"
    echo "-d --destination : the destination of output"
    echo "-pf --postfix-off : doesn't use template file name as a postfix"
    echo ""
    echo "Possible variables:"
    echo ""
    echo "$VAR_RAW_NAME"
    echo "$VAR_UPPER_CAMEL_CASE_NAME"
    echo "$VAR_CAMEL_CASE_NAME"
    echo "$VAR_SNAKE_CASE_NAME"
    echo "$VAR_DASH_CASE_NAME"
    echo ""
    echo "Templates have to be in \"templates\" directory."
    exit
    ;;
  -v | --version )
    echo "$VERSION"
    exit
    ;;
  -a | --argument )
    shift; ARGUMENT=$1
    ;;
  -t | --type )
    shift; DIR=$1
    ;;
  -d | --destination )
    shift; DESTINATION=$1
    ;;
  -pf | --postfix-off )
    POSTFIX_OFF=1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

# region case conversion

# because bash doesn't have boolean
function invert_boolean() {
  if [[ "$1" == "true" ]]; then
    echo "false";
  else
    echo "true";
  fi;
}

# Bash version of https://github.com/Fleshgrinder/kotlin-case-format
function formatCamelCase() {
  input=$1
  upperCase=$2
  seenSeparator=$upperCase
  seenUpperCase=$(invert_boolean "$upperCase")

  local result="";
  for i in $(seq 1 ${#input}); do
    letter=${input:i-1:1}
    if [[ "$letter" =~ [0-9] ]]; then
      result+=$letter
      seenSeparator="false"
      seenUpperCase="false"
    elif [[ "$letter" =~ [a-z] ]]; then
      if [[ "$seenSeparator" == "true" ]]; then
        result+=$(echo "$letter" | tr '[:lower:]' '[:upper:]')
      else
        result+=$letter
      fi

      seenSeparator="false"
      seenUpperCase="false"
    elif [[ "$letter" =~ [A-Z] ]]; then
      if [[ "$seenUpperCase" == "true" ]]; then
        result+=$(echo "$letter" | tr '[:upper:]' '[:lower:]')
      else
        result+=$letter
      fi
      seenSeparator="false"
      seenUpperCase="true"
    else
      if [[ -n "$letter" ]]; then
        seenSeparator="true"
        seenUpperCase="false"
      fi
    fi
  done
  echo "$result"
}

# Bash version of https://github.com/Fleshgrinder/kotlin-case-format
function formatCase() {
  input=$1
  separator=$2
  upperCase=$3
  seenSeparator="true"
  seenUpperCase="false"

  local result=""
  for i in $(seq 1 ${#input}); do
    letter=${input:i-1:1}
    if [[ "$letter" =~ [0-9] ]]; then
      result+=$letter
      seenSeparator="false"
      seenUpperCase="false"
    elif [[ "$letter" =~ [a-z] ]]; then
      if [[ "$upperCase" == "true" ]]; then
        result+=$(echo "$letter" | tr '[:lower:]' '[:upper:]')
      else
        result+=$letter
      fi

      seenSeparator="false"
      seenUpperCase="false"
    elif [[ "$letter" =~ [A-Z] ]]; then
      if [[ "$seenSeparator" == "false" && "$seenUpperCase" == "false" ]]; then
        result+=$separator
      fi

      if [[ "$upperCase" == "true" ]]; then
        result+=$letter
      else
        result+=$(echo "$letter" | tr '[:upper:]' '[:lower:]')
      fi
      seenSeparator="false"
      seenUpperCase="true"
    else
     if [[ "$seenSeparator" == "false" && "$seenUpperCase" == "false" ]]; then
        result+=$separator
     fi
     seenSeparator="true"
     seenUpperCase="false"
    fi
  done
  echo "$result"
}

# endregion

upperCamelCaseName=$(formatCamelCase "$ARGUMENT" "true")
camelCaseName=$(formatCamelCase "$ARGUMENT" "false")
snakeCaseName=$(formatCase "$ARGUMENT" "_" "false")
dashCaseName=$(formatCase "$ARGUMENT" "-" "false")

function process() {
  shopt -s nullglob dotglob

  sourceDir=$1 # get first argument as a srouce directory
  for entry in "$sourceDir"/*;
  do
    if [[ -d "$entry" ]]; then

      # move to nested directory
      process "$entry"
    else
      fileContent=$(<"$entry") # save file content into variable

      filename=$(basename -- "$entry")
      extension=$([[ "$filename" = *.* ]] && echo ".${filename##*.}" || echo '')
      filenameWithoutExtension=${filename%%.*}


      filenamePostfix="_$filenameWithoutExtension"
      # clear default file name postfix
      if [[ $POSTFIX_OFF == 1 ]]; then
        filenamePostfix=''
      fi


      # create destination file path by replacing template's file name and parent directory
      newFilename="$snakeCaseName$filenamePostfix$extension"
      replaceFilename=${entry/"$filename"/$newFilename}
      replaceDirectorName=${replaceFilename/"$DIR"/$snakeCaseName}
      file="$DESTINATION/$replaceDirectorName"

      # create directories and file
      mkdir -p "$(dirname "$file")" || return; touch "$file";

      # replace all variables in file's content
      output=$(echo "$fileContent" \
        | sed "s/$VAR_UPPER_CAMEL_CASE_NAME/$upperCamelCaseName/g" \
        | sed "s/$VAR_CAMEL_CASE_NAME/$camelCaseName/g" \
        | sed "s/$VAR_SNAKE_CASE_NAME/$snakeCaseName/g" \
        | sed "s/$VAR_DASH_CASE_NAME/$dashCaseName/g" \
        | sed "s/$VAR_RAW_NAME/$ARGUMENT/g")

      # save file content with replaced variables
      echo "$output" > "$file"
    fi
  done
}


# move to tamplates directory
cd 'templates' || exit

process "$DIR"