sudo mkdir -p /mnt/iso

#wget https://ctan.mirrors.hoobly.com/systems/texlive/Images/texlive2024.iso
wget https://linux-mirror.xicalcoatl.mx/ctan/systems/texlive/Images/texlive2025.iso

sudo mount -o loop texlive2025.iso /mnt/iso
sudo /mnt/iso/install-tl --no-interaction
sudo umount /mnt/iso
rm texlive2025.iso

# add to:  ~/.latexmkrc 
# $pdf_previewer = 'okular';
