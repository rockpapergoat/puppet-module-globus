# @summary Manage Globus
#
# @example Install and setup a Globus v5.4 endpoint
#   class { 'globus':
#     display_name  => 'REPLACE My Site Globus',
#     client_id     => 'REPLACE-client-id-from-globus',
#     client_secret => 'REPLACE-client-id-from-globus',
#     owner         => 'REPLACE-user@example.com',
#   }
#
# @param version
#   Major version of Globus to install. Only needed to install Globus v4
# @param include_io_server
#   Setup Globus v4 IO server
#   Globus v4 only
# @param include_id_server
#   Setup Globus v4 ID server
#   Globus v4 only
# @param include_oauth_server
#   Setup Globus v4 OAuth server
#   Globus v4 only
# @param release_url
#   Release URL of Globus release RPM
#   Globus v4 & v5
# @param toolkit_repo_baseurl
#   Globus Toolkit RPM repo baseurl
#   Globus v4 & v5
# @param toolkit_repo_testing_baseurl
#   Globus Toolkit testing RPM repo baseurl
#   Globus v4 & v5
# @param gcs_repo_baseurl
#   Globus Connect Server repo baseurl
#   Globus v4 & v5
# @param gcs_repo_testing_baseurl
#   Globus v5 testing repo baseurl
#   Globus v4 & v5
# @param enable_testing_repos
#   Boolean that sets if testing repos should be added
# @param extra_gridftp_settings
#   Additional settings for GridFTP
#   Globus v4 & v5
# @param first_gridftp_callback
#   Used when running GridFTP from Globus with OSG, see README.
#   Globus v4 only
# @param manage_service
#   Boolean to set if globus-gridftp-server service is managed
#   Globus v4 & v5
# @param run_setup_commands
#   Boolean to set if the commands to setup Globus are run (v4 and v5)
#   Globus v4 & v5
# @param manage_firewall
#   Boolean to set if firewall rules are managed by this module
#   Globus v4 & v5
# @param manage_epel
#   Boolean to set if EPEL is managed by this repo
#   Globus v4 & v5
# @param repo_dependencies
#   Additional repo dependencies
#   Globus v4 only
# @param manage_user
#   Boolean to set if the gcsweb user and group are managed by this module
#   Globus v5 only
# @param group_gid
#   The gcsweb group GID
#   Globus v5 only
# @param user_uid
#   The gcsweb user UID
#   Globus v5 only
# @param package_name
#   Globus v5 package name
# @param display_name
#   Display name to use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param client_id
#   --client-id use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param client_secret
#   --client-secret use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param owner
#   --owner use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param organization
#   --organization use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param deployment_key
#   --deployment-key use when running 'globus-connect-server endpoint setup'
#   The parent directory of this path must be writable by gcsweb user
#   Globus v5 only
# @param keywords
#   --keywords use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param department
#   --department use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param contact_email
#   --contact-email use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param contact_info
#   --contact-info use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param info_link
#   --info-link use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param description
#   --description use when running 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param public
#   When false pass --private flag to 'globus-connect-server endpoint setup'
#   Globus v5 only
# @param incoming_port_range
#   --incoming-port-range use when running 'globus-connect-server node setup'
#   Globus v5 only
# @param outgoing_port_range
#   --outgoing-port-range use when running 'globus-connect-server node setup'
#   Globus v5 only
# @param ip_address
#   --ip-address use when running 'globus-connect-server node setup'
#   Globus v5 only
# @param export_node
#   --export-node use when running 'globus-connect-server node setup'
#   Globus v5 only
# @param import_node
#   --import-node use when running 'globus-connect-server node setup'
#   Globus v5 only
# @param globus_user
#   See globus-connect-server.conf Globus/User
#   Globus v4 only
# @param globus_password
#   See globus-connect-server.conf Globus/Password
#   Globus v4 only
# @param endpoint_name
#   See globus-connect-server.conf Endpoint/Name
#   Globus v4 only
# @param endpoint_public
#   See globus-connect-server.conf Endpoint/Public
#   Globus v4 only
# @param endpoint_default_directory
#   See globus-connect-server.conf Endpoint/DefaultDirectory
#   Globus v4 only
# @param security_fetch_credentials_from_relay
#   See globus-connect-server.conf Security/FetchCredentialFromRelay
#   Globus v4 only
# @param security_certificate_file
#   See globus-connect-server.conf Security/CertificateFile
#   Globus v4 only
# @param security_key_file
#   See globus-connect-server.conf Security/KeyFile
#   Globus v4 only
# @param security_trusted_certificate_directory
#   See globus-connect-server.conf Security/TrustedCertificateDirectory
#   Globus v4 only
# @param security_identity_method
#   See globus-connect-server.conf Security/IdentityMethod
#   Globus v4 only
# @param security_authorization_method
#   See globus-connect-server.conf Security/AuthorizationMethod
#   Globus v4 only
# @param security_gridmap
#   See globus-connect-server.conf Security/Gridmap
#   Globus v4 only
# @param security_cilogon_identity_provider
#   See globus-connect-server.conf Security/IdentityProvider
#   Globus v4 only
# @param gridftp_server
#   See globus-connect-server.conf GridFTP/Server
#   Globus v4 only
# @param gridftp_server_port
#   See globus-connect-server.conf GridFTP/ServerPort
#   Globus v4
# @param gridftp_server_behind_nat
#   See globus-connect-server.conf GridFTP/ServerBehindNat
#   Globus v4 only
# @param gridftp_incoming_port_range
#   See globus-connect-server.conf GridFTP/IncomingPortRange
#   Globus v4 only
# @param gridftp_outgoing_port_range
#   See globus-connect-server.conf GridFTP/OutgoingPortRange
#   Globus v4 only
# @param gridftp_data_interface
#   See globus-connect-server.conf GridFTP/DataInterface
#   Globus v4 only
# @param gridftp_restrict_paths
#   See globus-connect-server.conf GridFTP/RestrictPaths
#   Globus v4 only
# @param gridftp_sharing
#   See globus-connect-server.conf GridFTP/Sharing
#   Globus v4 only
# @param gridftp_sharing_restrict_paths
#   See globus-connect-server.conf GridFTP/SharingRestrictPaths
#   Globus v4 only
# @param gridftp_sharing_state_dir
#   See globus-connect-server.conf GridFTP/SharingStateDir
#   Globus v4 only
# @param gridftp_sharing_users_allow
#   See globus-connect-server.conf GridFTP/UsersAllow
#   Globus v4 only
# @param gridftp_sharing_groups_allow
#   See globus-connect-server.conf GridFTP/GroupsAllow
#   Globus v4 only
# @param gridftp_sharing_users_deny
#   See globus-connect-server.conf GridFTP/UsersDeny
#   Globus v4 only
# @param gridftp_sharing_groups_deny
#   See globus-connect-server.conf GridFTP/GroupsDeny
#   Globus v4 only
# @param myproxy_server
#   See globus-connect-server.conf MyProxy/Server
#   Globus v4 only
# @param myproxy_server_port
#   See globus-connect-server.conf MyProxy/ServerPort
#   Globus v4 only
# @param myproxy_server_behind_nat
#   See globus-connect-server.conf MyProxy/ServerBehindNAT
#   Globus v4 only
# @param myproxy_ca_directory
#   See globus-connect-server.conf MyProxy/CADirectory
#   Globus v4 only
# @param myproxy_config_file
#   See globus-connect-server.conf MyProxy/ConfigFile
#   Globus v4 only
# @param myproxy_ca_subject_dn
#   See globus-connect-server.conf MyProxy/CaSubjectDN
#   Globus v4 only
# @param myproxy_firewall_sources
#   Sources to open in firewall for MyProxy
#   Globus v4 only
# @param oauth_server
#   See globus-connect-server.conf OAuth/Server
#   Globus v4 only
# @param oauth_server_behind_firewall
#   See globus-connect-server.conf OAuth/ServerBehindFirewall
#   Globus v4 only
# @param oauth_stylesheet
#   See globus-connect-server.conf OAuth/Stylesheet
#   Globus v4 only
# @param oauth_logo
#   See globus-connect-server.conf OAuth/Logo
#   Globus v4 only
# @param proxy
#   Set a proxy for yum repos, if needed
#   default: undef
#
class globus (
  Variant[Enum['4','5'],Integer[4,5]] $version = '5',

  Boolean $include_io_server = true,
  Boolean $include_id_server = true,
  Boolean $include_oauth_server = false,
  Variant[Stdlib::Httpsurl, Stdlib::Httpurl] $release_url = 'https://downloads.globus.org/toolkit/globus-connect-server/globus-connect-server-repo-latest.noarch.rpm',
  Variant[Stdlib::Httpsurl, Stdlib::Httpurl] $toolkit_repo_baseurl = "https://downloads.globus.org/toolkit/gt6/stable/rpm/el/${facts['os']['release']['major']}/\$basearch/",
  Variant[Stdlib::Httpsurl, Stdlib::Httpurl] $toolkit_repo_testing_baseurl = "https://downloads.globus.org/toolkit/gt6/testing/rpm/el/${facts['os']['release']['major']}/\$basearch/",
  Variant[Stdlib::Httpsurl, Stdlib::Httpurl] $gcs_repo_baseurl = "https://downloads.globus.org/globus-connect-server/stable/rpm/el/${facts['os']['release']['major']}/\$basearch/",
  Variant[Stdlib::Httpsurl, Stdlib::Httpurl] $gcs_repo_testing_baseurl = "https://downloads.globus.org/globus-connect-server/testing/rpm/el/${facts['os']['release']['major']}/\$basearch/",
  Boolean $enable_testing_repos = false,
  Array $extra_gridftp_settings = [],
  Optional[String] $first_gridftp_callback = undef,
  Boolean $manage_service = true,
  Boolean $run_setup_commands = true,
  Boolean $manage_firewall = true,
  Boolean $manage_epel = true,
  Array $repo_dependencies = ['yum-plugin-priorities'],
  String $proxy = undef,

  Boolean $manage_user = true,
  Optional[Integer] $group_gid = undef,
  Optional[Integer] $user_uid = undef,
  String $package_name = 'globus-connect-server54',

  # Required - v5
  Optional[String] $display_name = undef,
  Optional[String] $client_id = undef,
  Optional[String] $client_secret = undef,
  Optional[String] $owner = undef,
  Optional[String] $organization = undef,
  Stdlib::Absolutepath $deployment_key = '/var/lib/globus-connect-server/gcs-manager/deployment-key.json',
  # endpoint setup - v5
  Optional[Array] $keywords = undef,
  Optional[String] $department = undef,
  Optional[String] $contact_email = undef,
  Optional[String] $contact_info = undef,
  Optional[String] $info_link = undef,
  Optional[String] $description = undef,
  Boolean $public = true,
  # node setup - v5
  Array[Stdlib::Port, 2, 2] $incoming_port_range = [50000, 51000],
  Optional[Array[Stdlib::Port, 2, 2]] $outgoing_port_range = undef,
  Optional[Stdlib::IP::Address] $ip_address = undef,
  Optional[Stdlib::Absolutepath] $export_node = undef,
  Optional[Stdlib::Absolutepath] $import_node = undef,

  # Globus Config - v4
  String $globus_user = '%(GLOBUS_USER)s',
  String $globus_password = '%(GLOBUS_PASSWORD)s',

  # Endpoint Config - v4
  Boolean $endpoint_public = false,
  String $endpoint_default_directory = '/~/',
  String $endpoint_name = $facts['networking']['hostname'],

  # Security Config - v4
  Boolean $security_fetch_credentials_from_relay = true,
  Stdlib::Absolutepath $security_certificate_file = '/var/lib/globus-connect-server/grid-security/hostcert.pem',
  Stdlib::Absolutepath $security_key_file = '/var/lib/globus-connect-server/grid-security/hostkey.pem',
  Stdlib::Absolutepath $security_trusted_certificate_directory = '/var/lib/globus-connect-server/grid-security/certificates/',
  Enum['MyProxy', 'OAuth', 'CILogon'] $security_identity_method = 'MyProxy',
  Optional[Enum['MyProxyGridmapCallout','CILogon','Gridmap']] $security_authorization_method = undef,
  Optional[Stdlib::Absolutepath] $security_gridmap = undef,
  Optional[String] $security_cilogon_identity_provider = undef,

  # GridFTP Config - v4
  Stdlib::Port $gridftp_server_port = 2811,
  Array[Stdlib::Port, 2, 2] $gridftp_incoming_port_range = [50000, 51000],
  Optional[Array[Stdlib::Port, 2, 2]] $gridftp_outgoing_port_range = undef,
  Optional[String] $gridftp_data_interface = undef,

  # GridFTP Config - v4
  Optional[String] $gridftp_server = undef,
  Boolean $gridftp_server_behind_nat = false,
  Array $gridftp_restrict_paths = ['RW~', 'N~/.*'],
  Boolean $gridftp_sharing = false,
  Optional[Array] $gridftp_sharing_restrict_paths = undef,
  String $gridftp_sharing_state_dir = '$HOME/.globus/sharing',
  Optional[Array] $gridftp_sharing_users_allow = undef,
  Optional[Array] $gridftp_sharing_groups_allow = undef,
  Optional[Array] $gridftp_sharing_users_deny = undef,
  Optional[Array] $gridftp_sharing_groups_deny = undef,

  # MyProxy Config - v4
  Optional[String] $myproxy_server = undef,
  Stdlib::Port $myproxy_server_port = 7512,
  Boolean $myproxy_server_behind_nat = false,
  Stdlib::Absolutepath $myproxy_ca_directory = '/var/lib/globus-connect-server/myproxy-ca',
  Stdlib::Absolutepath $myproxy_config_file = '/var/lib/globus-connect-server/myproxy-server.conf',
  Optional[String] $myproxy_ca_subject_dn = undef,
  Array $myproxy_firewall_sources = ['174.129.226.69', '54.237.254.192/29'],

  # OAuth Config - v4
  Optional[String] $oauth_server = undef,
  Boolean $oauth_server_behind_firewall = false,
  Optional[String] $oauth_stylesheet = undef,
  Optional[String] $oauth_logo = undef,
) {
  $osfamily = $facts.dig('os', 'family')
  $osmajor = $facts.dig('os', 'release', 'major')
  $os = "${osfamily}-${osmajor}"

  if String($version) == '4' and $os == 'RedHat-8' {
    fail("${module_name}: Version 4 is not support on OS ${os}")
  }

  if String($version) == '5' {
    if ! $display_name {
      fail("${module_name}: display_name is required with version 5")
    }
    if ! $client_id {
      fail("${module_name}: client_id is required with version 5")
    }
    if ! $client_secret {
      fail("${module_name}: client_secret is required with version 5")
    }
    if ! $owner {
      fail("${module_name}: owner is required with version 5")
    }
    if ! $organization {
      fail("${module_name}: organization is required with version 5")
    }
  }

  if $include_io_server {
    $_gridftp_server    = pick($gridftp_server, "${facts['networking']['fqdn']}:${gridftp_server_port}")
    $_io_setup_command  = 'globus-connect-server-io-setup'
  } else {
    $_gridftp_server    = $gridftp_server
    $_io_setup_command  = undef
  }

  if $include_id_server {
    $_myproxy_server    = pick($myproxy_server, "${facts['networking']['fqdn']}:${myproxy_server_port}")
    $_id_setup_command  = 'globus-connect-server-id-setup'
  } else {
    $_myproxy_server    = $myproxy_server
    $_id_setup_command  = undef
  }

  if $include_oauth_server {
    $_oauth_server        = pick($oauth_server, $facts['networking']['fqdn'])
    $_oauth_setup_command = 'globus-connect-server-web-setup'
  } else {
    $_oauth_server        = $oauth_server
    $_oauth_setup_command = undef
  }

  # For v5
  if ! $ip_address {
    $_ip_address = $facts.dig('networking','ip')
  } else {
    $_ip_address = $ip_address
  }

  # For v4
  $_setup_commands  = delete_undef_values([$_io_setup_command, $_id_setup_command, $_oauth_setup_command])
  $_setup_command   = join($_setup_commands, ' && ')

  if $manage_service {
    $notify_service = Service['globus-gridftp-server']
  } else {
    $notify_service = undef
  }

  contain globus::user
  contain globus::install
  contain globus::config
  contain globus::service

  Class['globus::user']
  -> Class['globus::install']
  -> Class['globus::config']
  -> Class['globus::service']

  case $osfamily {
    'RedHat': {
      if $manage_epel {
        include epel
        Class['epel'] -> Class['globus::repo::el']
      }
      contain globus::repo::el

      Class['globus::repo::el'] -> Class['globus::install']
    }
    'Debian': {
      contain globus::repo::deb

      Class['globus::repo::deb'] -> Class['globus::install']
    }
    default: {
      # Do nothing
    }
  }
}
