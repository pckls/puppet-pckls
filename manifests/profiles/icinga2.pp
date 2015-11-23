class pckls::profiles::icinga2 (
    String $db_host = undef,
    String $db_name = undef,
    String $db_pass = undef,
    String $db_port = undef,
    String $db_type = undef,
    String $db_user = undef,
) {

    $packages1 = [
        'software-properties-common',
    ]

    $packages2 = [
        'icinga-idoutils',
        'icinga2-ido-mysql',
    ]

    ensure_packages($packages1, {
        before => Class['icinga2']
    })

    ensure_packages($packages2, {
        require => Apt::Ppa['ppa:formorer/icinga']
    })

    class { 'icinga2':
        db_host => $db_host,
        db_name => $db_name,
        db_pass => $db_pass,
        db_port => $db_port,
        db_type => $db_type,
        db_user => $db_user,
    }

    icinga2::object::idomysqlconnection { 'mysql_connection':
        target_dir       => '/etc/icinga2/features-enabled',
        target_file_name => 'ido-mysql.conf',
        host             => $db_host,
        port             => $db_port,
        user             => $db_user,
        password         => $db_pass,
        database         => $db_name,
    }

}
