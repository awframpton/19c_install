#!/usr/bin/bash

# Some constants
TEMPLATE=OL9U4_x86_64-kvm-b234.qcow2
VCPUS=2
MEMORY=8192
PUB_KEY="${HOME}/.ssh/id_rsa.pub"

[[ $# -ne 1 ]] && echo "Usage: $0 VM_NAME" && exit 1
DOMAIN="$1"

echo "$0: Building cloud-init image"
CI_DIR=$(mktemp -d)

cat > "${CI_DIR}/meta-data" <<EOF
instance-id: iid-local01
local-hostname: ${DOMAIN}
EOF

cat > "${CI_DIR}/user-data" <<EOF
#cloud-config

system_info:
  default_user:
    name: andy

ssh_authorized_keys:
  - $(cat ${PUB_KEY})
EOF

(
  cd "${CI_DIR}"
  sudo genisoimage -output "/vol1/vm/iso/${DOMAIN}.iso" -volid cidata -joliet -rock user-data meta-data
)
rm -rf "${CI_DIR}"

echo "$0: copying disk image"
sudo qemu-img create -f qcow2 -F qcow2 -b "/vol1/vm/${TEMPLATE}" "/vol1/vm/${DOMAIN}.qcow2"

echo "$0: creating VM"
sudo virt-install --name "${DOMAIN}" \
  --memory ${MEMORY} \
  --vcpus ${VCPUS} \
  --disk "/vol1/vm/${DOMAIN}.qcow2,device=disk,bus=virtio" \
  --disk "/vol1/vm/iso/${DOMAIN}.iso,device=cdrom" \
  --os-variant ol9.4 \
  --virt-type kvm --graphics none \
  --network network=default,model=virtio \
  --noautoconsole \
  --import

echo "$0: waiting for IP"
while ! sudo virsh net-dhcp-leases --network default | grep "${DOMAIN}"; do
  sleep 5
done

echo "$0: Your vm is ready to use!"
