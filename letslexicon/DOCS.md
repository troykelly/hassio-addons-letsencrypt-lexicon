# Hass.io Add-on: Letsencrypt with Lexicon

Let's Encrypt is a certificate authority that provides free X.509 certificates for Transport Layer Security encryption via an automated process designed to eliminate the hitherto complex process of manual creation, validation, signing, installation, and renewal of certificates for secure websites.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

## About

Setting up Letsencrypt allows you to use validated certificates for your webpages and webinterfaces.

It requires you to own the domain you are requesting the certificate for.

The generated certificate can be used within others addons.

## Source Version

[![Source][source-shield]][source] [![Lexicon][lexicon-shield]][lexicon]

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

### Configuration Note

If using the 'UI' editor, do not include the "dns" key. ie in the _DNS Configuration_ section you will just have something like

```yaml
provider: godaddy
godaddy_auth_key: SPECIFY THE KEY TO ACCESS THE API
godaddy_auth_secret: SPECIFY THE SECRET TO ACCESS THE API
```

### Minimum Configuration

You always need to provide the email and domain entries within the configuration yaml, or in the UI:

```yaml
email: hello@home-assistant.io
domains:
  - home-assistant.io
```

In addition add the fields according to the credentials required by your dns provider (just add the ones you need - not all):

### aliyun

```yaml
dns:
  provider: aliyun
  aliyun_auth_key_id: SPECIFY ACCESS KEY ID FOR AUTHENTICATION
  aliyun_auth_secret: SPECIFY ACCESS SECRET FOR AUTHENTICATION
```

### aurora

```yaml
dns:
  provider: aurora
  aurora_auth_api_key: SPECIFY API KEY FOR AUTHENTICATION
  aurora_auth_secret_key: SPECIFY THE SECRET KEY FOR AUTHENTICATION
```

### azure

```yaml
dns:
  provider: azure
  azure_auth_client_id: SPECIFY THE CLIENT ID (AKA APPLICATION ID) OF THE APP REGISTRATION
  azure_auth_client_secret: SPECIFY THE CLIENT SECRET OF THE APP REGISTRATION
  azure_auth_subscription_id: SPECIFY THE SUBSCRIPTION ID ATTACHED TO THE RESOURCE GROUP
  azure_auth_tenant_id: SPECIFY THE TENANT ID (AKA DIRECTORY ID) OF THE APP REGISTRATION
  azure_resource_group: SPECIFY THE RESOURCE GROUP HOSTING THE DNS ZONE TO EDIT
```

### cloudflare

```yaml
dns:
  provider: cloudflare
  cloudflare_auth_token: SPECIFY TOKEN FOR AUTHENTICATION (GLOBAL API KEY OR API TOKEN)
  cloudflare_auth_username: SPECIFY EMAIL ADDRESS FOR AUTHENTICATION (FOR GLOBAL API KEY ONLY)
  cloudflare_zone_id: SPECIFY THE ZONE ID (IF SET, API TOKEN CAN BE SCOPED TO THE TARGET ZONE)
```

### cloudns

```yaml
dns:
  provider: cloudns
  cloudns_auth_id: SPECIFY USER ID FOR AUTHENTICATION
  cloudns_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  cloudns_auth_subid: SPECIFY SUBUSER ID FOR AUTHENTICATION
  cloudns_auth_subuser: SPECIFY SUBUSER NAME FOR AUTHENTICATION
  cloudns_port: SPECIFY THE SRV RECORD PORT
  cloudns_weight: SPECIFY THE SRV RECORD WEIGHT
```

### cloudxns

```yaml
dns:
  provider: cloudxns
  cloudxns_auth_token: SPECIFY SECRET-KEY FOR AUTHENTICATION
  cloudxns_auth_username: SPECIFY API-KEY FOR AUTHENTICATION
```

### conoha

```yaml
dns:
  provider: conoha
  conoha_auth_password: SPECIFY API USER PASSWORD FOR AUTHENTICATION. ONLY USED IF –AUTH-TOKEN IS EMPTY.
  conoha_auth_region: SPECIFY REGION. IF EMPTY, REGION ‘TYO1’ WILL BE USED.
  conoha_auth_tenant_id: SPECIFY TENAND ID FOR AUTHENTICATION. ONLY USED IF –AUTH-TOKEN IS EMPTY.
  conoha_auth_token: SPECIFY TOKEN FOR AUTHENTICATION. IF EMPTY, THE USERNAME AND PASSWORD WILL BE USED TO CREATE A TOKEN.
  conoha_auth_username: SPECIFY API USERNAME FOR AUTHENTICATION. ONLY USED IF –AUTH-TOKEN IS EMPTY.
```

