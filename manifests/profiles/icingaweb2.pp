class pckls::profiles::icingaweb2 (
    String  $ido_db_host         = undef,
    String  $ido_db_name         = undef,
    String  $ido_db_pass         = undef,
    String  $ido_db_port         = undef,
    String  $ido_db_user         = undef,
    String  $install_method      = undef,
    Boolean $manage_apache_vhost = false,
    Boolean $manage_repo         = false,
    String  $web_db_host         = undef,
    String  $web_db_name         = undef,
    String  $web_db_pass         = undef,
    String  $web_db_port         = undef,
    String  $web_db_user         = undef,
) {

    $packages = [
        'git',
    ]

    ensure_packages($packages, {
        before => Class['icingaweb2']
    })

    class { 'icingaweb2':
        ido_db_host         => $ido_db_host,
        ido_db_name         => $ido_db_name,
        ido_db_pass         => $ido_db_pass,
        ido_db_port         => $ido_db_port,
        ido_db_user         => $ido_db_user,
        install_method      => $install_method,
        manage_apache_vhost => $manage_apache_vhost,
        manage_repo         => $manage_repo,
        web_db_host         => $web_db_host,
        web_db_name         => $web_db_name,
        web_db_pass         => $web_db_pass,
        web_db_port         => $web_db_port,
        web_db_user         => $web_db_user,
    }

}
