# SSL CA for development

## Create a tiny CA

```
openssl genrsa -des3 -out my.ca.key 2048
```

```
openssl req -x509 -new -nodes -key my.ca.key -sha256 -days 1825 -out my.ca.pem
```

Install `my.ca.pem` inside your browsers and SOs. See [Installing](#installing).


## CA-Signed for dev sites

```
openssl genrsa -out site.dev.key 2048
```

```
openssl req -new -key site.dev.key -out site.dev.csr
```

Generate a file `site.dev.ext` with your site urls:

```
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
DNS.2 = site.dev
DNS.3 = *.site.dev
```

<a name="generate-crt"></a>
Then generate the certificate (.crt):

```
openssl x509 -req \
  -sha256 \
  -days 1825 \
  -in site.dev.csr \
  -out site.dev.crt \
  -CA my.ca.pem \
  -CAkey my.ca.key \
  -CAcreateserial \
  -extfile site.dev.ext
```

Use `site.dev.{crt,key}` to configure the HTTP servers (Apache, Nginx, Express).


## <a name="installing"></a>Installing

### Install certificate on Chrome

1. Open `Chrome Settings > Show advanced settings > Manage certificates`;

1. Select `AUTHORITIES` tab;

1. Click on `IMPORT` button;

1. Open `my.ca.pem` file generated.


## Troubleshooting

### Prevent Chrome to auto redirect domains to HTTPS

1. Open [chrome://net-internals/#hsts](chrome://net-internals/#hsts);

1. Insert the domain on **Delete domain security policies**, then delete.

### Configure HTTP servers to not cache the certificates (HSTS)

#### Apache

Insert the line below on your secure host:

```
Header always set Strict-Transport-Security "max-age=0; includeSubDomains"
```

#### Ngnix

Insert the line below on your secure server:

```
add_header Strict-Transport-Security "max-age=0; includeSubDomains" always;
```

#### Express JS

Use the [hsts](https://github.com/helmetjs/hsts) Express middleware.

### Inserting new domain in certificate

1. Open `site.dev.ext` file;

1. Add new domains on `alt_names` section;

1. Run command to [regenerate the certificate file](#generate-crt).


## References

[How to create your own SSL certificate authority for local HTTPS development](https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/)
