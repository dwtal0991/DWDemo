#!/bin/bash
origin_path=$PWD
echo "origin_path:$origin_path"
dir_path=$(dirname ${origin_path})
echo "$(basename $PWD)"
if [ "$(basename $PWD)" == "fastlane" ];then
  dir_path=$(dirname ${dir_path})
fi
flutter_module_path="$dir_path/flutter_module"
voip_path="$dir_path/VoIPBaseForiOS-IOT"
echo "dir_path:$dir_path"
echo "cd:$flutter_module_path"
cd $flutter_module_path
git checkout develop
git pull
echo "cd:$voip_path"
cd $voip_path
git checkout develop
git pull
git checkout $1
echo "voipBaseForiOS: git checkout $1"
git pull
cd $origin_path

