# How to recover data losted
sudo apt update

# Install foremost tool
sudo apt-get install foremost

# List devises connected
sudo fdisk -l

# Create a folder
mkdir output

# Go inside to output
cd output

# Choose files to recover
foremost -i pdf,docx /path/pendrive_or_hd_or_folder
