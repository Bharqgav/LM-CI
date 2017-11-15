mkdir -p /certs/ 
wget -nv https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem -P /certs/
chmod 400 /certs/rds-combined-ca-bundle.pem