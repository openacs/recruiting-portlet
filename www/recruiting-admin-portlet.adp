<%

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

%>

<center>

<if @status_types_defined_p@ eq 0 or @criteria_defined_p@ eq 0>
<p>
<table bgcolor=red border=0 cellpadding=1 width=90%><tr><td>
<table bgcolor=#fff0f5 border=0 width=100% cellpadding=3 cellspacing=0><tr><td>
Warning:
<ul>
</if>

<if @status_types_defined_p@ eq 0>
<li>There are no status types defined.  You must <a href=@url@admin/list-status-types.tcl>define status types</a> before you can add and adminster candidates.
</if>


<if @criteria_defined_p@ eq 0>
<li>No interview criteria has been defined.  You should
<a href=@url@admin/list-criteria>define some interview criteria</a> before you begin assigning interviews.
</if>

<if @status_types_defined_p@ eq 0 or @criteria_defined_p@ eq 0>
</ul>
</td></tr></table>
</td></tr></table>
</if>

<if @status_types_defined_p@ ne 0>

</if>

<if @criteria_defined_p@ ne 0>

</if>

<if @num_archived_candidates@ ne 0>

</if>
</ul>

<p>
<table width=90% border=0><tr><td>
<%= [ui::table::output_table summary] %>
</td></tr></table>

<p>
Go directly to <a href=@url@admin>Recruiting Candidate Administration</a>.

</center>
