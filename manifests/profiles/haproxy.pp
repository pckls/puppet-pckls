class pckls::profiles::haproxy {

    include haproxy

    haproxy::listen { 'puppet_8140':
      collect_exported => false,
      ipaddress        => $::ipaddress_enp0s8,
      ports            => '8140',
    }

    haproxy::balancermember { 'puppetcompile1':
      listening_service => 'puppet_8140',
      server_names      => 'puppetcompile1.vagrant.pckls.io',
      ipaddresses       => '10.20.1.7',
      ports             => '8140',
      options           => 'check',
    }

    haproxy::balancermember { 'puppetcompile1':
      listening_service => 'puppet_8140',
      server_names      => 'puppetcompile2.vagrant.pckls.io',
      ipaddresses       => '10.20.1.8',
      ports             => '8140',
      options           => 'check',
    }

}
