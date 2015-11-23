class pckls::profiles::firewall::pre {

    Firewall {
        require => undef,
    }

    # Baseline IPv4 Rules
    firewall { '000 ACCEPT ALL icmp v4':
        proto  => 'icmp',
        action => accept,
    }
    ->
    firewall { '001 ACCEPT ALL lo v4':
        proto   => 'all',
        iniface => 'lo',
        action  => accept,
    }
    ->
    firewall { '002 ACCEPT RELATED, ESTABLISHED v4':
        proto  => 'all',
        state  => ['RELATED','ESTABLISHED'],
        action => accept,
    }

    # Baseline IPv6 Rules
    firewall { '000 ACCEPT ALL icmp v6':
        proto    => 'ipv6-icmp',
        action   => 'accept',
        provider => 'ip6tables',
    }
    ->
    firewall { '001 ACCEPT ALL lo v6':
        proto    => 'all',
        iniface  => 'lo',
        action   => accept,
        provider => 'ip6tables',
    }
    ->
    firewall { '002 ACCEPT RELATED, ESTABLISHED v6':
        proto    => 'all',
        state    => ['RELATED','ESTABLISHED'],
        action   => accept,
        provider => 'ip6tables',
    }

}
