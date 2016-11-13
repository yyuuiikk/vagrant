
Vagrant.configure("2") do |config|

  ## 参照するbox
  config.vm.box = "centos7"

  ## ネットワーク設定
	config.vm.network "forwarded_port", guest: 80, host: 8080
	config.vm.network "forwarded_port", guest: 1337, host: 1337, id: "nodejs"

	## 共有フォルダの許可権設定
	config.vm.synced_folder "./", "/vagrant/www",owner:"apache",group:"apache",mount_options:['dmode=777', 'fmode=777']

	## 公開鍵を置き換えないようにする。
	config.ssh.insert_key = false

	## shファイルの読み込み設定
	config.vm.provision :shell, :path => "provision.sh"

end
