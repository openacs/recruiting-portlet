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

ad_page_contract {
    The display logic for the forums admin portlet
    
    @author Ben Adida (ben@openforce)
    @cvs_id $Id$
} -properties {
    
}

array set config $cf	

set list_of_package_ids $config(package_id)

if {[llength $list_of_package_ids] > 1} {
    # We have a problem!
    return -code error "There should be only one instance of forums for admin purposes"
}

set package_id [lindex $list_of_package_ids 0]

set url [lindex [site_node::get_url_from_object_id -object_id $package_id] 0]

set package_id [ad_conn package_id]
set default_name [db_string select_package_name {
    select instance_name from apm_packages where package_id= :package_id
}]

set encoded_default_name [ns_urlencode $default_name]

db_1row status_types_defined_p {}
db_1row criteria_defined_p {}

db_1row get_num_candidates {}
db_1row get_pending_interviews {}
db_1row get_num_archived_candidates {}

if {$status_types_defined_p != 0} {
    set candidate_admin_link "(<a href=${url}list-candidates>candidate administration</a>)"
} else {
    set candidate_admin_link ""
}

if {$pending_interviews != 0} {
    set view_interviews_link "(<a href=\"${url}list-interviews\">view interviews</a>)"
} else {
    set view_interviews_link ""
}

ui::table::add_unsorted_row summary [list "Candidates: $num_candidates" "$candidate_admin_link"]
ui::table::add_unsorted_row summary [list "Pending Interviews: $pending_interviews" "$view_interviews_link"]

if {$num_archived_candidates != 0} {
    ui::table::add_unsorted_row summary [list "$num_archived_candidates candidates have been archived" "(<a href=\"${url}list-archived-candidates\">view archived candidates</a>)"] 
}

ad_return_template
