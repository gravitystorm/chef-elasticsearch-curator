# elasticsearch-curator

Chef cookbook to install and configure [elasticsearch-curator](https://www.elastic.co/guide/en/elasticsearch/client/curator/current/index.html) from version 4.

## Tested Platforms

* ubuntu 14.04

## Usage

This cookbook can be used by including `elasticsearch-curator::default` in your run list and settings attributes as needed.  Alternatively, you can use the custom resources directly.

### Attributes

| Key                                  | Type   | Description                                           | Default                                                                                                                                                             |
|--------------------------------------|--------|-------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| node['elasticsearch-curator']['version']          | String | Version of elasticsearch-curator to install, nil = latest | nil |
| node['elasticsearch-curator']['repository_url'] | String | URL of elasticsearch-curator package repository | 'http://packages.elastic.co/curator/4/debian' |
| node['elasticsearch-curator']['repository_key']           | String   | elasticsearch-curator repository key | 'https://packages.elastic.co/GPG-KEY-elasticsearch' |


This cookbook ships with custom resources for install elasticsearch-curator and managing the configuration file:

### Custom Resources

#### elasticsearch_curator_install

Installs elasticsearch-curator. Optionally specifies a version, otherwise the latest available is installed

```ruby
elasticsearch_curator_install 'curator' do
  install_method node['elasticsearch-curator']['install_method']
  action :install
end
```

#### elasticsearch_curator_config

Writes out the elasticsearch-curator configuration file.

```ruby
elasticsearch_curator_config 'default' do
  config node['elasticsearch-curator']['config']
  action :configure
end
```

#### elasticsearch_curator_action

This will setup a cron job and create action.yaml file for elasticsearch-curator.

```ruby
elasticsearch_curator_action 'action' do
  config node['elasticsearch-curator']['config']
  minute '0'
  hour '*'
  action :create
end
```

## Tests

To run tests, install all dependencies with [bundler](http://bundler.io/):

    bundle install

