I. Cài đặt và sử dụng composer trong các trường hợp thực tế


The first download composer with command:
curl -sS https://getcomposer.org/installer | php
The command above will download a file composer.phar to current directory
If you can run use composer with command

php composer.phar require magepow/core
or   
php -dmemory_limit=4G /usr/local/bin/composer require magepow/core
php -dmemory_limit=-1 composer.phar require magepow/core

or sử dụng với tham số --no-update để add nhiều module sau đó update một lần

php composer require magepow/core --no-update
php -dmemory_limit=4G /usr/local/bin/composer update

If you do not want inlcude php in command you can set permssion execute for file composer.phar with command:

chmod +x composer.phar 



Continue you can run command without php

composer.phar require magepow/core

If you want run command without .phar you can setup composer command use command below:

cp composer.phar /usr/local/bin/composer && cp composer.phar /usr/local/bin/composer.phar && cp composer.phar /usr/bin/composer && mv composer.phar /usr/bin/composer.phar

Now you can run command:
composer require magepow/core


update version composer from 1.x
composer self-update
or 
composer self-update --1
./composer.phar self-update --1

Upgrade version composer from 1.x to 2.x
composer self-update --2

or Downgrade 2.x to 1.x
composer self-update --1

Lỗi với composer thường gặp


Lỗi autoload file php qua composer thử run command: 

composer dumpautoload

Lỗi authenticate composer account magento 2 (support Quyết)


Tạo một file với name auth.json then add code below to file

{
    "http-basic": {
        "repo.magento.com": {
            "username": "string public key",
            "password": "string private key"
        }
    }
}




II.  How to run command PHP special version (support Nhu)


Run command php special version on the server and some control panel popular
You can create a file info.php put code below to file

<?php 
phpinfo();




The default something as below
/usr/local/php56/bin/php --version
/usr/local/php70/bin/php --version
/usr/local/php80/bin/php --version

/usr/bin/php70
or 

/usr/local/php56/bin/php-cli --version
/usr/local/php70/bin/php-cli --version
/usr/local/php80/bin/php-cli --version



1. Cpanel


/usr/local/bin/ea-php56 --version
/usr/local/bin/ea-php70 --version
/usr/local/bin/ea-php80 --version

2. Plesk Panel multiple PHP version

/opt/plesk/php/5.6/bin/php --version
/opt/plesk/php/7.0/bin/php --version
/opt/plesk/php/8.0/bin/php --version

3. Centos Web Panel (CWP)
You your server install multiple PHP version you can run command special follow path

/opt/alt/php56/usr/php/bin/php --version
/opt/alt/php70/usr/php/bin/php --version
/opt/alt/php80/usr/php/bin/php --version

If you use PHP-FPM use command:

/opt/alt/php-fpm56/usr/bin/php --version
/opt/alt/php-fpm70/usr/bin/php --version
/opt/alt/php-fpm80/usr/bin/php --version

4. VestaCp

/usr/bin/php56 --version
/usr/bin/php70 --version
/usr/bin/php80 --version

Continue Update



III. use cp, rsync, zip trong một số trường hợp thực tế (Dự án lớn)

1. Đồng bộ trên cùng hệ thống
rsync -avz  --progress  biolife ~/

2. Đồng bộ trên 2 hệ thống khác nhau qua ssh
rsync -avz   --progress -e "ssh" magepow:~/m2.alothemes.coms/alo_woow_quickstart.zip ~/ &


Mình có note một số trường hợp sử dụng ở đây: https://gist.github.com/magepow


IV. How to run command with another use if su -s /bin/bash www not work
 Tìm user trong file /etc/passwd thay "/sbin/nologin" thành "/bin/bash"

