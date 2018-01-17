#!/bin/sh

ln -s /usr/bin/vault-backend-migrator "/etc/periodic/$SCHEDULE"

echo "Vault Backend Migrator v$RELEASE (reported: $(vault-backend-migrator -version))"
echo " - Exporting secrets: $VBM_EXPORT"
echo " - Exporting to dir: $VBM_EXPORT_TO"
echo " - Exporting file: $VBM_FILE"
echo " - Vault Address: $VAULT_ADDR"
echo " - Vault Token: ****${VAULT_TOKEN: -4}"

#####
# TODO:
# - Print export command to a script file
# - Symlink script file into $SCHEDULE dir
# - Explode commas & print multiple tasks for $VBM_EXPORT and $VBM_FILE

echo "Starting cron task: $SCHEDULE"
/usr/sbin/crond -f -l 8