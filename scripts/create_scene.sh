#!/bin/bash

while getopts n:o: OPT
do
  case $OPT in
    "n" ) FLG_N="TRUE" ; VALUE_N="$OPTARG" ;;
    "o" ) FLG_O="TRUE" ; VALUE_O="$OPTARG" ;;
    * ) echo "Set scene name [-n scene_name] and output path [-o /PATH/TO/OUTPUTS]"
        exit 1 ;;
  esac
done

if [ "$FLG_N" = "TRUE" ]; then
  echo "$VALUE_N"
fi

if [ "$FLG_O" = "TRUE" ]; then
  echo "$VALUE_O"
fi

SCENE_NAME=$VALUE_N
OUTPUT_PATH=$VALUE_O/$VALUE_N

rm -rf $OUTPUT_PATH
mkdir $OUTPUT_PATH

# cd $OUTPUT_PATH

touch $OUTPUT_PATH/${SCENE_NAME}.swift
touch $OUTPUT_PATH/${SCENE_NAME}ViewController.swift
touch $OUTPUT_PATH/${SCENE_NAME}Presenter.swift
touch $OUTPUT_PATH/${SCENE_NAME}Interactor.swift

sourcery --sources $OUTPUT_PATH/${SCENE_NAME}.swift --templates ./scripts/templates/test.stencil --output $OUTPUT_PATH/${SCENE_NAME}.swift