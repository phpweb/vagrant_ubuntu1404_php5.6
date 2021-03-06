class puphpet::apache::repo {

  if $::operatingsystem == 'debian' {
    class{ 'puphpet::apache::repo::debian': }
  }

  if $::operatingsystem == 'ubuntu' and $::lsbdistcodename == 'precise' {
    if ! defined(Apt::Key['14AA40EC0831756756D7F66C4F4EA0AAE5267A6C']){
      ::apt::key { '14AA40EC0831756756D7F66C4F4EA0AAE5267A6C':
        key_server => 'hkp://keyserver.ubuntu.com:80'
      }
    }

    if ! defined(Apt::Ppa['ppa:ondrej/apache2']){
      ::apt::ppa { 'ppa:ondrej/apache2':
        require => Apt::Key['14AA40EC0831756756D7F66C4F4EA0AAE5267A6C']
      }
    }
  }

  if $::osfamily == 'redhat' {
    class{ 'puphpet::apache::repo::centos': }
  }

}
