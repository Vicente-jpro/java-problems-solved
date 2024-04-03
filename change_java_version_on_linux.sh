
#Extract jdk file
tar -xzf jdk-14.0.2_linux-x64_bin.tar.gz

# mv extrated file to lib
sudo mv jdk-14.0.2 /usr/lib/jvm/

# Add jdk-14.0.2 to the system.
# 99 meaning the position in the list.
# After choose the position you have to see what is the next position in the list if you install
# a new java version. If the last is 3 now your jdk-14.0.2 have to be 4
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-14.0.2/bin/java 99
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-14.0.2/bin/javac 99
