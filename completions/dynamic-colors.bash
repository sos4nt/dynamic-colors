_dynamic_colors() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="help init list switch next previous"

  case "${prev}" in
      switch)
        local themes=$(dynamic-colors list)
        COMPREPLY=( $(compgen -W "${themes}" -- ${cur}) )
        return 0
        ;;
    *)
    ;;
  esac

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}

complete -F _dynamic_colors dynamic-colors
