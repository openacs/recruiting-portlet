--
--  Copyright (C) 2001, 2002 OpenForce
--
--  This file is part of this.
--
--  this is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  this is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

--
-- packages/forums-portlets/sql/forums-portlets-drop.sql
--

-- Drops forums datasources for portal portlets

-- @author chak (chak@openforce.net) and arjun
-- @creation-date 2001-30-09

-- $Id$

-- This is free software distributed under the terms of the GNU Public
-- License version 2 or higher.  Full text of the license is available
-- from the GNU Project: http://www.fsf.org/copyleft/gpl.html


create function inline_0()
returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

--  begin 
    select datasource_id into ds_id
      from portal_datasources
     where name = ''recruiting-portlet'';
--  exception when no_data_found then
--  ds_id := null;
--  end;

  if ds_id is not null then
    portal_datasource__delete(ds_id);
  end if;

return 0;

end;' language 'plpgsql';

select inline_0();
drop function inline_0();


create function inline_1()
returns integer as '
declare
	foo integer;
begin

	-- add all the hooks
	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''recruiting_portlet'',
	       ''GetMyName''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''recruiting_portlet'',
	       ''GetPrettyName''
	);


	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''recruiting_portlet'',
	       ''Link''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''recruiting_portlet'',
	       ''AddSelfToPage''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''recruiting_portlet'',
	       ''Show''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''recruiting_portlet'',
	       ''Edit''
	);

	foo := acs_sc_impl_alias__delete (
	       ''portal_datasource'',
	       ''recruiting_portlet'',
	       ''RemoveSelfFromPage''
	);

	-- Drop the binding
	perform acs_sc_binding__delete (
	    ''portal_datasource'',
	    ''recruiting_portlet''
	);

	-- drop the impl
	foo := acs_sc_impl__delete (
		''portal_datasource'',
		''recruiting_portlet''
	);
	
	return 0;
end;' language 'plpgsql';

select inline_1();
drop function inline_1();


