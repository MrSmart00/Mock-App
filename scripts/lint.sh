git diff --name-only | grep .swift | while read filename; do
  "swiftlint" --path "$filename"
done
