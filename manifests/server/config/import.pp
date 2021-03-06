# == Class: nagios::server::config::import
#
# Configures nagios
#
# === Variables
#
#
# === Authors
#
# Andrew J Grimberg <agrimberg@linuxfoundation.org>
#
# === Copyright
#
# Copyright 2015 Andrew J Grimberg
#
class nagios::server::config::import (
  $nagiostag,
) {
  validate_string($nagiostag)

  # resource collection, collect all the nagios types
  Nagios_command <<| tag == $nagiostag |>> { }
  Nagios_contactgroup <<| tag == $nagiostag |>> { }
  Nagios_contact <<| tag == $nagiostag |>> { }
  Nagios_hostdependency <<| tag == $nagiostag |>> { }
  Nagios_hostescalation <<| tag == $nagiostag |>> { }
  Nagios_hostextinfo <<| tag == $nagiostag |>> { }
  Nagios_hostgroup <<| tag == $nagiostag |>> { }
  Nagios_host <<| tag == $nagiostag |>> { }
  Nagios_servicedependency <<| tag == $nagiostag |>> { }
  Nagios_serviceescalation <<| tag == $nagiostag |>> { }
  Nagios_serviceextinfo <<| tag == $nagiostag |>> { }
  Nagios_servicegroup <<| tag == $nagiostag |>> { }
  Nagios_service <<| tag == $nagiostag |>> { }
  Nagios_timeperiod <<| tag == $nagiostag |>> { }

  # specific File resources are exported for each of the nagios_*
  # resources to get around issues with how file targets don't make the
  # files managed from the point of view of purge.
  File <<| tag == $nagiostag |>> { }
}
