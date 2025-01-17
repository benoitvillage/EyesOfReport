<?php
/*
#########################################
#
# Copyright (C) 2014 EyesOfNetwork Team
# DEV NAME : Jean-Philippe LEVY
# VERSION 4.1
# APPLICATION : eonweb for eyesofnetwork project
#
# LICENCE :
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#########################################
*/

// #######################################
// # General Information
// #######################################
$version="4.1";

// #######################################
// # Database config information
// #######################################
$database_host="localhost";
$database_port="3306";

$database_username="eyesofreport";
$database_password="SaintThomas,2014";

$database_cacti="cacti";
$database_eonweb="eorweb";
$database_ged="ged";
$database_nagios="nagiosbp";
$database_vanillabp="global_nagiosbp";

// ###################################################
// # EyesOfNetwork
// ###################################################

// # Default language format
$langformat="en";

// # Logs options
$dateformat="M j, Y g:i:s A";

// # Menu Config
// You can view tabid in eonweb database
$defaulttab=3;
$defaultpage="./module/birt_apps/index.php";

// # Max number of lines in a tablesorter
$maxlines=100;

// # Page refresh interval
$refresh_time=60;

// # Cookie domain
$cookie_domain="";

// # Cookie destroy time
$cookie_time=0;
// 4 hour : $cookie_time=4*60*60;

// Max Display value
$max_display=5;

// Display 0 or not ; Use it like a boolean with values 0/1
$display_zero=1;

// Number of back-up file to use for nagios configuration file.
$max_bu_file = 5;

// Minimun and maximun number for duplicate process.
$min_dup = 1000;
$max_dup = 9999;

// # Session management
if ($_SERVER['PHP_SELF'] != '/login.php' && $_SERVER['PHP_SELF'] != '/logout.php' && !isset($_COOKIE['user_name'])) {
	echo "<meta http-equiv=\"Refresh\" content=\"0;URL=/login.php\" />";
	echo "</head>";
	echo "<body>";
	echo "</body>";
	echo "</html>";
	exit;
}

// # Define All Path
$path_eon="/srv/eyesofnetwork";
$path_eor="/srv/eyesofreport";
$path_eonweb="$path_eon/eorweb";
$dir_imgcache="cache";
$path_languages="$path_eonweb/include/languages";
$path_reports="$path_eonweb/include/reports";
$path_rptdesign="$path_eor/report";

// # EZ
$path_ez="$path_eonweb/include/ez/";

// # Backup Manager
$path_backupconf="/etc/backup-manager.conf";

// # Nagios
$path_nagios="$path_eon/nagios";
$path_notifier="$path_eon/notifier";
$path_nagios_url="/thruk";
$path_nagios_cgi="/thruk/cgi-bin";
$path_nagios_url_others="/nagios";
$path_nagios_cgi_others="/nagios/cgi-bin";
$path_nagios_bin="$path_nagios/bin/nagios";
$path_nagios_etc="$path_nagios/etc/nagios.cfg";
$path_nagios_ser=$path_nagios."/etc/objects/services.cfg";
$path_nagiosbpcfg="/srv/eyesofnetwork/eorweb/module/manage_bp/compat/nagios-bp.conf";
$path_nagiosbpcfg_bu="/tmp/nagios-bp.conf";
$path_nagiosbpcfg_lock="/tmp/nagios_bp";
$path_nagiosdowntime="$path_nagios/plugins/Downtime/downtime_list.txt";
$path_notification="$path_notifier/etc/notifier.rules";

// # GED
$ged_prefix="";
$path_ged="$path_eon/ged";
$path_ged_bin="$path_ged/bin/gedq";
$path_gedcfg="$path_ged/etc/ged.cfg";
$path_gedhdb="$path_ged/etc/bkd/gedmysql.cfg";
$path_gedqcfg="$path_ged/etc/gedq.cfg";
$path_gedtcfg="$path_ged/etc/gedt.cfg";

// # Net-SNMP
$path_snmpwalk="/usr/bin/snmpwalk";
$path_snmpconf="/etc/snmp/snmpd.conf";
$path_snmptrapconf="/etc/snmp/snmptrapd.conf";

// # NetCAT
$default_minport=1;
$default_maxport=1024;
$path_netcat="/usr/bin/nc";

// # Languages files
if(isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])){
        $lang = explode(",",$_SERVER['HTTP_ACCEPT_LANGUAGE']);
        $lang = strtolower(substr(chop($lang[0]),0,2));
        if(file_exists("$path_languages/menus-$lang.xml"))
                $langformat=$lang;
}

$xmlmenus = new DOMDocument();
$xmlmenus->preserveWhiteSpace=false;
$xmlmenus->load("$path_languages/menus-$langformat.xml");

$xmlmodules = new DOMDocument();
$xmlmodules->preserveWhiteSpace=false;
$xmlmodules->load("$path_languages/modules-$langformat.xml");

?>
