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
OUTPUT_PATH=$VALUE_O

rm -rf $OUTPUT_PATH/$SCENE_NAME
mkdir $OUTPUT_PATH/$SCENE_NAME

sourcery --sources ./scripts/templates/Empty.swift \
--templates ./scripts/templates/scene.stencil \
--output ./$OUTPUT_PATH/${SCENE_NAME}/${SCENE_NAME}.swift \
--args name=${SCENE_NAME}

sourcery --sources ./scripts/templates/Empty.swift \
--templates ./scripts/templates/interactor.stencil \
--output ./$OUTPUT_PATH/${SCENE_NAME}/${SCENE_NAME}Interactor.swift \
--args name=${SCENE_NAME}

sourcery --sources ./scripts/templates/Empty.swift \
--templates ./scripts/templates/presenter.stencil \
--output ./$OUTPUT_PATH/${SCENE_NAME}/${SCENE_NAME}Presenter.swift \
--args name=${SCENE_NAME}

sourcery --sources ./scripts/templates/Empty.swift \
--templates ./scripts/templates/viewcontroller.stencil \
--output ./$OUTPUT_PATH/${SCENE_NAME}/${SCENE_NAME}ViewController.swift \
--args name=${SCENE_NAME}

cp ./scripts/templates/Storyboard.storyboard ./$OUTPUT_PATH/${SCENE_NAME}/${SCENE_NAME}.storyboard

xcodegen generate
