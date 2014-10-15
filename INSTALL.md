####Configurare Ubntu
  * configurare aplicatie

      - `git clone https://kfl62@bitbucket.org/kfl62/cndary.git`
      - `cd /opt/nginx/html`

  * configurare system

      - server web configurare `/opt/nginx/conf`
          - `cndary` passenger
          - ptr. `phpmyadmin` symlink `sudo ln -s /usr/share/phpmyadmin/ /opt/nginx/html/mysql`

      - server web start din `/opt/nginx` ca si service
          - `/opt/nginx/etc/nginx.conf`
          - implicit pornit on reboot
          - acum ar trebui sa functioneze `sudo service nginx start|stop|...|`
          - `sudo /usr/sbin/update-rc.d -f nginx defaults`
          - `sudo chmod +x /etc/init.d/nginx`
          - `sudo mv init-deb.sh /etc/init.d/nginx`
          - `wget -O init-deb.sh http://library.linode.com/assets/660-init-deb.sh`

      - server MySQL
          - comentare linia `#bind-address = 127.0.0.1` in `/etc/mysql/my.conf` ptr. acces de afara
          - `mysql -u root -p` si comanda `GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'scherer';` ptr. acces de afara
          - implicit pornit on reboot

  * instalare diverese
      - `sudo apt-get install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-xcache`
      - `sudo apt-get install php5 php5-fdm phpmyadmin`
      - `rvmsudo passenger-install-nginx-module` instalare nginx in `/opt/nginx`
      - `sudo apt-get install libcutl4-openssl-dev` required by passenger-nginx
      - `gem install passenger` for "mod_rail"
      - `gem install bundler` for handling dependencies
      - `rvm rubygems current` set gems defaults
      - `rvm use ruby-2.1.3 --default`
      - `rvm install ruby` dupa un logout si login in putty
      - `sudo usermod -a -G rvm ary` user ary membru grupa rvm
      - `\curl -sSL https://get.rvm.io | sudo bash -s stable` install RVM
      - `sudo apt-get mysql-server mysql-client` parola root 'scherer'
      - `sudo apt-get install build-essential`
      - `sudo apt-get install git`
      - probleme ownership in /home/ary `sudo chown -R ary:ary .`

  * configurare `sudo` NOPASSWD `sudo visudo`
