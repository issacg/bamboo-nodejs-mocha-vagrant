default[:bamboo][:version] = '5.3';
default[:bamboo][:user] = 'bamboo';
default[:bamboo][:group] = 'bamboo';
default[:bamboo][:home] = '/home/bamboo';
# Save install_base seperately, so we can create the base dir with a directory block, while not creating the full dir (which will be a symlink)
default[:bamboo][:install] = '/usr/local/atlassian/bamboo';

default[:bamboo][:nodejsplugin] = 'https://marketplace.atlassian.com/download/plugins/com.atlassian.bamboo.plugins.bamboo-nodejs-plugin/version/31';

default[:bamboo][:database][:type] = 'mysql';
default[:bamboo][:database][:user] = 'bamboo';
default[:bamboo][:database][:password] = 'bamboo';
default[:bamboo][:database][:dbname] = 'bamboo'; 

default[:java][:jdk_version] = 7;
default[:java][:install_flavor] = 'oracle';
default[:nodejs][:version] = '0.10.22';
default[:git][:version] = '1.8.4';
default[:mysql][:bind_address] = '127.0.0.1';
