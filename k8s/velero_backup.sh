velero backup create default-namespace-backup --include-namespaces default # To complete the backup it ill taee time
velero get backup
velero backup logs default-namespace-backup # Get Log Details from Velero

velero backup describe default-namespace-backup # Describe
