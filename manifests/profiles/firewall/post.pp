class pckls::profiles::firewall::post {

    firewall { '998 log all-all-v4':
        before => undef,
        burst  => '3',
        jump   => 'LOG',
        limit  => '2/min',
        proto  => 'all',
    }

    firewall { '999 drop all-all-v4':
        before => undef,
        action => drop,
        chain  => 'INPUT',
        proto  => 'all',
    }

    firewall { '998 log all-all-v6':
        before   => undef,
        burst    => '3',
        jump     => 'LOG',
        limit    => '2/min',
        proto    => 'all',
        provider => 'ip6tables',
    }

    firewall { '999 drop all-all-v6':
        before   => undef,
        action   => drop,
        chain    => 'INPUT',
        proto    => 'all',
        provider => 'ip6tables',
    }

}