### constellix

```yaml
dns:
  provider: constellix
  constellix_auth_token: SPECIFY SECRET KEY FOR AUTHENTICATE=
  constellix_auth_username: SPECIFY THE API KEY USERNAME FOR AUTHENTICATION
```

### ddns

```yaml
dns:
  provider: ddns
  ddns_auth_token: SPECIFY THE KEY USED IN FORMAT <ALG>:<KEY_ID>:<SECRET>
  ddns_ddns_server: SPECIFY IP OF THE DDNS SERVER
```

### digitalocean

```yaml
dns:
  provider: digitalocean
  digitalocean_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
```

### dinahosting

```yaml
dns:
  provider: dinahosting
  dinahosting_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  dinahosting_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### directadmin

```yaml
dns:
  provider: directadmin
  directadmin_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION (OR LOGIN KEY FOR TWO-FACTOR AUTHENTICATION)
  directadmin_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
  directadmin_endpoint: SPECIFY THE DIRECTADMIN ENDPOINT
```

### dnsimple

```yaml
dns:
  provider: dnsimple
  dnsimple_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  dnsimple_auth_token: SPECIFY API TOKEN FOR AUTHENTICATION
  dnsimple_auth_username: SPECIFY EMAIL ADDRESS FOR AUTHENTICATION
```

### dnsmadeeasy

```yaml
dns:
  provider: dnsmadeeasy
  dnsmadeeasy_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
  dnsmadeeasy_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### dnspark

```yaml
dns:
  provider: dnspark
  dnspark_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
  dnspark_auth_username: SPECIFY API KEY FOR AUTHENTICATION
```

### dnspod

```yaml
dns:
  provider: dnspod
  dnspod_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
  dnspod_auth_username: SPECIFY API ID FOR AUTHENTICATION
```

### dnsservices

```yaml
dns:
  provider: dnsservices
  dnsservices_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  dnsservices_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### dreamhost

```yaml
dns:
  provider: dreamhost
  dreamhost_auth_token: SPECIFY API KEY FOR AUTHENTICATION
```

### duckdns

```yaml
dns:
  provider: duckdns
  duckdns_auth_token: SPECIFY THE ACCOUNT TOKEN FOR AUTHENTICATION
```

### dynu

```yaml
dns:
  provider: dynu
  dynu_auth_token: SPECIFY API KEY FOR AUTHENTICATION
```

### easydns

```yaml
dns:
  provider: easydns
  easydns_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
  easydns_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### easyname

```yaml
dns:
  provider: easyname
  easyname_auth_password: SPECIFY PASSWORD USED TO AUTHENTICATE
  easyname_auth_username: SPECIFY USERNAME USED TO AUTHENTICATE
```

### euserv

```yaml
dns:
  provider: euserv
  euserv_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  euserv_auth_username: SPECIFY EMAIL ADDRESS FOR AUTHENTICATION
```

### exoscale

```yaml
dns:
  provider: exoscale
  exoscale_auth_key: SPECIFY API KEY FOR AUTHENTICATION
  exoscale_auth_secret: SPECIFY API SECRET FOR AUTHENTICATION
```

### flexibleengine

```yaml
dns:
  provider: flexibleengine
  flexibleengine_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
  flexibleengine_zone_id: SPECIFY THE ZONE ID
```

### gandi

```yaml
dns:
  provider: gandi
  gandi_api_protocol: (OPTIONAL) SPECIFY GANDI API PROTOCOL TO USE: RPC (DEFAULT) OR REST
  gandi_auth_token: SPECIFY GANDI API KEY OR PERSONAL ACCESS TOKEN
```

### gehirn

```yaml
dns:
  provider: gehirn
  gehirn_auth_secret: SPECIFY ACCESS SECRET FOR AUTHENTICATION
  gehirn_auth_token: SPECIFY ACCESS TOKEN FOR AUTHENTICATION
```

### glesys

```yaml
dns:
  provider: glesys
  glesys_auth_token: SPECIFY API KEY
  glesys_auth_username: SPECIFY USERNAME (CL12345)
```

### godaddy

