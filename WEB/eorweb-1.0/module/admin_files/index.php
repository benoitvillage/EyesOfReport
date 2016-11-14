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
?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<?php 
		include("../../include/include_module.php"); 
		if(isset($_GET["file"])){
        		$file=$_GET["file"];
		        if(!isset(${"path_".$file}))
                		die("");
		}
		else
        		die("");
	?>
</head>

<body id="main">
	<h1><?php echo $xmlmodules->getElementsByTagName("admin_$file")->item(0)->getAttribute("title")?></h1>
	
	<?php
		// Test if file is writable
		filemodify(${"path_".$file},$file);
	?>
</body>

</html>
