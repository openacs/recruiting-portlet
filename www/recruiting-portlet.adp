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

<if @new_interviews@ ne 0>
  <li>You have <a href=@url@my-new-interviews>@new_interviews@
  candidate interviews</a> to complete.
</if>
<if @old_interviews@ ne 0>
  <li>You may <a href=@url@my-completed-interviews>view your old
  candidate interviews</a>.
</if>
<if @new_interviews@ eq 0 and @old_interviews@ eq 0>
  You have no candidate interviews to complete.
</if>
