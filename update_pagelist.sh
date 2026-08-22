echo "WARNING: THIS WILL MODIFY index.html IN 10 SECONDS"
sleep 10

#check if pagelist marker exists, exit if not
if ! grep -q "<\!PAGELIST>" index.html
then
	echo "failed to find <\!PAGELIST> marker"
	exit 1
fi

sed -n "1,/<\!PAGELIST>/p" index.html > index.html.tmp

echo '<datalist id="pages">' >> index.html.tmp
ls -1 pages/ | grep .html | sed 's/^/<option value="pages\//' | sed 's/$/">/' >> index.html.tmp
echo '</datalist>' >> index.html.tmp

#replace old index file with the new one after all operations succesful
mv index.html.tmp index.html

echo "done"
