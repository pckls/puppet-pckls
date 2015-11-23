class pckls::profiles::puppet (
    Hash    $config        = {},
    Boolean $open_tcp443   = false,
    Boolean $open_tcp8081  = false,
    Boolean $open_tcp8140  = false,
    Boolean $open_tcp61613 = false,
) {

    $defaults = {
        'path' => '/etc/puppetlabs/puppet/puppet.conf'
    }

    create_ini_settings($config, $defaults)

    if $open_tcp443 {
        firewall { '010 HTTPS':
            port   => '443',
            proto  => 'tcp',
            action => 'accept',
        }
    }

    if $open_tcp8081 {
        firewall { '010 PUPPETDB':
            port   => '8081',
            proto  => 'tcp',
            action => 'accept',
        }
    }

    if $open_tcp8140 {
        firewall { '010 PUPPET AGENT':
            port   => '8140',
            proto  => 'tcp',
            action => 'accept',
        }
    }

    if $open_tcp61613 {
        firewall { '010 MCOLLECTIVE':
            port   => '61613',
            proto  => 'tcp',
            action => 'accept',
        }
    }

}
