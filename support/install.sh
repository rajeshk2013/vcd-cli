#!/usr/bin/env bash
#
# Recreate a Python virtualenv directory and
# install pyvcloud plus any prerequisite modules
#
# The $VIRTUAL_ENV_DIR variable may be used to 
# specify the virtualenv to use.
#
set -e

SHOME=`dirname $0`
cd $SHOME

SRCROOT=`cd ..; pwd`
cd $SRCROOT

VIRTUAL_ENV_DIR=${VIRTUAL_ENV_DIR:-auto.env}

python --version

rm -rf $VIRTUAL_ENV_DIR
python -m venv $VIRTUAL_ENV_DIR

. $VIRTUAL_ENV_DIR/bin/activate
pip install -r requirements.txt
python setup.py install
