#!/bin/sh

function workon() {  
  venv_name=$1
  
  if [ -z "$venv_name" ] 
  then
    echo "Venv's name should not be empty"
    return 
  fi

  source $VENVS_DIR/$venv_name/bin/activate
}

function mkvenv() {
  venv_name=""
  venv_dir=""
  python_path=""

  while getopts ':n:l:p:' flag;
  do
    case $flag in
        n) venv_name=$OPTARG;;
        l) venv_dir=$OPTARG;;
        p) python_path=$OPTARG;;
    esac
  done
  
  echo $venv_name
  if [ -z "$venv_name" ] 
  then
    echo "Venv's name should not be empty"
    return
  fi

  if [ -z "$venv_dir" ] 
  then
    venv_dir=$VENVS_DIR
  fi

  if [ -z "$python_path" ] 
  then
    python_path="/usr/bin/python3"
  fi
   
  $python_path -m venv $venv_dir/$venv_name
}

function rmvenv() {
  venv_name=$1
  venv_dir=$2

  if [ -z "$venv_name" ] 
  then
    echo "No venv name given"
    return
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

  
