# Vault-Backend-Migrator Alpine Image

From [adamdecaf/vault-backend-migrator](https://github.com/adamdecaf/vault-backend-migrator), packaged in Alpine Linux with a cron job.

## Usage

See the Makefile `make run` command for a simple example.

The following environment variables have defaults and can be modified:

- `SCHEDULE=daily`: Cron schedule directory (see below for options)
- `RELEASE=0.2.0`: [Desired Github release](https://github.com/adamdecaf/vault-backend-migrator/releases)
- `VBM_EXPORT=secret/`: Vault path to export
- `VBM_EXPORT_TO=/export`: Directory to store exported secrets in
- `VBM_FILE=secret.json`: File to output to, within `VBM_EXPORT_TO` directory
- `VAULT_ADDR=http://vault:8200/ \`: Vault URL
- `VAULT_TOKEN= `: Vault access token (empty by default)

Set the `SCHEDULE` environment variable to determine the run frequency of the cron task. Options are found in `/etc/periodic`:

- `15min`
- `daily`
- `weekly`
- `monthly`

```
docker run -d  -e "SCHEDULE=daily" emcniece/vault-migrator-alpine
```

## Building

See [Makefile](./Makefile) for build/run commands.

```
# Docker build:
make image

# Docker Run:
make run

# Run with `tail -f /dev/null` CMD for debug access:
make run-debug
```