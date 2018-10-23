if command -v chef >/dev/null 2>&1; then
  eval "$(chef shell-init bash)"
fi