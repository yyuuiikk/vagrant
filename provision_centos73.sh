### selinux off
#sudo setenforce 0
#sudo sed -i_bk -e "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
#sudo shutdown -r now
#
### firewallを無効化
#sudo systemctl stop firewalld
#sudo systemctl disable firewalld.service
#
### locale setup ja
#sudo localectl set-locale LANG=ja_JP.utf8
#
### setup timezone
#sudo timedatectl set-timezone Asia/Tokyo
#
### setup chrony
#sudo yum install chrony
#
#sudo sed -i_bk -e "s/server 0.centos/#server 0.centos/g" /etc/chrony.conf
#sudo sed -i -e "s/server 1.centos/#server 1.centos/g" /etc/chrony.conf
#sudo sed -i -e "s/server 2.centos/#server 2.centos/g" /etc/chrony.conf
#sudo sed -i -e "s/server 3.centos/#server 3.centos/g" /etc/chrony.conf
#### add "server ntp.nict.jp iburst"
#
#sudo systemctl enable chronyd
#sudo systemctl start chronyd


## httpdインストール
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd.service

## epelレポジトリを追加
sudo yum -y install epel-release

## remiレポジトリを追加
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

## mariadbの削除
sudo yum -y remove mariadb-libs
## MySQLリポジトリの追加
sudo yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum -y install yum-utils

# 開発用パッケージ
sudo yum groupinstall "Development tools"
sudo yum install man man-pages man-pages-overrides man-pages-ja
sudo yum install wget
sudo yum install vim
sudo yum install -y git gcc gcc-c++ openssl-devel readline-devel

# ruby install(https://qiita.com/Fendo181/items/d14ebfb148223c8e5ecb)
#sudo yum remove ruby
#git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
#echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
#echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
#source ~/.bash_profile

## ruby-build install
#git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
#cd ~/.rbenv/plugins/ruby-build
#sudo ./install.sh
