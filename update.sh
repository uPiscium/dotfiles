CURRENT_LIST=~/dotfiles/current.list
TEMP_LIST=~/dotfiles/temp.list
PACKAGES_LIST=~/dotfiles/packages.list
ROG_LIST=~/dotfiles/rog.list

echo -e "\033[1;32mUpdating 'packages.list'...\033[0m"
yay -Qeq > ${CURRENT_LIST}
diff --old-line-format='' --unchanged-line-format='' --new-line-format='%L' ${PACKAGES_LIST} ${CURRENT_LIST} > ${TEMP_LIST}
diff --old-line-format='' --unchanged-line-format='' --new-line-format='%L' ${ROG_LIST} ${TEMP_LIST} > ${PACKAGES_LIST}
sort ${PACKAGES_LIST} > ${TEMP_LIST}

rm ${CURRENT_LIST}
rm ${TEMP_LIST}
echo -e "\033[1;32mDone!\033[0m"
exit 0
