CURRENT_LIST=~/dotfiles/current.list
TEMP_LIST=~/dotfiles/temp.list
PACKAGES_LIST=~/dotfiles/packages.list
ROG_LIST=~/dotfiles/rog.list

yay -Qeq > ${CURRENT_LIST}
diff --old-line-format='' --unchanged-line-format='' --new-line-format='%L' ${PACKAGES_LIST} ${CURRENT_LIST} > ${TEMP_LIST}
diff --old-line-format='' --unchanged-line-format='' --new-line-format='%L' ${ROG_LIST} ${TEMP_LIST} > ${PACKAGES_LIST}
sort ${PACKAGES_LIST} > ${TEMP_LIST}

rm ${CURRENT_LIST}
rm ${TEMP_LIST}
exit 0
