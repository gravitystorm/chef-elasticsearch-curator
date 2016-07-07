name             'elasticsearch-curator'
maintainer       'servers.com'
maintainer_email 'dmitry.r@cyberflow.net'
license          'MIT'
description      'Installs/Configures elasticsearch-curator'
long_description 'Installs/Configures elasticsearch-curator'
version          '0.1.0'

%w(apt poise-python).each do |ckbk|
  depends ckbk
end


chef_version '>= 12.0' if respond_to?(:chef_version)
source_url 'https://github.com/cyberflow/chef-elasticsearch-curator' if respond_to?(:source_url)
issues_url 'https://github.com/cyberflow/chef-elasticsearch-curator/issues' if respond_to?(:issues_url)