```yaml
dns:
  provider: godaddy
  godaddy_auth_key: SPECIFY THE KEY TO ACCESS THE API
  godaddy_auth_secret: SPECIFY THE SECRET TO ACCESS THE API
```

### googleclouddns

```yaml
dns:
  provider: googleclouddns
  googleclouddns_auth_service_account_info: SPECIFY THE SERVICE ACCOUNT INFO IN THE GOOGLE JSON FORMAT: CAN BE EITHER THE PATH OF A FILE PREFIXED BY ‘FILE::’ (EG. FILE::/TMP/SERVICE_ACCOUNT_INFO.JSON) OR THE BASE64 ENCODED CONTENT OF THIS FILE PREFIXED BY ‘BASE64::’ (EG. BASE64::EYJHBGCIOYJ…)
```

### gransy

```yaml
dns:
  provider: gransy
  gransy_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  gransy_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### gratisdns

```yaml
dns:
  provider: gratisdns
  gratisdns_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  gratisdns_auth_username: SPECIFY EMAIL ADDRESS FOR AUTHENTICATION
```

### henet

```yaml
dns:
  provider: henet
  henet_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  henet_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### hetzner

```yaml
dns:
  provider: hetzner
  hetzner_auth_token: SPECIFY HETZNER DNS API TOKEN
```

### hostingde

```yaml
dns:
  provider: hostingde
  hostingde_auth_token: SPECIFY API KEY FOR AUTHENTICATION
```

### hover

```yaml
dns:
  provider: hover
  hover_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  hover_auth_totp_secret: SPECIFY BASE32-ENCODED SHARED SECRET TO GENERATE AN OTP FOR AUTHENTICATION
  hover_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### infoblox

```yaml
dns:
  provider: infoblox
  infoblox_auth_psw: SPECIFY THE PASSWORD TO ACCESS THE INFOBLOX WAPI
  infoblox_auth_user: SPECIFY THE USER TO ACCESS THE INFOBLOX WAPI
  infoblox_ib_host: SPECIFY INFOBLOX HOST EXPOSING THE WAPI
  infoblox_ib_view: SPECIFY DNS VIEW TO MANAGE AT THE INFOBLOX
```

### infomaniak

```yaml
dns:
  provider: infomaniak
  infomaniak_auth_token: SPECIFY THE TOKEN
```

### internetbs

```yaml
dns:
  provider: internetbs
  internetbs_auth_key: SPECIFY API KEY FOR AUTHENTICATION
  internetbs_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
```

### inwx

```yaml
dns:
  provider: inwx
  inwx_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  inwx_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### ionos

```yaml
dns:
  provider: ionos
  ionos_api_key: IONOS API KEY: PUBLIC PREFIX + PERIOD + KEY PROPER
```

### joker

```yaml
dns:
  provider: joker
  joker_auth_token: SPECIFY THE API KEY TO CONNECT TO THE JOKER.COM API
```

### linode

```yaml
dns:
  provider: linode
  linode_auth_token: SPECIFY API KEY FOR AUTHENTICATION
```

### linode4

```yaml
dns:
  provider: linode4
  linode4_auth_token: SPECIFY API KEY FOR AUTHENTICATION
```

### localzone

```yaml
dns:
  provider: localzone
  localzone_filename: SPECIFY LOCATION OF ZONE MASTER FILE
```

### luadns

```yaml
dns:
  provider: luadns
  luadns_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
  luadns_auth_username: SPECIFY EMAIL ADDRESS FOR AUTHENTICATION
```

### memset

```yaml
dns:
  provider: memset
  memset_auth_token: SPECIFY API KEY FOR AUTHENTICATION
```

### misaka

```yaml
dns:
  provider: misaka
  misaka_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
```

### mythicbeasts

```yaml
dns:
  provider: mythicbeasts
  mythicbeasts_auth_password: SPECIFY API CREDENTIALS PASSWORD
  mythicbeasts_auth_token: SPECIFY API TOKEN FOR AUTHENTICATION
  mythicbeasts_auth_username: SPECIFY API CREDENTIALS USERNAME
```

### namecheap

```yaml
dns:
  provider: namecheap
  namecheap_auth_client_ip: CLIENT IP ADDRESS TO SEND TO NAMECHEAP API CALLS
  namecheap_auth_sandbox: WHETHER TO USE THE SANDBOX SERVER
  namecheap_auth_token: SPECIFY API TOKEN FOR AUTHENTICATION
  namecheap_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### namecom

```yaml
dns:
  provider: namecom
  namecom_auth_token: SPECIFY AN API TOKEN
  namecom_auth_username: SPECIFY A USERNAME
