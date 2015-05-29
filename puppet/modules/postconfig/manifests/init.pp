# == Class: postconfig
#
# Performs post configuration tasks for all Vagrant boxes.
#
class postconfig {



#  exec { "yiic_migrate" :    
#    command => "sudo php yiic migrate --interactive=0",
#    cwd => "/vagrant/guidelines/protected",
#    path => "/usr/local/bin:/bin:/usr/bin",
#    require => Exec['fake_guidelines_emails'],
#  }

  #Wegen einem Bug in docker-compose im Moment hier untergebracht und nicht wie die anderen Container im Vagrantfile direkt.

  exec { "start_etcd_Container" :    
    command => "sudo docker run -d -name etcd -p 4001:4001 -v /usr/share/ca-certificates/:/etc/ssl/certs quay.io/coreos/etcd:v2.0.11 -advertise-client-urls http://192.168.42.77:4001 -listen-client-urls http://0.0.0.0:4001",
    cwd => "/",
    path => "/usr/local/bin:/bin:/usr/bin",
  }

  exec { "start_dockerui_Container" :    
    command => "sudo docker run -d -name dockerui -p 9000:9000 -v /var/run/docker.sock:/docker.sock dockerui/dockerui -e /docker.sock",
    cwd => "/",
    path => "/usr/local/bin:/bin:/usr/bin",
  }

  exec { "Create Table" :    
    command => "nodejs /vagrant/nodeapp/CreateTable.js && touch /TableCreated",
    cwd => "/",
    path => "/usr/local/bin:/bin:/usr/bin",
    creates => "/TableCreated",
  }

  Exec { environment => [ "HOME=/home/vagrant/" ] }
  
}
