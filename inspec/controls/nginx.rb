# Author: Gordon Murray
# Target OS: Ubuntu
title 'Ensure Nginx is set up correctly'

    describe service('nginx') do
        it { should be_installed }
        it { should be_enabled }
        it { should be_running }
    end

    describe service('apache') do
        it { should_not be_installed }
        it { should_not be_enabled }
        it { should_not be_running }
    end

    describe port(80) do
        it { should be_listening }
    end

    describe port(443) do
        it { should_not be_listening }
    end

    describe file('/var/www/html/index.nginx-debian.html') do
        it { should_not exist }
    end

    describe file('/etc/nginx/sites-available/zapier.ingress.gordonmurray.com') do
        it { should exist }
    end

    describe file('/etc/nginx/sites-enabled/zapier.ingress.gordonmurray.com') do
        it { should exist }
    end

    describe file('/etc/nginx/sites-enabled/default') do
        it { should_not exist }
    end

    describe bash('php -v') do
        its('exit_status') { should eq 0 }
    end

    describe file('/var/www/html/index.php') do
        it { should exist }
    end

    describe file('/var/www/html/composer.json') do
        it { should exist }
    end

    describe file('/var/www/html/composer.lock') do
        it { should exist }
    end

    describe file('/var/www/html/composer.phar') do
        it { should_not exist }
    end

    describe file('/var/www/html/composer.sh') do
        it { should_not exist }
    end