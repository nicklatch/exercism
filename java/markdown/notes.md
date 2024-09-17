# Notes

1. Split into lines
2. Iteratate through lines
   1. assign currentLine parseHeading(line)
   2. if parseHeading is null, assign currentLine to parseListItem(line)
   3. if parseListItem is null, assing:wq
   currentLine to parseParagraph(line)
