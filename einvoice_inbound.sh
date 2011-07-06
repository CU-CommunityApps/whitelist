#!/bin/bash

source vars_einvoice_inbound

START_DIR=$PWD
cd $SOURCE_DIR
echo "Moving files from $SOURCE_DIR to $DESTINATION_DIR"

for i in einv_*/purap_einvoice_*.xml;
  do
   j=${i##einv_*/}
   touch $DESTINATION_DIR/${j%%.xml}.done;
   mv $i $DESTINATION_DIR/${j};
done;

cd $START_DIR
