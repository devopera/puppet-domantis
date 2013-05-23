class domantis::base (

  # class arguments
  # ---------------
  # setup defaults

  $user = 'web',
  $user_password = 'admLn**',
  $group = 'www-data',

  # database connection values
  $db_type = 'mysql',
  $db_name = 'domantis',
  $db_user = 'domantis',
  $db_pass = 'admLn**',
  $db_host = 'localhost',
  $db_port = '3306',
  $db_grants = ['all'],

  # install directory
  $target_dir = '/var/www/html',

  # end of class arguments
  # ----------------------
  # begin class

) {

  # name of first directory in downloaded zip
  $target_name = 'mantisbt'
  $starts_with = $target_name

  # create <target_dir>/<target_name> folder from downloaded tar (then clean up tar) and remove version number
  exec { 'install-mantis-source' :
    path    => '/usr/bin:/bin:',
    command => "bash -c \"wget http://sourceforge.net/projects/mantisbt/files/latest/download -O ${target_dir}/mantis-latest.tar.gz && cd ${target_dir} && tar xzf ${target_dir}/mantis-latest.tar.gz > /dev/null 2>&1 && rm ${target_dir}/mantis-latest.tar.gz && mv ${starts_with}* ${target_name}\"",
    user => $user,
    group => $group,
    onlyif  => "test ! -d ${target_dir}/${target_name}",
  }


}