```

### namesilo

```yaml
dns:
  provider: namesilo
  namesilo_auth_token: SPECIFY KEY FOR AUTHENTICATION
```

### netcup

```yaml
dns:
  provider: netcup
  netcup_auth_api_key: SPECIFY API KEY FOR AUTHENTICATION
  netcup_auth_api_password: SPECIFY API PASSWORD FOR AUTHENTICATION
  netcup_auth_customer_id: SPECIFY CUSTOMER NUMBER FOR AUTHENTICATION
```

### nfsn

```yaml
dns:
  provider: nfsn
  nfsn_auth_token: SPECIFY TOKEN USED TO AUTHENTICATE
  nfsn_auth_username: SPECIFY USERNAME USED TO AUTHENTICATE
```

### njalla

```yaml
dns:
  provider: njalla
  njalla_auth_token: SPECIFY API TOKEN FOR AUTHENTICATION
```

### nsone

```yaml
dns:
  provider: nsone
  nsone_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
```

### oci

```yaml
dns:
  provider: oci
  oci_auth_config_file: THE FULL PATH INCLUDING FILENAME TO AN OCI CONFIGURATION FILE.
  oci_auth_fingerprint: THE FINGERPRINT FOR THE PUBLIC KEY THAT WAS ADDED TO THE CALLING USER.
  oci_auth_key_content: THE FULL CONTENT OF THE CALLING USER’S PRIVATE SIGNING KEY IN PEM FORMAT.
  oci_auth_key_file: THE FULL PATH INCLUDING FILENAME TO THE CALLING USER’S PRIVATE SIGNING KEY IN PEM FORMAT.
  oci_auth_pass_phrase: IF THE PRIVATE KEY IS ENCRYPTED, THE PASS PHRASE MUST BE PROVIDED.
  oci_auth_profile: THE NAME OF THE PROFILE TO USE (CASE-SENSITIVE).
  oci_auth_region: AN OCI REGION IDENTIFIER. SELECT THE CLOSEST REGION FOR BEST PERFORMANCE.
  oci_auth_tenancy: THE OCID OF YOUR TENANCY.
  oci_auth_type: VALID OPTIONS ARE ‘API_KEY’ (DEFAULT) OR ‘INSTANCE_PRINCIPAL’.
  oci_auth_user: THE OCID OF THE USER CALLING THE API.
```

### onapp

```yaml
dns:
  provider: onapp
  onapp_auth_server: SPECIFY URL TO THE ONAPP CONTROL PANEL SERVER
  onapp_auth_token: SPECIFY API KEY FOR THE ONAPP ACCOUNT
  onapp_auth_username: SPECIFY EMAIL ADDRESS OF THE ONAPP ACCOUNT
```

### online

```yaml
dns:
  provider: online
  online_auth_token: SPECIFY PRIVATE API TOKEN
```

### ovh

```yaml
dns:
  provider: ovh
  ovh_auth_application_key: SPECIFY THE APPLICATION KEY
  ovh_auth_application_secret: SPECIFY THE APPLICATION SECRET
  ovh_auth_consumer_key: SPECIFY THE CONSUMER KEY
  ovh_auth_entrypoint: SPECIFY THE OVH ENTRYPOINT
```

### plesk

```yaml
dns:
  provider: plesk
  plesk_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  plesk_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
  plesk_plesk_server: SPECIFY URL TO THE PLESK WEB UI, INCLUDING THE PORT
```

### pointhq

```yaml
dns:
  provider: pointhq
  pointhq_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
  pointhq_auth_username: SPECIFY EMAIL ADDRESS FOR AUTHENTICATION
```

### porkbun

```yaml
dns:
  provider: porkbun
  porkbun_auth_key: SPECIFY API KEY FOR AUTHENTICATION
  porkbun_auth_secret: SPECIFY SECRET API KEY FOR AUTHENTICATION
```

### powerdns

```yaml
dns:
  provider: powerdns
  powerdns_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
  powerdns_pdns_disable_notify: DISABLE SLAVE NOTIFICATIONS FROM MASTER
  powerdns_pdns_server: URI FOR POWERDNS SERVER
  powerdns_pdns_server_id: SERVER ID TO INTERACT WITH
