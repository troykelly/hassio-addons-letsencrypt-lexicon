# Hass.io Add-on: Letsencrypt with Lexicon

Let's Encrypt is a certificate authority that provides free X.509 certificates for Transport Layer Security encryption via an automated process designed to eliminate the hitherto complex process of manual creation, validation, signing, installation, and renewal of certificates for secure websites.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

## About

Setting up Letsencrypt allows you to use validated certificates for your webpages and webinterfaces.
It requires you to own the domain you are requesting the certificate for.

The generated certificate can be used within others addons.

## Source Version

[![Source][source-shield]][source]

## Installation

The installation of this add-on is straightforward and easy to do.

1. Navigate in your Home Assistant frontend to **Hass.io** -> **Add-on Store**.
2. Add a new repository by URL `https://github.com/troykelly/hassio-addons`
3. Find the "letslexicon" add-on and click it.
4. Click on the "INSTALL" button.

## How to use

Note: You will need to also set up an automation to update your certificates regularly. See "automations" below.

To use this add-on, you need to supply the config for your DNS provider

- Requires you to use one of the supported DNS providers (See "Supported DNS providers" below)
- Allows to request wildcard certificates (\*.yourdomain.com)
- Doesn’t need you to open a port to your hass.io host on your router.

You always need to provide the following entries within the configuration:

```json
  "email": "your@email.com"
  "domains": "yourdomain.com" /// in case of requesting a wildcard certificate, add "*.yourdomain.com".
```

```json
  "dns": {
    "provider": "" (Add the dns provider of your choice from the list of "Supported DNS providers" below)
  }
```

In addition add the fields according to the credentials required by your dns provider (just add the ones you need - not all):

```json
{
  "aliyun_key_id": "",
  "aliyun_secret": "",
  "aurora_api_key": "",
  "aurora_secret_key": "",
  "azure_client_id": "",
  "azure_client_secret": "",
  "azure_tenant_id": "",
  "azure_subscription_id": "",
  "azure_resource_group": "",
  "cloudflare_username": "",
  "cloudflare_token": "",
  "cloudns_id": "",
  "cloudns_subid": "",
  "cloudns_subuser": "",
  "cloudns_password": "",
  "cloudns_weight": "",
  "cloudns_port": "",
  "cloudxns_username": "",
  "cloudxns_token": "",
  "conoha_region": "",
  "conoha_token": "",
  "conoha_username": "",
  "conoha_password": "",
  "conoha_tenant_id": "",
  "constellix_username": "",
  "constellix_token": "",
  "digitalocean_token": "",
  "dinahosting_username": "",
  "dinahosting_password": "",
  "directadmin_password": "",
  "directadmin_username": "",
  "directadmin_endpoint": "",
  "dnsimple_token": "",
  "dnsimple_username": "",
  "dnsimple_password": "",
  "dnsimple-2fa": "",
  "dnsmadeeasy_username": "",
  "dnsmadeeasy_token": "",
  "dnspark_username": "",
  "dnspark_token": "",
  "dnspod_username": "",
  "dnspod_token": "",
  "dreamhost_token": "",
  "easydns_username": "",
  "easydns_token": "",
  "easyname_username": "",
  "easyname_password": "",
  "exoscale_key": "",
  "exoscale_secret": "",
  "gandi_token": "",
  "gandi_api_protocol": "",
  "gehirn_token": "",
  "gehirn_secret": "",
  "glesys_username": "",
  "glesys_token": "",
  "godaddy_key": "",
  "godaddy_secret": "",
  "googleclouddns_service_account_info": "",
  "gratisdns_username": "",
  "gratisdns_password": "",
  "henet_username": "",
  "henet_password": "",
  "hetzner_account": "",
  "hetzner_username": "",
  "hetzner_password": "",
  "hetzner_latency": "",
  "hostingde_token": "",
  "hover_username": "",
  "hover_password": "",
  "infoblox_user": "",
  "infoblox_psw": "",
  "infoblox_ib_view": "",
  "infoblox_ib_host": "",
  "internetbs_key": "",
  "internetbs_password": "",
  "inwx_username": "",
  "inwx_password": "",
  "linode_token": "",
  "linode4-token": "",
  "localzone_filename": "",
  "luadns_username": "",
  "luadns_token": "",
  "memset_token": "",
  "namecheap_token": "",
  "namecheap_username": "",
  "namecheap_client_ip": "",
  "namesilo_token": "",
  "netcup_customer_id": "",
  "netcup_api_key": "",
  "netcup_api_password": "",
  "nfsn_username": "",
  "nfsn_token": "",
  "nsone_token": "",
  "onapp_username": "",
  "onapp_token": "",
  "onapp_server": "",
  "online_token": "",
  "ovh_application_key": "",
  "ovh_application_secret": "",
  "ovh_consumer_key": "",
  "plesk_username": "",
  "plesk_password": "",
  "plesk_plesk_server": "",
  "pointhq_username": "",
  "pointhq_token": "",
  "powerdns_token": "",
  "powerdns_pdns_server": "",
  "powerdns_pdns_server_id": "",
  "powerdns_pdns_disable_notify": "",
  "rackspace_account": "",
  "rackspace_username": "",
  "rackspace_api_key": "",
  "rackspace_token": "",
  "rackspace_sleep_time": "",
  "rage4-username": "",
  "rage4-token": "",
  "rcodezero_token": "",
  "route53-access_key": "",
  "route53-access_secret": "",
  "route53-private_zone": "",
  "route53-username": "",
  "route53-token": "",
  "safedns_token": "",
  "sakuracloud_token": "",
  "sakuracloud_secret": "",
  "softlayer_username": "",
  "softlayer_api_key": "",
  "subreg_username": "",
  "subreg_password": "",
  "transip_username": "",
  "transip_api_key": "",
  "vultr_token": "",
  "yandex_token": "",
  "zeit_token": "",
  "zilore_key": "",
  "zonomi_token": ""
}
```

