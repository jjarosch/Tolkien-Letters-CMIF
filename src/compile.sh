bash csv2xml.sh
saxonb-xslt -o ../letters.xml letters_tmp.xml cmif.xsl
rm letters_tmp.xml
