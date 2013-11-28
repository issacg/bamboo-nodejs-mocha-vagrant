include_recipe "mysql::server"
include_recipe "database::mysql"

service "mysql" do
  action [:enable, :start]
end

database_connection = { :host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password'] }

mysql_database node[:bamboo][:database][:dbname] do
  connection database_connection
  collation "utf8_bin"
  encoding "utf8"
  action :create
end

# See this MySQL bug: http://bugs.mysql.com/bug.php?id=31061
mysql_database_user "" do
  connection database_connection
  host "localhost"
  action :drop
end

mysql_database_user node[:bamboo][:database][:user] do
  connection database_connection
  host "localhost"
  password node[:bamboo][:database][:password]
  database_name node[:bamboo][:database][:dbname]
  action [:create, :grant]
end
