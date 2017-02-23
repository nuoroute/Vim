
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*





# ---Custom Changes---:

# Display current Git branch:
git_branch() {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo -e " \033[33;1;7m($branch)"  # Change the color here. ([33.. - yellow, [32.. - green, [31.. - red)
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo -e " \033[33;1;7m($commit)"
  fi
}

# export PS1="\u@\h \[\033[32m\]\w\$(git_branch)\[\033[00m\] $ "  # user@machine path [branch] $
export PS1="\[\033[00m\]> \[\033[32;1;8m\]\w\$(git_branch)\[\033[00m\] \[\033[00m\]$ \[\033[00m\]"  # > path [branch] $
