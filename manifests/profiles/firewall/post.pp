class pckls::profiles::firewall::post {

    firewall { '998 LOG ALL v4':
        before => undef,
        burst  => '3',
        jump   => 'LOG',
        limit  => '2/min',
        proto  => 'all',
    }

    firewall { '999 DROP ALL v4':
        before => undef,
        action => drop,
        chain  => 'INPUT',
        proto  => 'all',
    }

    firewall { '998 LOG ALL v6':
        before   => undef,
        burst    => '3',
        jump     => 'LOG',
        limit    => '2/min',
        proto    => 'all',
        provider => 'ip6tables',
    }

    firewall { '999 DROP ALL v6':
        before   => undef,
        action   => drop,
        chain    => 'INPUT',
        proto    => 'all',
        provider => 'ip6tables',
    }

}
