#!/bin/bash

source /infra/platform/app1/bin/vars_einvoice_inbound

cd $SOURCE_DIR
echo "Moving files from $SOURCE_DIR to $DESTINATION_DIR"

WHITE_LIST=`cat $START_DIR/white_list`

if [[ ! -e $DESTINATION_DIR/duplicates ]]
 then
  mkdir $DESTINATION_DIR/duplicates
fi

for k in $WHITE_LIST;
  do
  for i in $SOURCE_DIR/$k/purap_einvoice_*.xml;
    do
     z=${i##*/}
     if [[ "$z" == "purap_einvoice_*.xml" ]]
       then
         echo "No files in $START_DIR/$k"
       else
	 echo "moving files"
	 if [[ -e $DESTINATION_DIR/${z} ]]
	   then
	     echo "A file named $z already exists in \"$SOURCE_DIR\", moving file to \"${SOURCE_DIR}duplicates\" directory"
             mv $i $DESTINATION_DIR/duplicates/${z};
           else
             echo "File moved successfully"
             mv $i $DESTINATION_DIR/${z};
         fi
     fi
  done
done;
cd $START_DIR
