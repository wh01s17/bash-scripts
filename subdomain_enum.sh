function subdomain_enum() {
    local domain="$1"
    [[ -z "$domain" ]] && { echo "Uso: subdomain_enum <dominio>"; return 1; }

    echo "[*] Enumerando subdominios para: $domain"
    local tmpfile=$(mktemp)

    if command -v subfinder >/dev/null 2>&1; then
        echo "[+] Usando subfinder..."
        subfinder -d "$domain" -silent >> "$tmpfile"
    else
        echo "[!] subfinder no está instalado."
    fi

    if command -v amass >/dev/null 2>&1; then
        echo "[+] Usando amass (modo pasivo)..."
        amass enum -passive -d "$domain" >> "$tmpfile"
    else
        echo "[!] amass no está instalado."
    fi

    echo
    echo "[*] Subdominios únicos encontrados:"
    sort -u "$tmpfile"
    rm "$tmpfile"
}