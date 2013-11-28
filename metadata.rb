name             'bamboo-nodejs-mocha'
maintainer       'Issac Goldstand'
maintainer_email 'margol@beamartyr.net'
license          'Apache v2'
description      'Installs/Configures Atlassian Bamboo with the Node.JS plugin and Mocha support enabled'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

recipe "default", "Installs Bamboo Standalone"
recipe "mysql", "Configures MySQL database for Bamboo"

depends "java", "1.15.4"
depends "mysql", "4.0.0"
depends "database", "1.5.2"
depends "ark", "0.4.0"
depends "nodejs", "1.3.0"
