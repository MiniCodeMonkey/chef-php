# Author:: Panagiotis Papadomitsos (pj@ezgr.net)
#
# Cookbook Name:: php
# Attribute:: versions
#
# Copyright 2011, Opscode, Inc.
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
#

# Make use of the atomic RHEL repo optional
default['php']['use_atomic_repo'] = true

# Select the PHP repository you want to use from DotDeb
# It's either squeeze-php54 or wheezy-php55
default['php']['dotdeb_distribution'] = 'squeeze-php54'

# It's either mysql or mysqlnd
default['php']['mysql_module_edition'] = 'mysqlnd'

# Define package list
case node['platform_family']
when 'rhel', 'fedora'
  default['php']['packages'] = %w{ php php-common php-devel php-cli php-pear }
  default['php']['fpm_package'] = 'php-fpm'
else
  default['php']['packages'] = %w{ php5-cgi php5 php5-dev php5-cli php-pear }
  default['php']['fpm_package'] = 'php5-fpm'
end

