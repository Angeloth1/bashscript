#!/bin/sh


echo 'the file typies that I can covert are:
1. docx
2. html
3. latex
4. epub'
read -p "Please give the the number of the output type and the file.md name (for example 1 README.md for  docx): " var f
file=$f

# because some of the formats does not support the crossed text I dump it
sed -i 's/~/ /' $file
sed -i 's/.~/./' $file


if [ $var -eq 1 ] ; then
	echo "creating the docx"
	pandoc -s $file -o README.docx
elif [ $var -eq 2 ] ; then
	echo "creating the html"
	pandoc --css=styling.css -s -f markdown+smart --toc --metadata \
 pagetitle="TestPage" --to=html5 $file \
 -o README.html
elif [ $var -eq 3 ] ; then
	echo "creating the tex"
	pandoc -s $file -o README.tex
elif [ $var -eq 4 ] ; then
	echo "creating the epub"
	pandoc -s $file -o README.epub
else
	echo "FALSE INPUT"
fi



# This programm can be use with any md file.
# I use a version of my report as test file to see If everything is working as expected.
