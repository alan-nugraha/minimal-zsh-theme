autoload -Uz colors vcs_info
colors

setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{yellow}‹%b›%f'
zstyle ':vcs_info:git:*' actionformats ' %F{yellow}‹%b|%a›%f'

precmd() { vcs_info }

prompt_path() {
  local git_root git_sub p parts subparts

  if git rev-parse --is-inside-work-tree &>/dev/null; then
    git_root=$(basename "$(git rev-parse --show-toplevel)")
    git_sub=$(git rev-parse --show-prefix)
    git_sub=${git_sub%/}
    if [[ -n "$git_sub" ]]; then
      IFS='/' read -r -A subparts <<< "$git_sub"
      (( ${#subparts[@]} > 2 )) && git_sub="…/${subparts[-2]}/${subparts[-1]}"
      echo "$git_root/$git_sub"
    else
      echo "$git_root"
    fi
    return
  fi

  p="$PWD"
  [[ "$p" == "$HOME"* ]] && p="~${p#$HOME}"
  IFS='/' read -r -A parts <<< "$p"
  (( ${#parts[@]} > 3 )) && p="…/${parts[-3]}/${parts[-2]}/${parts[-1]}"
  echo "$p"
}

git_dirty() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    if ! git diff --quiet --ignore-submodules -- &>/dev/null; then
      echo "%F{red}*%f"
    fi
  fi
}

PROMPT='%F{blue}%m%f %F{blue}:: %F{green}$(prompt_path)%f${vcs_info_msg_0_}$(git_dirty) %F{blue}»%f '
