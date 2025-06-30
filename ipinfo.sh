function ipinfo() {
    ip="$1"
    # Get your apikey from https://ipgeolocation.io/
    apikey_ipgeo="YOUR_API_KEY"
    mode="$2"

    if [[ -z "$ip" ]]; then
        echo "Use: ipinfo <IP> [--whois] [--geo] [--info]"
        return 1
    fi

    if [[ "$mode" == "--whois" ]]; then
        echo "===== WHOIS FILTERED INFO ====="
        host "$ip"
        whois "$ip" | grep -E 'CIDR|OrgName|NetName|Country|OrgTechEmail'
        return 0
    fi

	if [[ "$mode" == "--geo" ]]; then
        echo -e "\n===== ipgeolocation.io ====="
		curl -s "https://api.ipgeolocation.io/v2/ipgeo?apiKey=$apikey_ipgeo&ip=$ip" | jq .
        return 0
    fi

	if [[ "$mode" == "--info" ]]; then
        echo "===== ipinfo.io ====="
		curl -s "https://ipinfo.io/$ip" | jq .
        return 0
    fi

    echo "===== ipinfo.io ====="
    curl -s "https://ipinfo.io/$ip" | jq .

    echo -e "\n===== ip-api.com ====="
    curl -s "http://ip-api.com/json/$ip" | jq .

    echo -e "\n===== ipwhois.app ====="
    curl -s "https://ipwhois.app/json/$ip" | jq .

    echo -e "\n===== ipapi.co ====="
    curl -s "https://ipapi.co/$ip/json/" | jq .

    echo -e "\n===== ipgeolocation.io ====="
    curl -s "https://api.ipgeolocation.io/v2/ipgeo?apiKey=$apikey_ipgeo&ip=$ip" | jq .

    echo -e "\n===== host / whois ====="
    host "$ip"
    whois "$ip" | grep -E 'OrgName|OrgTechEmail|Country|CIDR|NetName'
}