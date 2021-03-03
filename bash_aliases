ALIASES_DIR="${GREG_CFG_DIR}/bash_aliases.d/"

for sh in ${ALIASES_DIR}/*.sh; do
  . ${sh}
done

unset ALIASES_DIR
