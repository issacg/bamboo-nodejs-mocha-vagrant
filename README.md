# bamboo-nodejs-mocha cookbook

Installs the Atlassian Bamboo server, with the Node.JS plugin and Mocha support

# Requirements

Vagrant
vagrant-berkshelf plugin
vagrant-omnibus plugin

IMPORTANT: You must manually edit attributes/oracle.rb to signify acceptance of Oracle's Java download terms before running "vagrant up"

# Recipes
default - Install bamboo, nodejs + prerequisites
mysql - Install local MySQL server ready for use with Bamboo

# Author

Author:: Issac Goldstand (margol@beamartyr.net)
