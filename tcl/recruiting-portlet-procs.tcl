#
#  Copyright (C) 2001, 2002 OpenForce
#
#  This file is part of this.
#
#  this is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  this is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

ad_library {

    Procedures to supports recruiting portlets

    @creation-date September 30 2001
    @author arjun@openforce.net
    @version $Id$

}

namespace eval recruiting_portlet {

    ad_proc -private get_my_name {
    } {
	return "recruiting_portlet"
    }

    ad_proc -public get_pretty_name {
    } {
	return "Candidate Recruiting"
    }

    ad_proc -private my_package_key {
    } {
        return "recruiting-portlet"
    }

    ad_proc -public link {
    } {
	return ""
    }

    ad_proc -public add_self_to_page {
	{-portal_id:required}
	{-package_id:required}
	{-display_group_name_p:required}
	{-param_action:required}
    } {
	Adds a recruiting PE to the given portal or appends the given recruiting package_id
        to the recruiting PE that already on the portal
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -pretty_name [get_pretty_name] \
            -value $package_id \
            -force_region [parameter::get_from_package_key \
                               -package_key [my_package_key] \
                               -parameter "recruiting_portlet_region"] \
            -extra_params [list "display_group_name_p" $display_group_name_p] \
            -param_action $param_action
        ]
    }


    ad_proc -public remove_self_from_page {
	portal_id
	package_id
    } {
	Removes a recruiting PE from the given page or just the given recruiting's package_id
    } {
        portal::remove_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -value $package_id
    }

    ad_proc -public show {
	cf
    } {
    } {
        # no return call required with the helper proc
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "recruiting-portlet"
    }

}
