#
# Cookbook:: learn_chef_httpd
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#package 'httpd'

#service 'httpd' do
#  action [:enable, :start]
#end

#template '/var/www/html/index.html' do
#  source 'index.html.erb'
#end

#execute 'java install' do
#  command 'yum install java -y'
#end

# Install Tomcat 8.0.47 to the default location
remote_file '/opt/apache-tomcat-8.0.47.tar.gz' do
  source 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.47/bin/apache-tomcat-8.0.47.tar.gz'
  mode '0755'
  action :create
end


execute 'extract tomcat' do
  cwd '/opt'
  command 'tar -xvf apache-tomcat-8.0.47.tar.gz'
end

execute 'start tomcat server' do
  cwd '/opt/apache-tomcat-8.0.47/bin/'
  command './startup.sh'
end

remote_file '/opt/apache-tomcat-8.0.47/webapps/sample.war' do
  mode '0644'
  source 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
  checksum '89b33caa5bf4cfd235f060c396cb1a5acb2734a1366db325676f48c5f5ed92e5'
end

execute 'install mysql server' do
  command 'yum install -y mysql-server'
end

execute 'install mysql client' do
  command 'yum install -y mysql'
end
  






#tomcat_install 'helloworld' do
#  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.47/bin/apache-tomcat-8.0.47.tar.gz'
#  tomcat_user 'cool_user'
#  tomcat_group 'cool_group'
#end
