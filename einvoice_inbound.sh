#!/bin/bash

source /infra/platform/app1/bin/vars_einvoice_inbound

cd $SOURCE_DIR
echo "Moving files from $SOURCE_DIR to $DESTINATION_DIR"

WHITE_LIST=`cat $START_DIR/white_list`

for k in $WHITE_LIST;
  do
  for i in $SOURCE_DIR/$k/purap_einvoice_*.xml;
    do
     z=${i##*/}
     echo "Z is $z" 
     if [[ "$z" == "purap_einvoice_*.xml" ]]
       then
         echo "No files in $START_DIR/$k"
       else
	 echo "moving files"
         touch $DESTINATION_DIR/${z%%.xml}.done;
         mv $i $DESTINATION_DIR/${z};
     fi
  done
done;
cd $START_DIR
