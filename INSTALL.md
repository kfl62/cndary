####Configurare Ubntu
  * configurare system

      - server MySQL
          - implicit pornit on reboot

      - server web start din `/opt/nginx` ca si service
          - implicit pornit on reboot
          - acum ar trebui sa functioneze `sudo service nginx start|stop|...|`
          - `sudo /usr/sbin/update-rc.d -f nginx defaults`
          - `sudo chmod +x /etc/init.d/nginx`
          - `sudo mv init-deb.sh /etc/init.d/nginx`
          - `wget -O init-deb.sh http://library.linode.com/assets/660-init-deb.sh`

  * instalare diverese
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
