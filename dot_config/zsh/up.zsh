function up {
  if (( $# )); then
    if [[ $1 =~ '^[1-9][0-9]*$' ]]; then
      local p=''
      for _ in {1..$1}; do
        p="${p}../"
      done
      cd "$p"
    else
      printf 'Usage: up <num>\n' >&2
      return 1
    fi
  else
    cd ..
  fi
}
