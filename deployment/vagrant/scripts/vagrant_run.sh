#!/usr/bin/env bash

PROJECT_VIRTUALENV_NAME=up
WORKON_HOME=/home/vagrant/.virtualenvs
PROJECT_HOME=/vagrant
BASHRC=/home/vagrant/.bashrc
VIRTUALENVWRAPPER_LOCATION=/usr/local/bin/virtualenvwrapper.sh

# Add virtualenvwrapper config to vagrant user's .bashrc
echo '' > $BASHRC
echo '#' [auto]: virtualenvwrapper configs: >> $BASHRC
echo export WORKON_HOME=$WORKON_HOME >> $BASHRC
echo export PROJECT_HOME=$PROJECT_HOME >> $BASHRC
echo source $VIRTUALENVWRAPPER_LOCATION >> $BASHRC
echo '' >> $BASHRC
echo '#' [auto]: Activate the $PROJECT_VIRTUALENV_NAME venv by default >> $BASHRC
echo workon $PROJECT_VIRTUALENV_NAME >> $BASHRC

# Setup the virtualenv
source $VIRTUALENVWRAPPER_LOCATION
mkvirtualenv $PROJECT_VIRTUALENV_NAME
add2virtualenv $PROJECT_HOME
setvirtualenvproject $VIRTUAL_ENV $PROJECT_HOME

# Install requirements
pip install -r $PROJECT_HOME/requirements.txt