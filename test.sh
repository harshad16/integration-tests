#!/usr/bin/env bash

export THOTH_USER_API_HOST=${THOTH_USER_API_HOST:-test.thoth-station.ninja}
export THOTH_MANAGEMENT_API_HOST=${THOTH_MANAGEMENT_API_HOST:-management.test.thoth-station.ninja}

echo -e "------------------------------------------------------------------\n\n"
echo "> Tests are executed against User API at $THOTH_USER_API_HOST"
echo -e "\n\n------------------------------------------------------------------\n\n"

export PIPENV_HIDE_EMOJIS=1
export PIPENV_COLORBLIND=1

[[ $NO_INSTALL -eq "1" ]] || pipenv install --deploy
pipenv --verbose run behave --show-timings
