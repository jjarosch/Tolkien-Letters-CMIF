file_in="letters.csv"
file_out="letters_tmp.xml"
IFS=$',' read -r -a colnames < <(head -n +1 $file_in)
echo '<?xml version="1.0"?>' > $file_out
echo '<csv>' >> $file_out
while IFS=$',' read -r -a rowarray
do
  row="<row>\n"
  for index in "${!colnames[@]}"; do
    row="${row}  <${colnames[$index]}>${rowarray[$index]}</${colnames[$index]}>\n"
  done
  row="${row}</row>"
  echo -e ${row} >> $file_out
done < <(tail -n +2 $file_in)
echo '</csv>' >> $file_out
