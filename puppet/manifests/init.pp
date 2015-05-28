# create a new run stage to ensure certain modules are included first/last
stage { 'pre':
  before => Stage['main']
}

stage { 'post':
  require => Stage['main']
}

# add the baseconfig module to the new 'pre' or 'post' run stage
class { 'baseconfig':
  stage => 'pre'
}

class { 'postconfig':
  stage => 'post'
}

# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}

include baseconfig
include postconfig
