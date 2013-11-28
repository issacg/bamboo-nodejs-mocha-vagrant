#
# Cookbook Name:: bamboo-nodejs-mocha
# Recipe:: default
#
# Copyright (C) 2013 Issac Goldstand <margol@beamartyr.net>
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "java"
# Override JAVA defaults
#include_attribute "default"
include_recipe "nodejs"
include_recipe "nodejs::npm"

group node[:bamboo][:group]
user node[:bamboo][:user] do
  group node[:bamboo][:group]
  system true
  shell "/bin/bash"
end

directory node[:bamboo][:home] do
  owner node[:bamboo][:user]
end

directory File.expand_path("..", node[:bamboo][:install]) do
  recursive true
  action :create
end

ark 'bamboo' do
  url "http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-#{node[:bamboo][:version]}.tar.gz"
  version node[:bamboo][:version]
  home_dir node[:bamboo][:install]
  owner node[:bamboo][:user]
  action :install
end 

# Should this be here, or in mysql recipe?
ark 'mysql-j' do
  url "http://downloads.mysql.com/archives/mysql-connector-java-5.1/mysql-connector-java-5.1.13.tar.gz"
  creates 'mysql-connector-java-5.1.13/mysql-connector-java-5.1.13-bin.jar'
  path "#{node[:bamboo][:install]}/lib"
  action :cherry_pick
end

directory "#{node[:bamboo][:home]}/plugins/" do
  owner node[:bamboo][:user]
end

remote_file "#{node[:bamboo][:home]}/plugins/bamboo-nodejs-plugin-mocha.jar" do
  source node[:bamboo][:nodejsplugin]
  owner node[:bamboo][:user]
  group node[:bamboo][:user]
end

template "#{node[:bamboo][:install]}/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties" do
  source "bamboo-init.properties.erb"
  owner node[:bamboo][:user]
  group node[:bamboo][:group]
  mode 0664
end

template "/etc/init.d/bamboo" do
  source "bamboo.init.d.erb"
  mode 0755
end

service "bamboo" do
  supports :start => true, :stop => true, :restart => true
  action [ :enable, :start ]
end