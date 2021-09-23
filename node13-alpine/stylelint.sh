#!/bin/sh
# Run stylelint, copying in specific styleint rules

# Test if already has a .stylelintrc file. If not, add a temporary one.
if [ -f "./.stylelintrc" ]
then
  stylelint_rc=true
else
  cp /stylelint/.stylelintrc ./.stylelintrc
fi

# Remove temporary .stylelintrc file if created in this process 
if [ "$stylelint_rc" = true ]
then
  stylelint "$@" && echo "--Stylelint complete --" || {
    echo "--Stylelint complete --"
    exit 1;
  }
else
  stylelint "$@" && rm ./.stylelintrc && echo "--Stylelint complete --" || {
    echo "--Stylelint complete --"
    rm ./.stylelintrc 
    exit 1;
  }
fi