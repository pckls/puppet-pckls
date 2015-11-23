class pckls::profiles::mysql (
    Hash    $databases               = {},
    Hash    $dbs                     = {},
    Hash    $grants                  = {},
    Boolean $remove_default_accounts = true,
    String  $root_password           = undef,
    Hash    $users                   = {},
) {
    class { 'mysql::server':
        databases               => $databases,
        grants                  => $grants,
        override_options        => {
            'mysqld' => {
                'bind-address' => '0.0.0.0',
            }
        },
        remove_default_accounts => $remove_default_accounts,
        restart                 => true,
        root_password           => $root_password,
        users                   => $users,
    }

    create_resources('mysql::db', $dbs)

}
