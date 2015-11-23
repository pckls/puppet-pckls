class pckls::profiles::firewall {

    Firewall {
      before  => Class['pckls::profiles::firewall::post'],
      require => Class['pckls::profiles::firewall::pre'],
    }

    include ::firewall
    include pckls::profiles::firewall::pre
    include pckls::profiles::firewall::post

}
