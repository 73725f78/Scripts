sudo mkdir -p /mnt/iso

wget https://ctan.mirrors.hoobly.com/systems/texlive/Images/texlive2024.iso

sudo mount -o loop texlive2024.iso /mnt/iso
sudo /mnt/iso/install-tl --no-interaction
sudo umount /mnt/iso
rm texlive2024.iso
