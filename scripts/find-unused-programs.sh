
# Manually installed packages
# https://askubuntu.com/questions/2389/how-to-list-manually-installed-packages
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

# Packages that are not dependencies of any other package
# https://www.client9.com/debian-find-packages-without-reverse-dependencies/
for target in `dpkg -l | grep '^ii' | awk '{ print \$2 }'`; do
   if [ "`apt-cache rdepends --installed $target | wc -l`" = "2" ]; then
      echo "$target"
   fi
done

# Reverse dependencies
# https://askubuntu.com/questions/13296/how-do-i-find-the-reverse-dependency-of-a-package
apt-cache rdepends --installed jetty

# Reverse dependencies (duplicate)
# https://sleeplessbeastie.eu/2018/09/26/how-to-display-reverse-package-dependencies/
apt-cache rdepends --no-recommends --no-suggests --no-enhances tmux

# Reverse dependencies (duplicate)
# https://askubuntu.com/a/129324/877422
aptitude -v why bash

# Mark as auto-installed
sudo apt-mark auto zlib1g-dev