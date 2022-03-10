#!/bin/sh

function workon() {  
  venv_name=$1
  source $VENVS_DIR/$venv_name/bin/activate
}

function mkvenv() {
  venv_name=$1
  venv_dir=$2
  python_v=$3

  if [ -z "$venv_dir" ] 
  then
    venv_dir=$VENVS_DIR
  fi

  if [ -z "$python_v" ] 
  then
    python_v="/usr/bin/python3"
  fi
   
  $python_v -m venv $venv_dir/$venv_name
}

function rmvenv() {
  venv_name=$1
  venv_dir=$2

  if [ -z "$venv_name" ] 
  then
    echo "No venv name given"
    exit
  fi
  
  if [ -z "$venv_dir" ] 
  then
    venv_dir=$VENVS_DIR
  fi

  rm -rf $venv_dir/$venv_name
}

function list_venvs() {
  venv_dir=$1

  if [ -z "$venv_dir" ] 
  then
    venv_dir=$VENVS_DIR
  fi
  for i in $(ls $venv_dir); do echo ${i%%/}; done
}

  