V. Debug trong PHP một số trường hợp cần lưu ý (support Mạnh)
	Luôn dùng: ini_set('display_startup_errors', 1);ini_set('display_errors', 1); error_reporting(-1);   

	Chú ý đến try catch sẽ ko show lỗi nếu để trong try catch

    public function getUserProfile($apiName, $area = null)
    {
        $config = [
            'base_url'   => $this->apiHelper->getBaseAuthUrl($area),
            'providers'  => [
                $apiName => $this->getProviderData($apiName)
            ],
            'debug_mode' => false,
            'debug_file' => BP . '/var/log/social.log'
        ];
        $auth = new Hybrid_Auth($config);
        try {
            $adapter     = $auth->authenticate($apiName);
            $userProfile = $adapter->getUserProfile();
        } catch (Exception $e) {
            $auth->logoutAllProviders();
            $auth        = new Hybrid_Auth($config);
            $adapter     = $auth->authenticate($apiName);
            $userProfile = $adapter->getUserProfile();
        }
        return $userProfile;
    }


    Sử dụng log của magento 2

	$log = \Magento\Framework\App\ObjectManager::getInstance()
	    ->get(\Psr\Log\LoggerInterface::class);


	      // saved in var/log/debug.log
	        $log->debug('debug1234'); 
	        //Output: [2017-02-22 04:48:44] main.DEBUG: debug1234 {"is_exception":false} []
	        
	        $log->info('info1234'); 
	        // Write to default log file: var/log/system.log
	        //Output: [2017-02-22 04:52:56] main.INFO: info1234 [] []
	        
	        $log->alert('alert1234'); 
	        // Write to default log file: var/log/system.log
	        //Output: [2017-02-22 04:52:56] main.ALERT: alert1234 [] []
	        
	        $log->notice('notice1234'); 
	        // Write to default log file: var/log/system.log
	        //Output: [2017-02-22 04:52:56] main.NOTICE: notice1234 [] []
	        
	        // Write to default log file: var/log/system.log
	        $log->error('error1234'); 
	        //Output: [2017-02-22 04:52:56] main.ERROR: error1234 [] []
	        
	         // Write to default log file: var/log/system.log
	        $log->critical('critical1234'); 
	        //Output: [2017-02-22 04:52:56] main.CRITICAL: critical1234 [] []
	        
	        // Adds a log record at an arbitrary level
	        $level = 'DEBUG';
	        // saved in var/log/debug.log
	        $$log->log($level,'debuglog1234', array('msg'=>'123', 'new' => '456')); 
	        //Output: [2017-02-22 04:52:56] main.DEBUG: debuglog1234 {"msg":"123","new":"456","is_exception":false} []
	        
	        // Write to default log file: var/log/system.log
	        $level = 'ERROR';
	        $log->log($level,'errorlog1234', array( array('test1'=>'123', 'test2' => '456'), array('a'=>'b') )); 
	        //Output: [2017-02-22 04:52:56] main.ERROR: errorlog1234 [{"test1":"123","test2":"456"},{"a":"b"}] []  


VI. Cài đăt module một trường hợp mới gặp cần lưu ý (support Hội)

	Kiểm trả các phụ thuộc trong phần "require" trong file composer.json nếu file được kèm theo trong module

VII.  Elasticsearch in magento 2

Kiểm tra Elasticsearch được cài đặt trên server chưa dùng lệnh: curl localhost:9200

Config to use Elasticsearch with command:

php bin/magento config:set catalog/search/engine elasticsearch7


Lỗi hay gặp với Elasticsearch khi reindex

	a. Could not validate a connection to Elasticsearch. No alive nodes found in your cluster => Full disk

	b. cluster currently has [1000]/[1000] maximum shards open
	refer fix here https://github.com/wazuh/wazuh-puppet/issues/222

VIII. Thay đổi domain khi không vào được site khi di chuyển site

	php bin/magento config:set web/unsecure/base_url "http://domain.com/"
	php bin/magento config:set web/secure/base_url "https://domain.com/"

	note: end "/"

IX. Run a command background do not keep connect to servr while running.

	Thêm dấu & vào sau lệnh muốn chạy để chạy dưới chế độ background
	Sau đó dùng lệnh exit để close connect đến server và lệnh vẫn được thực thi


	Thay dổi quyền sở hữu

	sudo chown -R apache:apache *
	sudo chown -R www:www *

	Thay đổi permssion

	find ./ -type d -exec chmod 755 {} + && find ./ -type f -exec chmod 644 {} +

	find /home/wp2cart/public_html/biolife -type d -exec chmod 755 {} + && find /home/wp2cart/public_html/biolife -type f -exec chmod 644 {} +


11. Bash shell cơ bản (1 buổi khác)



