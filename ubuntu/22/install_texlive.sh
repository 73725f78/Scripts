sudo mkdir -p /mnt/iso

wget https://us.mirrors.cicku.me/ctan/systems/texlive/Images/texlive2026.iso

sudo mount -o loop texlive2026.iso /mnt/iso
sudo /mnt/iso/install-tl --no-interaction
sudo umount /mnt/iso
rm texlive2026.iso
