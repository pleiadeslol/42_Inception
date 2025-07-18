<?php
define('DB_NAME', getenv('MYSQL_DATABASE'));
define('DB_USER', 'MYSQL_USER');
define('DB_PASSWORD', 'MYSQL_PASSWORD');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

define('AUTH_KEY',         'A+=&Ip1[ rxw=Wy49F/i8$1?LCl65+J!A0JJ.]+_/@-54|D!Z{B[w#/KJ=`Fgt{a');
define('SECURE_AUTH_KEY',  '!HTIP@u>UE%Qw-i|4iQ,SS-8>/rAumE$Np^orz+0L!3$|QY>E]^tmcpZ.^w.qYV@');
define('LOGGED_IN_KEY',    'X&K#B+tT.j DdjW$Ox)%|%+ZbA@8*aA1iyz<A6GEG>q>G|*;]O-H/p~>HR.x_4qH');
define('NONCE_KEY',        'aVK)=$t@I-dy:}_?9_TZD[Fw^a(4;c}eI0t@|*wtm,pA9C+.t8~tV_jy1{%#e72%');
define('AUTH_SALT',        '7=>Y}MyDv&-l;9v+XK}VUW:vExl]DW]6rSN8e2.4FSZhA>`Z mUw<kKoQ,>x4r>K');
define('SECURE_AUTH_SALT', 'm[-5<yv2h|fz_6/rV(i?QLk;@f5AvJHxFlZKGDUC>=k$CSB]Sa(,gq>eI;L7+yyD');
define('LOGGED_IN_SALT',   'K)fa=~3-@+,(-6#<r~m[Kq-8=7`R`5B2cPlPWqJIC,9$8<@)1p9Eb}>,udaU@Zek');
define('NONCE_SALT',       'yy}G}J!R=LG(VGMAK- Dm^V5n$|=eX0?j?t4hX*n_iVDLs}QJqaVw~;<r+7OIwk_');

$table_prefix = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
?>