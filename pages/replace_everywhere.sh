echo "Type in the text to be replaced: "
read to_replace
echo "Files containing text '$to_replace'"
grep -RIn --include="*.html" "$to_replace"

echo "Type in the text to replace with: "
read replace_with
find . -type f -name '*.html' -exec sed -i "s|$to_replace|$replace_with|g" {} +
