#/usr/bin/env bash

TOOL=~/research/AlignmentTools/src/tools

## train
#input_file_1=../data/train_raw_label_filename.txt
#input_file_2=../data/train_raw_label_shape.txt
#output_file_1=../data/crop_new/train.txt
#output_folder=../data/crop_new/train/
#padding_ratio=3
#input_folder=../data/

## train frontal
#input_file_1=../data/train_raw_label_filename.txt
#input_file_2=../data/train_raw_label_shape.txt
#input_file_3=../data/crop_new/mean_shape.txt
#output_file_1=../data/crop_new/train_frontal.txt
#output_folder=../data/crop_new/train_frontal/
#padding_ratio=0
#input_folder=../data/

# 300VW
for folder in `ls ../data2/image`
do
  echo $folder
  mkdir ../data/crop_300VW/$folder
  cut -d' ' -f1-136 ../data2/image/$folder/label.txt > ../data2/image/$folder/shape.txt
  cut -d' ' -f137 ../data2/image/$folder/label.txt > ../data2/image/$folder/filename.txt
  input_file_1=../data2/image/$folder/filename.txt
  input_file_2=../data2/image/$folder/shape.txt
  input_file_3=../data/crop_new/mean_shape.txt
  output_file_1=../data/crop_300VW/$folder/label.txt
  output_folder=../data/crop_300VW/$folder/
  padding_ratio=0
  input_folder=../data2/image/

## test
#input_file_1=../data/test_raw_label_filename.txt
#input_file_2=../data/test_raw_label_shape.txt
#output_file_1=../data/crop_new/test.txt
#output_folder=../data/crop_new/test/
#padding_ratio=3
#input_folder=../data/

label_num=136
output_width=540
output_height=540
thread_num=3

$TOOL --command=crop_face\
  --input_file_1=$input_file_1 \
  --input_file_2=$input_file_2 \
  --input_file_3=$input_file_3 \
  --input_folder=$input_folder \
  --output_folder=$output_folder \
  --output_file_1=$output_file_1 \
  --label_num=$label_num \
  --output_width=$output_width \
  --output_height=$output_height \
  --padding_ratio=$padding_ratio \
  --thread_num=$thread_num
done
