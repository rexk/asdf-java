asdf_update_java_home() {
  if [[ $L_PWD == $PWD ]]; then
    return
  fi
  export L_PWD=$PWD
  
  local java_path
  java_path="$(asdf which java)"
  if [[ -n "${java_path}" ]]; then
    export JAVA_HOME
    JAVA_HOME="$(dirname "$(dirname "$(realpath "${java_path}")")")"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_java_home
