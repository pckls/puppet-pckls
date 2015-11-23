class pckls::roles::puppetmaster {

    include pckls::profiles::puppet
    include puppetdb::master::config
    include r10k

}
