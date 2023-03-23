./loop.sh

status="$(linode-cli linodes list --label jenkins --json | python -c "import sys, json; print(json.load(sys.stdin)[0]['status'])")"


export id="$(linode-cli linodes list --label jenkins --json | python -c "import sys, json; print(json.load(sys.stdin)[0]['id'])")"
export ip="$(linode-cli linodes list --label jenkins --json | python -c "import sys, json; print(json.load(sys.stdin)[0]['ipv4'][0])")"


sleep 2
echo "start setup $ip"

setup_known_hosts $ip

cat inventory.yaml_tpl | \
    sed "s|{server-ip}|$ip|g" | \
    sed "s|{ssh-user}|root|g" \
		> inventory.yaml

ansible-playbook -i inventory.yaml init-ubuntu.yaml
ansible-playbook -i inventory.yaml install-docker.yaml
