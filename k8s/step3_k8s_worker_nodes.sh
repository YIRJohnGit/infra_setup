echo "Option 1"
echo "Generate a New Joining Key from the Master Node using below command and use it in worker node for joining to the cluster"
echo "sudo kubeadm token create --print-join-command"

echo "\n\n\n\n"
echo "Option 2"
# Copy the Join Detail from the Step2 from screen and paste the same in all the worker nodes with sudo prefix
# Below is the Sample Code but it will vary in your setup
# sudo kubeadm join 172.31.32.41:6443 --token 2k92rl.uxyatjxfrr1oc23d --discovery-token-ca-cert-hash sha256:a6486a5374332b81bf130736202594c5098ed3659cf6e01bf9ccbbd80f6dc1ef
