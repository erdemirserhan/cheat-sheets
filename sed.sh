# Replace all the text inside a yml file of a directory
sed -i 's/<replaceme>/<withthisonehere>/g' *.yml

# Replace x(int) line with the date on a Dockerfile
sed -i "xs/.*/# $(date)/" Dockerfile

# Search and Replace a text inside a file that begins with #
sed -i -e "s/^#\?<yourstringhere>.*/<yourstringhere> = <newvaluehere>/g
# -i for editing
# -e for the command to be executed
# s/ is for a substitution operation
# ^#\?<yourstringhere>.* matches any line that starts with an optional "#" character followed by "<yourstringhere>" and any other characters.
# yourstringhere> = <newvaluehere> is the replacement string, which replaces the matched text in the input file.
# /g indicates that the replacement should be performed globally, i.e., on all occurrences of the matched pattern in the file.
