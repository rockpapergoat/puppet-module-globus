# @summary Manage globus repo
# @api private
class globus::repo::el ($proxy = $globus::proxy) {
  if String($globus::version) == '5' {
    $gcs_enabled = '1'
  } else {
    $gcs_enabled = '0'
  }
  if $globus::enable_testing_repos {
    $testing_enabled = '1'
    if $gcs_enabled == '0' {
      $gcs_testing_enabled = '0'
    } else {
      $gcs_testing_enabled = '1'
    }
  } else {
    $testing_enabled = '0'
    $gcs_testing_enabled = '0'
  }
  if String($globus::version) == '4' {
    ensure_packages($globus::repo_dependencies)
  }

  if $proxy == undef {
    $_proxy = '_none_'
  } else {
    $_proxy = $globus::proxy
  }

  yumrepo { 'Globus-Toolkit':
    descr          => 'Globus-Toolkit-6',
    baseurl        => $globus::toolkit_repo_baseurl,
    failovermethod => 'priority',
    priority       => '98',
    enabled        => '1',
    gpgcheck       => '1',
    gpgkey         => 'https://downloads.globus.org/toolkit/globus-connect-server/RPM-GPG-KEY-Globus',
    proxy          => $_proxy
  }

  yumrepo { 'Globus-Toolkit-6-Testing':
    descr          => 'Globus-Toolkit-6-testing',
    baseurl        => $globus::toolkit_repo_testing_baseurl,
    failovermethod => 'priority',
    priority       => '98',
    enabled        => $testing_enabled,
    gpgcheck       => '1',
    gpgkey         => 'https://downloads.globus.org/toolkit/globus-connect-server/RPM-GPG-KEY-Globus',
    proxy          => $_proxy
  }

  yumrepo { 'globus-connect-server-5':
    descr          => 'Globus-Connect-Server-5',
    baseurl        => $globus::gcs_repo_baseurl,
    failovermethod => 'priority',
    priority       => '98',
    enabled        => $gcs_enabled,
    gpgcheck       => '1',
    gpgkey         => 'https://downloads.globus.org/toolkit/globus-connect-server/RPM-GPG-KEY-Globus',
    proxy          => $_proxy
  }

  yumrepo { 'globus-connect-server-5-testing':
    descr          => 'Globus-Connect-Server-5-Testing',
    baseurl        => $globus::gcs_repo_testing_baseurl,
    failovermethod => 'priority',
    priority       => '98',
    enabled        => $gcs_testing_enabled,
    gpgcheck       => '1',
    gpgkey         => 'https://downloads.globus.org/toolkit/globus-connect-server/RPM-GPG-KEY-Globus',
    proxy          => $_proxy
  }
}
