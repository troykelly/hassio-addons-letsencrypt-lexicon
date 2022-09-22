#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Let's Lexicon
#
# Generates certificates for Home Assistant.
# This add-on uses Let's Encrypt to authorise and retrieve certificates.
# ==============================================================================

# ------------------------------------------------------------------------------
# Creates and renews certificates
#
# Arguments:
#   None
# Returns:
#   None
# -----------------------------------------------------------------------------
refresh_certificates() {
    local timestamp
    local cert_dir
    local email
    local domains
    local keyfile
    local certfile
    local dns_provider
    local firstcertalias
    local certlist
    local certalias
    local provider
    local email_regex

    bashio::log.trace "${FUNCNAME[0]}"

    cert_dir=/data/letsencrypt
    email_regex="^(([A-Za-z0-9]+((\.|\-|\_|\+)?[A-Za-z0-9]?)*[A-Za-z0-9]+)|[A-Za-z0-9]+)@(([A-Za-z0-9]+)+((\.|\-|\_)?([A-Za-z0-9]+)+)*)+\.([A-Za-z]{2,})+$"

    mkdir -p "$cert_dir"
    mkdir -p "/ssl"

    email=$(bashio::config 'email')
    domains=$(bashio::config 'domains')
    keyfile=$(bashio::config 'keyfile')
    certfile=$(bashio::config 'certfile')
    dns_provider=$(bashio::config 'dns.provider')

    export LEXICON_ALIYUN_KEY_ID=$(bashio::config 'dns.aliyun_key_id')
    export LEXICON_ALIYUN_SECRET=$(bashio::config 'dns.aliyun_secret')
    export LEXICON_AURORA_API_KEY=$(bashio::config 'dns.aurora_api_key')
    export LEXICON_AURORA_SECRET_KEY=$(bashio::config 'dns.aurora_secret_key')
    export LEXICON_AZURE_CLIENT_ID=$(bashio::config 'dns.azure_client_id')
    export LEXICON_AZURE_CLIENT_SECRET=$(bashio::config 'dns.azure_client_secret')
    export LEXICON_AZURE_TENANT_ID=$(bashio::config 'dns.azure_tenant_id')
    export LEXICON_AZURE_SUBSCRIPTION_ID=$(bashio::config 'dns.azure_subscription_id')
    export LEXICON_AZURE_RESOURCE_GROUP=$(bashio::config 'dns.azure_resource_group')
    export LEXICON_CLOUDFLARE_USERNAME=$(bashio::config 'dns.cloudflare_username')
    export LEXICON_CLOUDFLARE_TOKEN=$(bashio::config 'dns.cloudflare_token')
    export LEXICON_CLOUDNS_ID=$(bashio::config 'dns.cloudns_id')
    export LEXICON_CLOUDNS_SUBID=$(bashio::config 'dns.cloudns_subid')
    export LEXICON_CLOUDNS_SUBUSER=$(bashio::config 'dns.cloudns_subuser')
    export LEXICON_CLOUDNS_PASSWORD=$(bashio::config 'dns.cloudns_password')
    export LEXICON_CLOUDNS_WEIGHT=$(bashio::config 'dns.cloudns_weight')
    export LEXICON_CLOUDNS_PORT=$(bashio::config 'dns.cloudns_port')
    export LEXICON_CLOUDXNS_USERNAME=$(bashio::config 'dns.cloudxns_username')
    export LEXICON_CLOUDXNS_TOKEN=$(bashio::config 'dns.cloudxns_token')
    export LEXICON_CONOHA_REGION=$(bashio::config 'dns.conoha_region')
    export LEXICON_CONOHA_TOKEN=$(bashio::config 'dns.conoha_token')
    export LEXICON_CONOHA_USERNAME=$(bashio::config 'dns.conoha_username')
    export LEXICON_CONOHA_PASSWORD=$(bashio::config 'dns.conoha_password')
    export LEXICON_CONOHA_TENANT_ID=$(bashio::config 'dns.conoha_tenant_id')
    export LEXICON_CONSTELLIX_USERNAME=$(bashio::config 'dns.constellix_username')
    export LEXICON_CONSTELLIX_TOKEN=$(bashio::config 'dns.constellix_token')
    export LEXICON_DIGITALOCEAN_TOKEN=$(bashio::config 'dns.digitalocean_token')
    export LEXICON_DINAHOSTING_USERNAME=$(bashio::config 'dns.dinahosting_username')
    export LEXICON_DINAHOSTING_PASSWORD=$(bashio::config 'dns.dinahosting_password')
    export LEXICON_DIRECTADMIN_PASSWORD=$(bashio::config 'dns.directadmin_password')
    export LEXICON_DIRECTADMIN_USERNAME=$(bashio::config 'dns.directadmin_username')
    export LEXICON_DIRECTADMIN_ENDPOINT=$(bashio::config 'dns.directadmin_endpoint')
    export LEXICON_DNSIMPLE_TOKEN=$(bashio::config 'dns.dnsimple_token')
    export LEXICON_DNSIMPLE_USERNAME=$(bashio::config 'dns.dnsimple_username')
    export LEXICON_DNSIMPLE_PASSWORD=$(bashio::config 'dns.dnsimple_password')
    export LEXICON_DNSIMPLE_2FA=$(bashio::config 'dns.dnsimple_2fa')
    export LEXICON_DNSMADEEASY_USERNAME=$(bashio::config 'dns.dnsmadeeasy_username')
    export LEXICON_DNSMADEEASY_TOKEN=$(bashio::config 'dns.dnsmadeeasy_token')
    export LEXICON_DNSPARK_USERNAME=$(bashio::config 'dns.dnspark_username')
    export LEXICON_DNSPARK_TOKEN=$(bashio::config 'dns.dnspark_token')
    export LEXICON_DNSPOD_USERNAME=$(bashio::config 'dns.dnspod_username')
    export LEXICON_DNSPOD_TOKEN=$(bashio::config 'dns.dnspod_token')
    export LEXICON_DREAMHOST_TOKEN=$(bashio::config 'dns.dreamhost_token')
    export LEXICON_EASYDNS_USERNAME=$(bashio::config 'dns.easydns_username')
    export LEXICON_EASYDNS_TOKEN=$(bashio::config 'dns.easydns_token')
    export LEXICON_EASYNAME_USERNAME=$(bashio::config 'dns.easyname_username')
    export LEXICON_EASYNAME_PASSWORD=$(bashio::config 'dns.easyname_password')
    export LEXICON_EXOSCALE_KEY=$(bashio::config 'dns.exoscale_key')
    export LEXICON_EXOSCALE_SECRET=$(bashio::config 'dns.exoscale_secret')
    export LEXICON_GANDI_TOKEN=$(bashio::config 'dns.gandi_token')
    export LEXICON_GANDI_API_PROTOCOL=$(bashio::config 'dns.gandi_api_protocol')
    export LEXICON_GEHIRN_TOKEN=$(bashio::config 'dns.gehirn_token')
    export LEXICON_GEHIRN_SECRET=$(bashio::config 'dns.gehirn_secret')
    export LEXICON_GLESYS_USERNAME=$(bashio::config 'dns.glesys_username')
    export LEXICON_GLESYS_TOKEN=$(bashio::config 'dns.glesys_token')
    export LEXICON_GODADDY_KEY=$(bashio::config 'dns.godaddy_key')
    export LEXICON_GODADDY_SECRET=$(bashio::config 'dns.godaddy_secret')
    export LEXICON_GOOGLECLOUDDNS_SERVICE_ACCOUNT_INFO=$(bashio::config 'dns.googleclouddns_service_account_info')
    export LEXICON_GRATISDNS_USERNAME=$(bashio::config 'dns.gratisdns_username')
    export LEXICON_GRATISDNS_PASSWORD=$(bashio::config 'dns.gratisdns_password')
    export LEXICON_HENET_USERNAME=$(bashio::config 'dns.henet_username')
    export LEXICON_HENET_PASSWORD=$(bashio::config 'dns.henet_password')
    export LEXICON_HETZNER_ACCOUNT=$(bashio::config 'dns.hetzner_account')
    export LEXICON_HETZNER_USERNAME=$(bashio::config 'dns.hetzner_username')
    export LEXICON_HETZNER_PASSWORD=$(bashio::config 'dns.hetzner_password')
    export LEXICON_HETZNER_LATENCY=$(bashio::config 'dns.hetzner_latency')
    export LEXICON_HOSTINGDE_TOKEN=$(bashio::config 'dns.hostingde_token')
    export LEXICON_HOVER_USERNAME=$(bashio::config 'dns.hover_username')
    export LEXICON_HOVER_PASSWORD=$(bashio::config 'dns.hover_password')
    export LEXICON_INFOBLOX_USER=$(bashio::config 'dns.infoblox_user')
    export LEXICON_INFOBLOX_PSW=$(bashio::config 'dns.infoblox_psw')
    export LEXICON_INFOBLOX_IB_VIEW=$(bashio::config 'dns.infoblox_ib_view')
    export LEXICON_INFOBLOX_IB_HOST=$(bashio::config 'dns.infoblox_ib_host')
    export LEXICON_INTERNETBS_KEY=$(bashio::config 'dns.internetbs_key')
    export LEXICON_INTERNETBS_PASSWORD=$(bashio::config 'dns.internetbs_password')
    export LEXICON_INWX_USERNAME=$(bashio::config 'dns.inwx_username')
    export LEXICON_INWX_PASSWORD=$(bashio::config 'dns.inwx_password')
    export LEXICON_LINODE_TOKEN=$(bashio::config 'dns.linode_token')
    export LEXICON_LINODE4_TOKEN=$(bashio::config 'dns.linode4_token')
    export LEXICON_LOCALZONE_FILENAME=$(bashio::config 'dns.localzone_filename')
    export LEXICON_LUADNS_USERNAME=$(bashio::config 'dns.luadns_username')
    export LEXICON_LUADNS_TOKEN=$(bashio::config 'dns.luadns_token')
    export LEXICON_MEMSET_TOKEN=$(bashio::config 'dns.memset_token')
    export LEXICON_NAMECHEAP_TOKEN=$(bashio::config 'dns.namecheap_token')
    export LEXICON_NAMECHEAP_USERNAME=$(bashio::config 'dns.namecheap_username')
    export LEXICON_NAMECHEAP_CLIENT_IP=$(bashio::config 'dns.namecheap_client_ip')
    export LEXICON_NAMESILO_TOKEN=$(bashio::config 'dns.namesilo_token')
    export LEXICON_NETCUP_CUSTOMER_ID=$(bashio::config 'dns.netcup_customer_id')
    export LEXICON_NETCUP_API_KEY=$(bashio::config 'dns.netcup_api_key')
    export LEXICON_NETCUP_API_PASSWORD=$(bashio::config 'dns.netcup_api_password')
    export LEXICON_NFSN_USERNAME=$(bashio::config 'dns.nfsn_username')
    export LEXICON_NFSN_TOKEN=$(bashio::config 'dns.nfsn_token')
    export LEXICON_NSONE_TOKEN=$(bashio::config 'dns.nsone_token')
    export LEXICON_ONAPP_USERNAME=$(bashio::config 'dns.onapp_username')
    export LEXICON_ONAPP_TOKEN=$(bashio::config 'dns.onapp_token')
    export LEXICON_ONAPP_SERVER=$(bashio::config 'dns.onapp_server')
    export LEXICON_ONLINE_TOKEN=$(bashio::config 'dns.online_token')
    export LEXICON_OVH_APPLICATION_KEY=$(bashio::config 'dns.ovh_application_key')
    export LEXICON_OVH_APPLICATION_SECRET=$(bashio::config 'dns.ovh_application_secret')
    export LEXICON_OVH_CONSUMER_KEY=$(bashio::config 'dns.ovh_consumer_key')
    export LEXICON_PLESK_USERNAME=$(bashio::config 'dns.plesk_username')
    export LEXICON_PLESK_PASSWORD=$(bashio::config 'dns.plesk_password')
    export LEXICON_PLESK_PLESK_SERVER=$(bashio::config 'dns.plesk_plesk_server')
    export LEXICON_POINTHQ_USERNAME=$(bashio::config 'dns.pointhq_username')
    export LEXICON_POINTHQ_TOKEN=$(bashio::config 'dns.pointhq_token')
    export LEXICON_POWERDNS_TOKEN=$(bashio::config 'dns.powerdns_token')
    export LEXICON_POWERDNS_PDNS_SERVER=$(bashio::config 'dns.powerdns_pdns_server')
    export LEXICON_POWERDNS_PDNS_SERVER_ID=$(bashio::config 'dns.powerdns_pdns_server_id')
    export LEXICON_POWERDNS_PDNS_DISABLE_NOTIFY=$(bashio::config 'dns.powerdns_pdns_disable_notify')
    export LEXICON_RACKSPACE_ACCOUNT=$(bashio::config 'dns.rackspace_account')
    export LEXICON_RACKSPACE_USERNAME=$(bashio::config 'dns.rackspace_username')
    export LEXICON_RACKSPACE_API_KEY=$(bashio::config 'dns.rackspace_api_key')
    export LEXICON_RACKSPACE_TOKEN=$(bashio::config 'dns.rackspace_token')
    export LEXICON_RACKSPACE_SLEEP_TIME=$(bashio::config 'dns.rackspace_sleep_time')
    export LEXICON_RAGE4_USERNAME=$(bashio::config 'dns.rage4_username')
    export LEXICON_RAGE4_TOKEN=$(bashio::config 'dns.rage4_token')
    export LEXICON_RCODEZERO_TOKEN=$(bashio::config 'dns.rcodezero_token')
    export LEXICON_ROUTE53_ACCESS_KEY=$(bashio::config 'dns.route53_access_key')
    export LEXICON_ROUTE53_ACCESS_SECRET=$(bashio::config 'dns.route53_access_secret')
    export LEXICON_ROUTE53_PRIVATE_ZONE=$(bashio::config 'dns.route53_private_zone')
    export LEXICON_ROUTE53_USERNAME=$(bashio::config 'dns.route53_username')
    export LEXICON_ROUTE53_TOKEN=$(bashio::config 'dns.route53_token')
    export LEXICON_SAFEDNS_TOKEN=$(bashio::config 'dns.safedns_token')
    export LEXICON_SAKURACLOUD_TOKEN=$(bashio::config 'dns.sakuracloud_token')
    export LEXICON_SAKURACLOUD_SECRET=$(bashio::config 'dns.sakuracloud_secret')
    export LEXICON_SOFTLAYER_USERNAME=$(bashio::config 'dns.softlayer_username')
    export LEXICON_SOFTLAYER_API_KEY=$(bashio::config 'dns.softlayer_api_key')
    export LEXICON_SUBREG_USERNAME=$(bashio::config 'dns.subreg_username')
    export LEXICON_SUBREG_PASSWORD=$(bashio::config 'dns.subreg_password')
    export LEXICON_TRANSIP_USERNAME=$(bashio::config 'dns.transip_username')
    export LEXICON_TRANSIP_API_KEY=$(bashio::config 'dns.transip_api_key')
    export LEXICON_VULTR_TOKEN=$(bashio::config 'dns.vultr_token')
    export LEXICON_YANDEX_TOKEN=$(bashio::config 'dns.yandex_token')
    export LEXICON_ZEIT_TOKEN=$(bashio::config 'dns.zeit_token')
    export LEXICON_ZILORE_KEY=$(bashio::config 'dns.zilore_key')
    export LEXICON_ZONOMI_TOKEN=$(bashio::config 'dns.zonomi_token')

    #Create a config
    mkdir -p /etc/dehydrated
    sed -i --regexp-extended "s/^#?BASEDIR=.*?$/BASEDIR=\"${cert_dir}\"/" /etc/dehydrated/config

    #Update email
    if [[ $email =~ ${email_regex} ]]; then
        sed -i --regexp-extended "s/^#?CONTACT_EMAIL=.*?$/CONTACT_EMAIL=\"${email}\"/" /etc/dehydrated/config
    else
        sed -i --regexp-extended 's/^#?CONTACT_EMAIL=(.*?)$/#CONTACT_EMAIL=\1/' /etc/dehydrated/config
    fi

    #Ensure we have an ID
    if [ ! -d "$cert_dir/accounts" ]; then
        /opt/dehydrated/dehydrated --register --accept-terms
    fi

    echo "# Home Assistant Domains" > "$cert_dir"/domains.txt

    firstcertalias=""

    while IFS= read -r line
    do
    certlist=( $line )
    certalias="${certlist[0]//[^A-Za-z0-9_-]/_}"
    if [ "$firstcertalias" == "" ]; then
        firstcertalias="${certalias}"
    fi
    bashio::log.info "[${certalias}]:\t$line"
    printf "${line} > ${certalias}\n" >> "$cert_dir"/domains.txt
    done < <(printf '%s\n' "$domains")

    printf "# END Home Assistant Domains\n" >> "$cert_dir"/domains.txt

    bashio::log.info "Requesting domains from LetsEncrypt"
    cat "$cert_dir"/domains.txt

    provider=${dns_provider} /opt/dehydrated/dehydrated --challenge dns-01 --out /ssl --keep-going --cron --hook /opt/dehydrated/dehydrated.default.sh

    bashio::log.info "Copying domains and keys"

    # copy certs to store
    if [ "$keyfile" != "" ]; then
    if [[ -f "/ssl/${firstcertalias}/privkey.pem" ]]; then
        cp -f /ssl/${firstcertalias}/privkey.pem /ssl/"$keyfile"
        else
        bashio::log.error "Failed to get ${keyfile} from ${firstcertalias}"
    fi
    fi
    if [ "$certfile" != "" ]; then
    if [[ -f "/ssl/${firstcertalias}/fullchain.pem" ]]; then
        cp -f /ssl/${firstcertalias}/fullchain.pem /ssl/"$certfile"
        else
        bashio::log.error "Failed to get ${certfile} from ${firstcertalias}"
    fi
    fi

    bashio::log.info "Cleaning Up"
    provider=${dns_provider} /opt/dehydrated/dehydrated --cleanup --out /ssl

    timestamp=$(date +"%T")

    bashio::log.info "Certificates refreshed at @ ${timestamp}"
}

# ==============================================================================
# RUN LOGIC
# ------------------------------------------------------------------------------
main() {
    local sleep

    bashio::log.trace "${FUNCNAME[0]}"

    # sleep=$(bashio::config 'seconds_between_quotes')
    sleep=86400
    bashio::log.info "Seconds between each refresh is set to: ${sleep}"

    while true; do
        refresh_certificates
        sleep "${sleep}"
    done
}
main "$@"
