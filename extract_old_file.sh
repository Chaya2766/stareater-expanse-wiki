echo "paste here the hash of the commit"
read commithash
echo "paste the name of file to be pulled out as full path from git repo to file, eg. 'pages/finespun.html'"
read filepath
echo "now type just the name of the file as it should appear in the extracted files folder"
read filename
git cat-file -p "$commithash:$filepath" > extracted_older_files/$filename
