wget https://linux-mirror.xicalcoatl.mx/ctan/systems/texlive/Images/texlive2024.iso

sudo hdiutil mount texlive2024.iso
sudo /Volumes/TeXLive2024/install-tl --no-interaction
sudo hdiutil unmount /Volumes/TeXLive2024/
rm texlive2024.iso
