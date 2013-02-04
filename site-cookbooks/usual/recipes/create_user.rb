groupadd admins
useradd -G admins -N -m -s /bin/bash -p '$1$ihlrowCw$E2XkR5.FkOcccyKowf7lE.' stamm

aptitude install sudo
echo "stamm ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/stamm
chmod 0440 /etc/sudoers.d/stamm
