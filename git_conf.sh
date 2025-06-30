# Función para configurar Git con nombre de usuario, email y token
# Puedes agregarla a tu ~/.zshrc o ~/.bashrc

function git_config () {
    username="$1"
    email="$2"
    git_token="$3"

    if [[ -z "$username" || -z  "$email" || -z "$git_token" ]]; then
        echo "Use: git_config <UserName> <Email> <Git Token>"
        return 1
    fi

    git config --global user.email "$email"
    git config --global user.name "$username"
    git config --global core.autocrlf input

    if command -v code >/dev/null 2>&1; then
        git config --global core.editor "code --wait"
    else
        echo "[!] VS Code ('code') is not installed or not in PATH. Skipping editor configuration."
    fi

    git config --global credential.helper store

    echo "https://$username:$git_token@github.com" > ~/.git-credentials

    echo "[+] Git successfully configured for '$username'"
}
