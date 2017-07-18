-- ----------------------------------------------------
-- Chrono Race (CHRace) - v 7.0 - 13/07/2017
-- Aurel Firmware - Nore Fpv - Dom Wilk
-- ----------------------------------------------------
local tPage={}

local SETUP_RACE
local SETUP_SOUNDS
local SETUP_INTERS
local v_SetupScreen

local t_switches

local v_edit
local v_titre
local v_focused_field



-- ----------------------------------------------------------------------------------------------------------
tPage.scan_switches = function(aStop)

	local key, val, i

	for key, val in pairs(t_switches) do
		local i = getValue(key)
		if val~=i then 
			t_switches[key] = i 
			if aStop then return key end
		end
	end
	return nil
end

-- ----------------------------------------------------------------------------------------------------------
tPage.fields_draw = function(aFieldsCoord)

	lcd.drawFilledRectangle(1, 10, LCD_W, 63,ERASE)

	local key, tab
			
	for key, tab in pairs(aFieldsCoord) do
		
		local v_attr_text = SMLSIZE
		local v_attr_data = SMLSIZE
		
		if tab.field == aFieldsCoord[v_focused_field].field then

			-- en édition ?
			if v_edit then
				v_attr_data = v_attr_data -- BLINK
				v_attr_text = v_attr_text + INVERS
				lcd.drawFilledRectangle(tab.lx, tab.ly-2, tab.dx-tab.lx-2, 11,SOLID)
			else
				v_attr_data = v_attr_data + INVERS
			end

			-- dessin de l'aide
			lcd.drawFilledRectangle(1, 53, LCD_W, 63,SOLID)
			lcd.drawText(1, 54,  tab.hint, SMLSIZE + INVERS)
		end

		-- Mise en forme ou Exceptions
		local v_text = tab.text
		local v_data = string.sub(tab.type,1,1) == "n" and tonumber(t_Params[tab.field]) or t_Params[tab.field]
		
		if 		tab.field =="delay" 		 			then v_data = string.format("%isec",v_data)
		elseif 	tab.type  =="nbit"  					then v_data = (v_data == 1 and "yes"    	or  "no")
		elseif 	tab.field =="start_mode" 				then v_data = (v_data == 0 and "standing" 	or "flying")
		elseif 	tab.field =="start_top" 				then v_data = (v_data == 0 and "Only"   	or  (v_data == 1 and "with several" or "Starter" ))
		elseif 	tab.field =="seuil" and v_data == 100	then v_data = "Off" 
		elseif 	tab.field =="sw_Lap_ls_num" 			then v_data = string.format((i_IsX9D and "LS%i" or "LO%i"),v_data+1)
		elseif 	tab.type  =="sw_name"  					then v_data = string.upper(v_data)
		end		

		lcd.drawText(tab.lx, tab.ly, v_text, 	v_attr_text)
		lcd.drawText(tab.dx, tab.ly, v_data,	v_attr_data)

	end

	return 0
end

-- ----------------------------------------------------------------------------------------------------------
tPage.field_draw_wait = function(aL1,aL2)

	local xh = (LCD_W/2)-50
	local yh = 15
	local xb = 87
	local yb = 30
	
	lcd.drawFilledRectangle  (xh, yh, xb+1, yb+1,ERASE)
	lcd.drawRectangle        (xh, yh, xb, yb, GREY_DEFAULT)
	
	lcd.drawText(xh +  5, 21, aL1, SMLSIZE+BLINK)
	lcd.drawText(xh + 18, 30, aL2, SMLSIZE+BLINK)

	return 0
end

