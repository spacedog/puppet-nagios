# == Class: nagios::server::install
#
# Installs the nagios server and plugins
#
# === Variables
#
# [*plugins*]
#   The list of all plugin packages that should be installed on this
#   server. This defaults to nagios-plugins-all which is an EPEL meta
#   package pulling in all nagios plugins.
#
#   NOTE: The nagios::client also has a plugins definition which
#   defaults to empty. If the nagios and nagios::client classes are both
#   defined on a system (which would be expected) then the packages
#   between both the server and client classes need to safely resolve.
#   As such it is recommended to force override the
#   nagios::client::plugins to be an empty array on the nagios server
#
#   Type: array
#
# === Authors
#
# Andrew J Grimberg <agrimberg@linuxfoundation.org>
#
# === Copyright
#
# Copyright 2015 Andrew J Grimberg
#
class nagios::server::install (
  $plugins,
) {
  validate_array($plugins)

  # We need some variables out of nagios::params
  include nagios::params

  # Install nagios
  package { $nagios::params::basename:
    ensure => present,
  }

  # Install selected plugins
  package { $plugins:
    ensure => present,
  }
}