```

### qcloud

```yaml
dns:
  provider: qcloud
  qcloud_secret_id: SPECIFY SECRET_ID FOR AUTHENTICATION
  qcloud_secret_key: SPECIFY SECRET_KEY FOR AUTHENTICATION
```

### rackspace

```yaml
dns:
  provider: rackspace
  rackspace_auth_account: SPECIFY ACCOUNT NUMBER FOR AUTHENTICATION
  rackspace_auth_api_key: SPECIFY API KEY FOR AUTHENTICATION. ONLY USED IF –AUTH-TOKEN IS EMPTY.
  rackspace_auth_token: SPECIFY TOKEN FOR AUTHENTICATION. IF EMPTY, THE USERNAME AND API KEY WILL BE USED TO CREATE A TOKEN.
  rackspace_auth_username: SPECIFY USERNAME FOR AUTHENTICATION. ONLY USED IF –AUTH-TOKEN IS EMPTY.
  rackspace_sleep_time: NUMBER OF SECONDS TO WAIT BETWEEN UPDATE REQUESTS.
```

### rage4

```yaml
dns:
  provider: rage4
  rage4_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
  rage4_auth_username: SPECIFY EMAIL ADDRESS FOR AUTHENTICATION
```

### rcodezero

```yaml
dns:
  provider: rcodezero
  rcodezero_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
```

### regfish

```yaml
dns:
  provider: regfish
  regfish_auth_api_key: SPECIFY API KEY FOR AUTHENTICATION
```

### route53

```yaml
dns:
  provider: route53
  route53_auth_access_key: SPECIFY ACCESS_KEY FOR AUTHENTICATION
  route53_auth_access_secret: SPECIFY ACCESS_SECRET FOR AUTHENTICATION
  route53_auth_token: ALTERNATIVE WAY TO SPECIFY THE ACCESS_SECRET FOR AUTHENTICATION
  route53_auth_username: ALTERNATIVE WAY TO SPECIFY THE ACCESS_KEY FOR AUTHENTICATION
  route53_private_zone: INDICATES WHAT KIND OF HOSTED ZONE TO USE. IF TRUE, USE ONLY PRIVATE ZONES. IF FALSE, USE ONLY PUBLIC ZONES
  route53_zone_id: THE AWS HOSTEDZONE ID TO USE; E.G. ‘A1B2ZABCDEFGHI’
```

### safedns

```yaml
dns:
  provider: safedns
  safedns_auth_token: SPECIFY THE API KEY TO AUTHENTICATE WITH
```

### sakuracloud

```yaml
dns:
  provider: sakuracloud
  sakuracloud_auth_secret: SPECIFY ACCESS SECRET FOR AUTHENTICATION
  sakuracloud_auth_token: SPECIFY ACCESS TOKEN FOR AUTHENTICATION
```

### softlayer

```yaml
dns:
  provider: softlayer
  softlayer_auth_api_key: SPECIFY API PRIVATE KEY FOR AUTHENTICATION
  softlayer_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### timeweb

```yaml
dns:
  provider: timeweb
  timeweb_auth_token: SPECIFY API TOKEN FOR AUTHENTICATION
```

### transip

```yaml
dns:
  provider: transip
  transip_auth_api_key: SPECIFY THE PRIVATE KEY TO USE FOR API AUTHENTICATION, IN PEM FORMAT: CAN BE EITHER THE PATH OF THE KEY FILE (EG. /TMP/KEY.PEM) OR THE BASE64 ENCODED CONTENT OF THIS FILE PREFIXED BY ‘BASE64::’ (EG. BASE64::EYJHBGCIOYJ…)
  transip_auth_key_is_global: SET THIS FLAG IS THE PRIVATE KEY USED IS A GLOBAL KEY WITH NO IP WHITELIST RESTRICTION
  transip_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### ultradns

```yaml
dns:
  provider: ultradns
  ultradns_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  ultradns_auth_token: SPECIFY TOKEN FOR AUTHENTICATION; IF NOT SET –AUTH-TOKEN, –AUTH-PASSWORD ARE USED
  ultradns_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### valuedomain

```yaml
dns:
  provider: valuedomain
  valuedomain_auth_token: SPECIFY YOUYR API TOKEN
```

### vercel

```yaml
dns:
  provider: vercel
  vercel_auth_token: SPECIFY YOUR API TOKEN
```

### vultr

```yaml
dns:
  provider: vultr
  vultr_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
```

