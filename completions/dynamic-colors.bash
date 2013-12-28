_dynamic_colors() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="help edit init list switch audit create"

  case "${prev}" in
      switch|edit|audit)
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
