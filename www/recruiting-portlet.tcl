#
#  Copyright (C) 2001, 2002 MIT
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

array set config $cf	

set list_of_package_ids $config(package_id)

if {[llength $list_of_package_ids] > 1} {
    # We have a problem!
    return -code error "There should be only one instance of forums for admin purposes"
}

set user_id [ad_conn user_id]
set package_id [lindex $list_of_package_ids 0]

set url [lindex [site_node::get_url_from_object_id -object_id $package_id] 0]

set package_id [ad_conn package_id]
set default_name [db_string select_package_name {
    select instance_name from apm_packages where package_id= :package_id
}]

set encoded_default_name [ns_urlencode $default_name]

set new_interviews [db_string num_new_interviews {}]
set old_interviews [db_string num_old_interviews {}]

ad_return_template