-- ----------------------------------------------------------------------------------------------------------
tPage.loadFields = function(aPageIdx)

	v_focused_field  = 0
	clearTable(t_fields) -- fait gagner entre 4 & 5 ko !!		
	-- type : n+  valeur entière positive, reste en butée sur stop et 0
	--			° quand arrive au "stop" repart de 0 et inversement (boucle)
	--		  nbits = oui/non

	if aPageIdx == SETUP_RACE
	then  
		t_fields = {
			[1]={field ="nb_tours",			lx= 2, ly=12, text="Nb lap", 	dx= 50,	type="n+°",		stop=20,	hint = "..."},
			[2]={field ="delay",			lx=70, ly=12, text="Time", 	dx= 95, type="n+°",		stop=60,	hint = "deadline between 2 validations"},
			[3]={field ="seuil",			lx= 2, ly=22, text="RSSI threshold",dx= 50, type="n+",		stop=100,	hint = "threshold validation"},
			[4]={field ="start_throttle", 	lx= 2, ly=32, text="THR threshold", dx= 50, type="sw_pos",	stop="thr",	hint = "takeoff of the quad"},
			[5]={field ="start_mode",		lx= 2, ly=42, text="Start", 	dx= 40, type="n-",		stop=-1,	hint = "with takeoff/1st passage"},
		}

		return "Chronometre - CONFIG RACE"
	end

	if aPageIdx == SETUP_SOUNDS
	then  
		t_fields = {
			[1]={field ="start_top",		lx= 2, ly=12, text="Mode", 			dx= 50, type="n+°",		stop=2,		hint = "Start signal"},
			[2]={field ="snd_pilot",		lx= 2, ly=22, text="Name", 		dx= 50, type="nbit",	stop=1,		hint = "announces pilot name"},
			[3]={field ="voc_num",			lx= 2, ly=32, text="number of lap", 		dx= 50, type="nbit",	stop=1,		hint = "ann. accomplished lap"},
			[4]={field ="voc_time", 		lx=77, ly=32, text="Time", 		dx=105, type="nbit",	stop=1,		hint = "times announce"},
			[5]={field ="snd_best", 		lx= 2, ly=42, text="Best", 			dx= 50, type="nbit",	stop=1,		hint = "ann. best lap"},
			--
			--[3]={field ="snd_start",		lx= 2, ly=22, text="Top Départ",	dx= 50, dy=22, type="bit",		stop=1,		hint = "séquence départ"},
			--[5]={field ="snd_start",		lx= 2, ly=42, text="Depart", 		dx= 40, dy=42, type="bit",		stop=1,		hint = "son départ (solo)"},
			--[6]={field ="snd_fin",			lx=77, ly=42, text="Arrivée", 		dx= 98, dy=42, type="bit",		stop=1,		hint = "son arrivée"}
		}

		return "Chronometer - SOUND CONFIG"
	end

	if aPageIdx == SETUP_INTERS
	then  
		t_fields = { 
			[1] = {field ="sw_Arm", 		lx= 2, ly=12, text="Armed",	dx= 55, type="sw_name", stop=0, 			hint = "Armed switch"},
			[2] = {field ="sw_Arm_Off",		lx=80, ly=12, text="Off", 		dx=100, type="sw_pos",  stop="fieldprec", 	hint = "Disarmed position"},
			[3] = {field ="sw_Lap" ,		lx= 2, ly=22, text="Validate lap",dx= 55, type="sw_name", stop=0, 			hint = "Manual validate"},
			[4] = {field ="sw_Lap_ls_num", 	lx=80, ly=22, text="RSSI",  	dx=105, type="n+°", 	stop=10, 			hint = "RSSI logical switch"},
			[5] = {field ="sw_Reset",		lx= 2, ly=32, text="Reset", 	dx= 55, type="sw_name", stop=0, 			hint = "RAZ switch"},
			[6] = {field ="sw_Reset_On",	lx=80, ly=32, text="On", 	 	dx=105, type="sw_pos", 	stop="fieldprec", 	hint = "RAZ position"},
			[7] = {field ="sw_Test",		lx= 2, ly=42, text="Test", 		dx= 55, type="sw_name", stop=0, 			hint = "RSSI threshold switch"},
			[8] = {field ="sw_Test_On",		lx=80, ly=42, text="On", 		dx=105, type="sw_pos",  stop="fieldprec", 	hint = "TEST position"}
		}

		return "Chronometer - SWITCH CONFIG"
	end
end
-- ----------------------------------------------------------------------------------------------------------
tPage.init = function()

	SETUP_SOUNDS	= 1
	SETUP_RACE		= 2
	SETUP_INTERS	= 3

	t_switches = {
				["sa"] = 0,
				["sb"] = 0,
				["sc"] = 0,
				["sd"] = 0,
				["se"] = 0,
				["sf"] = 0,
				["sg"] = 0,
				["sh"] = 0
			}	

	p_Tools.Params_Load()
	v_titre = tPage.loadFields(SETUP_SOUNDS)
	
	v_SetupScreen 	= 1
	v_edit 			= false

	return 0

end

-- ----------------------------------------------------------------------------------------------------------
tPage.Stop = function()
	clearTable(t_fields)
	clearTable(t_switches)
	clearTable(t_Params)
