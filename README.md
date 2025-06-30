# 🐚 BASH Scripts

Colección de funciones útiles escritas en **Bash** para automatizar tareas comunes, especialmente orientadas a *OSINT*, networking y desarrollo.  
Estas funciones están pensadas para ser incluidas directamente en tu `~/.bashrc` o `~/.zshrc`.

---

## 📦 Instalación

Clona este repositorio:

```bash
git clone https://github.com/wh01s17/bash-scripts.git
```

Luego, edita tu archivo de configuración (~/.bashrc o ~/.zshrc) y agrega:
```bash
source /ruta/al/repositorio/bash-scripts/git_conf.sh
source /ruta/al/repositorio/bash-scripts/ipinfo.sh
source /ruta/al/repositorio/bash-scripts/subdomain_enum.sh
```

También puedes copiar las funciones que necesites directamente.

## 📂 Scripts incluidos

- **git_conf.sh**  
  Función para configurar Git con usuario, email y token de acceso personal.  
  Evita que Git pida usuario y contraseña en cada push al usar el helper `store`.  
  Uso:  
  ```bash
  git_config <username> <email> <git_token>
  ```

- **ipinfo.sh**  
  Función para recolectar información geográfica, WHOIS y otros datos de una IP desde múltiples fuentes públicas.  
  Uso:  
  ```bash
  ipinfo <IP> [--whois|--geo|--info]
  ```

- **subdomain_enum.sh**  
  Función para enumerar subdominios pasivamente usando herramientas como subfinder y amass. 
  Uso:  
  ```bash
  subdomain_enum <dominio>
  ```

---

# ✅ Requisitos
Algunas funciones requieren herramientas externas:

- jq – Para procesar JSON

- curl – Para hacer peticiones HTTP

- subfinder

- amass

- whois, host, etc.

---

# 📝 Licencia
MIT License