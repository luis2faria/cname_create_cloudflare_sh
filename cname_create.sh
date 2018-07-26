declare -a cname=(	
	"wordpress"
	"cname1"
	"cname2"
	"cname3"
	"cname4"
	)

KEY="CHANGE_FOR_CLOUDFLARE_API_KEY"; \
ZONE_ID="CHANGE_FOR_ZONE_ID_DOMAIN_KEY"; \
TYPE="CNAME"; \
CONTENT="example.com"; \
PROXIED="true"; \
TTL="1"; \
for i in "${cname[@]}"
do

curl -X POST "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/" \
    -H "X-Auth-Email: $EMAIL" \
    -H "X-Auth-Key: $KEY" \
    -H "Content-Type: application/json" \
    --data '{"type":"'"$TYPE"'","name":"'"$i"'","content":"'"$CONTENT"'","proxied":'"$PROXIED"',"ttl":'"$TTL"'}' \
    | python -m json.tool;
	
done