#!/bin/bash
#########################################
#
# Copyright (C) 2016 EyesOfNetwork Team
# DEV NAME : Benoit Village
# VERSION 2.01
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

myPwd=$(/srv/eyesofreport/etl/data-integration/encr.sh -carte CARTE_PWD)
echo "cluster: $myPwd" > /srv/eyesofreport/etl/data-integration/pwd/kettle.pwd
