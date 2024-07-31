files=$(find . -size +100M);
cat .gitignore | grep -v '^#' | grep -v '^$' | while read line; do
  files=$(echo "$files" | grep "$line");
done
if [ -n "$files" ]; then
  echo -e "\033[1;31mOver 100M files detected.\033[0m";
  for file in $files; do
    echo -e "\033[1;31m$file\033[0m";
  done
  echo -ne "\033[1;32mAdd the files to .gitignore file? (y/N)\033[0m";
  read answer;
  if [ "$answer" = "y" ]; then
    for file in $files; do
      echo "${file}" >> .gitignore;
    done
  else
    echo -e "\033[31mPlease remove the files and try again.\033[0m";
  fi
fi
git add --all;
