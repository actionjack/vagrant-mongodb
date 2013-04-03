node default {
  Yumrepo['epel'] ->
  Class['ntp'] ->
  Class['mongodb']

  yumrepo { 'epel':
    descr          => ' Extra Packages for Enterprise Linux 6 - $basearch',
    mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    failovermethod => 'priority',
    enabled        => $enabled,
    gpgcheck       => $enabled,
    gpgkey         => 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6',
  }
  include ntp
  class { 'mongodb':
    enable_10gen   => true,
    dbpath         => hiera('mongodbdbpath'),
    directoryperdb => hiera('mongodbdirectoryperdb'),
    logpath        => hiera('mongodblogpath'),
    nssize         => hiera('mongodbnssize'),
    replSet        => hiera('mongodb_replica_set'),
    smallfiles     => hiera('mongodb_smallfiles'),
    rest           => 'true',
    profile        => hiera('mongodb_profile'),
    slowms         => hiera('mongodb_slowms')
  }
}
