# _Description_
#
# This class configures /etc/host.conf.
# See host.conf(5) for descriptions of the variables.
#
# _Templates_
#
# * host.conf.erb
#
class common::host_conf (
  $trim = [],
  $multi = true,
  $spoof = 'warn',
  $reorder = true
) {

  file { '/etc/host.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('common/etc/host.conf.erb')
  }

  validate_array($trim)
  validate_re_array($trim,'^\.')
  validate_bool($multi)
  validate_array_member($spoof,['off','nowarn','warn'])
  validate_bool($reorder)
}
