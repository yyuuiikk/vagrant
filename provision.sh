## firewallを無効化
sudo systemctl stop firewalld
sudo systemctl disable firewalld.service

## httpdインストール
#sudo yum -y install httpd
#sudo systemctl start httpd
#sudo systemctl enable httpd.service

## epelレポジトリを追加
sudo yum -y install epel-release

## remiレポジトリを追加
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

## php のインストール
sudo yum -y install --enablerepo=remi,remi-php56 php php-devel php-mbstring php-pdo php-gd

## mariadbの削除
sudo yum -y remove mariadb-libs

## MySQLリポジトリの追加
sudo yum localinstall http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm

# MySQL5.6のリポジトリの有効化
#sudo yum -y install yum-utils
#sudo yum-config-manager --disable mysql57-community
#sudo yum-config-manager --enable mysql56-community

# MySQLのインストール
#sudo yum -y install mysql-community-server
#sudo systemctl start mysqld

# ntp
sudo yum -y install ntp
sudo cp /etc/ntp.conf /etc/ntp.conf.org
sudo sed -i -e "s/server 0.centos.pool.ntp.org iburst/server -4 ntp.nict.jp/" /etc/ntp.conf
sudo sed -i -e "s/server 1.centos.pool.ntp.org iburst/server -4 ntp1.jst.mfeed.ad.jp/" /etc/ntp.conf
sudo sed -i -e "s/server 2.centos.pool.ntp.org iburst/server -4 ntp2.jst.mfeed.ad.jp/" /etc/ntp.conf
sudo sed -i -e "s/server 3.centos.pool.ntp.org iburst/server -4 ntp3.jst.mfeed.ad.jp/" /etc/ntp.conf
sudo systemctl start ntpd.service
sudo systemctl enable ntpd.service
sudo timedatectl set-timezone Asia/Tokyo

# 開発用パッケージ
sudo yum groupinstall "Development tools"
sudo yum install man man-pages man-pages-overrides man-pages-ja
sudo yum install wget
sudo yum install vim
