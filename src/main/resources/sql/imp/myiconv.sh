for file in `file *.txt  | grep ISO | awk  -F:  '{print $1}' $1`
do
  #if test -f $file
  #then
  iconv -f GBK -t UTF-8  < $file > $file-1 
  echo "file: $file"
  #fi
done
