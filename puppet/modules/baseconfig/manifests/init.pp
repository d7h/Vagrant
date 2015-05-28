# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  host { 'hostmachine':
    ip => '192.168.42.77';
  }

  $packages = ["curl", "wget","vim", "nano", "npm", "node"]
  package { $packages:
    ensure => present,
  }

  file { '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }
  
    file { '/var/lib/puppet/':
      owner => 'puppet',
      group => 'puppet',
      mode  => '0644',
  }
  
}
