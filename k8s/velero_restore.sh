velero restore create default-namespace-backup --from-backup default-namespace-backup

velero restore describe default-namespace-backup # Describe
velero restore logs default-namespace-backup #Logs

kubectl get all # See items restored
