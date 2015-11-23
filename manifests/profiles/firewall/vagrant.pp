class pckls::profiles::firewall::vagrant {

    firewall { '003 VAGRANT ALLOW ALL':
        proto  => 'all',
        action => 'accept',
    }

}
