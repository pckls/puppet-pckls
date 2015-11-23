class pckls::profiles::firewall {

    include stdlib

    # Base puppetlabs-firewall module setup
    class { '::firewall':
        stage => 'setup'
    }

    # Base Accept Rules
    class { 'pckls::profiles::firewall::pre':
        stage => 'setup'
    }

    # Base Drop Rules
    class { 'pckls::profiles::firewall::post':
        stage => 'deploy'
    }

    # Purge Undefined Resources
    resources { 'firewall':
        purge => true,
    }

}