### webgo

```yaml
dns:
  provider: webgo
  webgo_auth_password: SPECIFY PASSWORD FOR AUTHENTICATION
  webgo_auth_username: SPECIFY USERNAME FOR AUTHENTICATION
```

### wedos

```yaml
dns:
  provider: wedos
  wedos_auth_pass: SPECIFY PASSWORD FOR WAPI
  wedos_auth_username: SPECIFY EMAIL ADDRESS FOR AUTHENTICATION
```

### yandex

```yaml
dns:
  provider: yandex
  yandex_auth_token: SPECIFY PDD TOKEN (HTTPS://YANDEX.COM/DEV/DOMAIN/DOC/CONCEPTS/ACCESS.HTML)
```

### yandexcloud

```yaml
dns:
  provider: yandexcloud
  yandexcloud_auth_token: SPECIFY THE IAM TOKEN (HTTPS://CLOUD.YANDEX.COM/EN/DOCS/DNS/API-REF/AUTHENTICATION)
  yandexcloud_cloud_id: SPECIFY THE CLOUD ID (VISIBLE IN THE CLOUD SELECTOR IN THE WEB INTERFACE), MIGHT BE NEEDED IF DNS ZONE ID IS NOT SET
  yandexcloud_dns_zone_id: SPECIFY THE DNS ZONE ID (CAN BE OBTAINED FROM WEB INTERFACE)
  yandexcloud_folder_id: SPECIFY THE FOLDER ID (HTTPS://CLOUD.YANDEX.COM/EN/DOCS/RESOURCE-MANAGER/OPERATIONS/FOLDER/GET-ID) MIGHT BE NEEDED IF DNS ZONE ID IS NOT SET
```

### zeit

```yaml
dns:
  provider: zeit
  zeit_auth_token: SPECIFY YOUR API TOKEN
```

### zilore

```yaml
dns:
  provider: zilore
  zilore_auth_key: SPECIFY THE ZILORE API KEY TO USE
```

### zonomi

```yaml
dns:
  provider: zonomi
  zonomi_auth_entrypoint: USE ZONOMI OR RIMUHOSTING API
  zonomi_auth_token: SPECIFY TOKEN FOR AUTHENTICATION
```

## Supported DNS providers

- aliyun
- aurora
- azure
- cloudflare
- cloudns
- cloudxns
- conoha
- constellix
- ddns
- digitalocean
- dinahosting
- directadmin
- dnsimple
- dnsmadeeasy
- dnspark
- dnspod
- dnsservices
- dreamhost
- duckdns
- dynu
- easydns
- easyname
- euserv
- exoscale
- flexibleengine
- gandi
- gehirn
- glesys
- godaddy
- googleclouddns
- gransy
- gratisdns
- henet
- hetzner
- hostingde
- hover
- infoblox
- infomaniak
- internetbs
- inwx
- joker
- linode
- linode4
- localzone
- luadns
- memset
- misaka
- mythicbeasts
- namecheap
- namecom
- namesilo
- netcup
- nfsn
- njalla
- nsone
- oci
- onapp
- online
- ovh
- plesk
- pointhq
- porkbun
- powerdns
- rackspace
- rage4
- rcodezero
- route53
- safedns
- sakuracloud
- softlayer
- transip
- ultradns
- valuedomain
- vercel
- vultr
- webgo
- wedos
- yandex
- yandexcloud
- zeit
- zilore
- zonomi

## Automations

To save on system resources, the container for this addon shuts down on completion. The process will not renew your certificates unless they are nearing expriy, so you can and should check every day, in case for some reason there has been a failure to check.

The service slug for this addon is `99c39c95_letslexicon`.

### Via the UI

Create a time triggered script (to be friendly to Let's Encrypt don't set it "on the hour" - set it for 02:38 for example). The script just needs to call a service, as below:

<img  width="608"  alt="restart_addon"  src="https://user-images.githubusercontent.com/4564803/101269717-d6659a80-37c5-11eb-99c5-31565af45986.png">

### Manually creating

```yaml
- id: certrenew
  alias: Check for certificate renewal
  description: Starts the Let's Lexicon Addon every day
  trigger:
    - platform: time
  at: 13260
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
[lexicon-shield]: https://img.shields.io/badge/lexicon-v3.11.4-blue.svg
[lexicon]: https://github.com/AnalogJ/lexicon/releases/tag/v3.11.4