## Configuration

Add-on configuration:

```json
{
  "email": "hello@home-assistant.io",
  "domains": ["home-assistant.io"],
  "dns": {
    "provider": "dns-cloudflare",
    "cloudflare_username": "cf@home-assistant.io",
    "cloudflare_token": "31242lk3j4ljlfdwsjf0"
  }
}
```

## Supported DNS providers

```text
aliyun
aurora
auto
azure
cloudflare
cloudns
cloudxns
conoha
constellix
digitalocean
dinahosting
directadmin
dnsimple
dnsmadeeasy
dnspark
dnspod
dreamhost
easydns
easyname
exoscale
gandi
gehirn
glesys
godaddy
googleclouddns
gratisdns
henet
hetzner
hostingde
hover
infoblox
internetbs
inwx
linode
linode4
localzone
luadns
memset
namecheap
namesilo
netcup
nfsn
nsone
onapp
online
ovh
plesk
pointhq
powerdns
rackspace
rage4
rcodezero
route53
safedns
sakuracloud
softlayer
subreg
transip
vultr
yandex
zeit
zilore
zonomi
```

## Automations

To save on system resources, the container for this addon shuts down on completion. The process will not renew your certificates unless they are nearing expriy, so you can and should check every day, in case for some reason there has been a failure to check.

The service slug for this addon is `99c39c95_letslexicon`.

### Via the UI

Create a time triggered script (to be friendly to Let's Encrypt don't set it "on the hour" - set it for 02:38 for example). The script just needs to call a service, as below:

<img width="608" alt="restart_addon" src="https://user-images.githubusercontent.com/4564803/101269717-d6659a80-37c5-11eb-99c5-31565af45986.png">

### Manually creating

```yaml
- id: certrenew
  alias: Check for certificate renewal
  description: Starts the Let's Lexicon Addon every day
  trigger:
    - platform: time
      at: 03:41
  condition: []
  action:
    - service: hassio.addon_start
      data:
        addon: 99c39c95_letslexicon
  mode: single
```

## Known issues and limitations

- I made this in an afternoon because the core Let's Encrypt Add-on didn't support lexicon. Go easy.

## Support

Got questions?

You have several options to get them answered:

- Get me on [Keybase][keybase].
- The Home Assistant [Community Forum][forum].
- Check out certbots page [certbot].

In case you've found a bug, please [open an issue on our GitHub][issue].

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[keybase]: https://keybase.io/troykelly
[forum]: https://community.home-assistant.io
[issue]: https://github.com/troykelly/hassio-addons-letsencrypt-lexicon/issues
[certbot]: https://certbot.eff.org
[source-shield]: https://img.shields.io/badge/version-v0.7.0-blue.svg
[source]: https://github.com/lukas2511/dehydrated/releases/tag/v0.7.0
[release-shield]: https://img.shields.io/badge/version-v1.0.5-blue.svg
[release]: https://github.com/troykelly/hassio-addons-letsencrypt-lexicon/releases/tag/v1.0.5
