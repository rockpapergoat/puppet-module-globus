# @summary Manage Globus CLI
#
# @example
#   include ::globus::cli
#
# @param manage_python
class globus::cli (
  Boolean $manage_python = true,
) {

  if $manage_python {
    class { 'python':
      virtualenv => 'present',
    }
    Package['virtualenv'] -> Python::Virtualenv['/opt/globus-cli']
  }

  python::virtualenv { '/opt/globus-cli':
    ensure     => 'present',
    distribute => false,
  }
  -> python::pip { 'globus-cli':
    virtualenv => '/opt/globus-cli',
  }

  file { '/usr/bin/globus':
    ensure  => 'link',
    target  => '/opt/globus-cli/bin/globus',
    require => Python::Pip['globus-cli'],
  }

}