end

-- ----------------------------------------------------------------------------------------------------------
tPage.run = function (aEvent)

	-- Exit > Sauvegarde et Retour à l'écran "Race"
	if aEvent == EVT_EXIT_BREAK then
		if v_Edit then 
			aEvent =EVT_MENU_BREAK
		else
			p_Tools.config_write(t_Params)
			tPage.Stop()
			return -1
		end
	end

	local v_drawFields = false
	
	-- Menu => Page config suivante 
	if aEvent == EVT_MENU_BREAK then
		v_SetupScreen =  v_SetupScreen +1 > SETUP_INTERS and 1 or v_SetupScreen + 1
		v_titre = tPage.loadFields(v_SetupScreen)
		v_focused_field = 0
	end

	-- Dessin nouvelle page
	if v_focused_field == 0 then
		lcd.drawFilledRectangle(0, 0, LCD_W, 63,ERASE)
		lcd.drawFilledRectangle(0, 0, LCD_W, 9,SOLID)
		lcd.drawText(1,1,v_titre,SMLSIZE+INVERS)
		v_focused_field = 1
		v_drawFields = true
	end

	-- Enter > Edition / Validation
	if aEvent == EVT_ENTER_BREAK then
		
		v_edit = not v_edit
		
		-- Edition Inter
		if v_edit and t_fields[v_focused_field].type == "sw_name" then
			tPage.scan_switches(false)

		-- Edition Position Inter
		elseif t_fields[v_focused_field].type == "sw_pos" then

			if not v_edit then
				if t_fields[v_focused_field].stop == "fieldprec"
					then i = getValue(t_Params[t_fields[v_focused_field-1].field])
					else i = getValue(t_fields[v_focused_field].stop)
				end
				t_Params[t_fields[v_focused_field].field] = i
				i = nil
			end
		end
		v_drawFields = true
	end

	if v_edit then
		
		if t_fields[v_focused_field].type == "sw_name" then

			-- un inter a bougé ?
			sw_name = tPage.scan_switches(true)
			if sw_name ~= nil then
				t_Params[t_fields[v_focused_field].field] = sw_name
				v_edit = false
			else
				tPage.field_draw_wait("touch the switch","to be affected")
				return 0 -- on ne redessine pas les champs
			end
		
		elseif t_fields[v_focused_field].type == "sw_pos" then
			tPage.field_draw_wait("switch in position position","then [ENT]") 
			return 0 -- on ne redessine pas les champs
		end

		v_drawFields = true -- on dessine les champs (clignotant en édition)
	end

	-- Bouton "+" et "-"
	local v_Move = p_Tools.Button_GetMove(aEvent)

	if v_Move ~= 0 then

		local i, key, tab

		-- Champ suivant ou précédent
		if not v_edit then

			v_focused_field = v_focused_field + v_Move
			
			if  v_focused_field == 0 then 
				for key, tab in pairs(t_fields) do 
					v_focused_field = v_focused_field +1 
				end 
			end
			
			if t_fields[v_focused_field] == nil then v_focused_field = 1 end

		-- incrément valeur éditée
		else

			local i = tonumber(t_Params[t_fields[v_focused_field].field]) + v_Move

			if t_fields[v_focused_field].type == "nbit" 												then i= i==2 and 0 or (i==-1 and 1 or i)	    end
			
			if t_fields[v_focused_field].type == "n+"  and i<0 											then i=0 										end
			if t_fields[v_focused_field].type == "n+"  and i>t_fields[v_focused_field].stop 			then i=t_fields[v_focused_field].stop			end

			if t_fields[v_focused_field].type == "n+°" and i<0 											then i=t_fields[v_focused_field].stop 			end
			if t_fields[v_focused_field].type == "n+°" and i>t_fields[v_focused_field].stop 			then i=0										end
			
			if t_fields[v_focused_field].type == "n-"  and i>0											then i=t_fields[v_focused_field].stop			end
			if t_fields[v_focused_field].type == "n-"  and i<t_fields[v_focused_field].stop 			then i=0										end
			
			if t_fields[v_focused_field].type == "num" and math.abs(i)>t_fields[v_focused_field].stop 	then i=(i*-1)									end

			t_Params[t_fields[v_focused_field].field] = i
		end

		v_drawFields = true -- on dessine les champs (changement de focus)

	end

	if v_drawFields then tPage.fields_draw(t_fields) end

	return 0
end



return tPage