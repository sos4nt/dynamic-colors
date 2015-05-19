if [[ ! -o interactive ]]; then
  return
fi

compctl -K _dynamic_colors dynamic-colors

_dynamic_colors() {
  local word words themes
  read -cA words
  word=${words[2]}

  if [ "${#words}" -eq 2 ]; then
    reply=(help init list switch next previous)
  else
    case "$word" in
      switch)
        themes="$(dynamic-colors list)"
        reply=("${(ps:\n:)themes}")
        ;;
    esac
  fi
}
