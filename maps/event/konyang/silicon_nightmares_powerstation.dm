/datum/map/event/silicon_nightmares_powerstation
	name = "Kaneyama"
	full_name = "Kaneyama Power Station"
	path = "event/konyang"
	lobby_icons = list('icons/misc/titlescreens/lore/silicon_nightmares.dmi')

	allowed_jobs = list(/datum/job/visitor, /datum/job/passenger, /datum/job/captain, /datum/job/xo, /datum/job/operations_manager, /datum/job/chief_engineer, /datum/job/cmo, /datum/job/rd, /datum/job/hos, /datum/job/eventeng, /datum/job/eventmed, /datum/job/eventops, /datum/job/eventsci, /datum/job/eventsec, /datum/job/bridge_crew)

	station_levels = list(1)
	admin_levels = list(2)
	contact_levels = list(1)
	player_levels = list(1)
	accessible_z_levels = list(1)

	station_name = "Konyang"
	station_short = "Konyang"
	dock_name = "SCCV Horizon"
	boss_name = "Stellar Corporate Conglomerate"
	boss_short = "SCC"
	company_name = "Stellar Corporate Conglomerate"
	company_short = "SCC"
	station_type = "planet"
	use_overmap = FALSE
	map_shuttles = list(
		/datum/shuttle/autodock/ferry/supply/konyang,
		/datum/shuttle/autodock/multi/sn_canary
	)

//Areas

/area/kaneyama_ext
	name = "Kaneyama Exteriors"
	icon_state = "bluenew"
	base_turf = /turf/simulated/floor/exoplanet/dirt_konyang
	requires_power = FALSE
	ambience = AMBIENCE_KONYANG_RAIN
	var/lighting = TRUE

/area/kaneyama_ext/Initialize()
	. = ..()
	if(lighting)
		for(var/turf/T in src)
			T.set_light(MINIMUM_USEFUL_LIGHT_RANGE, 1, COLOR_WHITE)

/area/kaneyama_ext/water
	name = "Kaneyama Water"
	icon_state = "blue"
	ambience = AMBIENCE_KONYANG_WATER


/area/kaneyama_interiors
	name = "Kaneyama Interiors"
	icon_state = "red"
	base_turf = /turf/simulated/floor/plating
	requires_power = FALSE
	ambience = AMBIENCE_KONYANG_RAIN_MUFFLED

/area/kaneyama_plant
	name = "Kaneyama Power Plant"
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	requires_power = FALSE
	ambience = AMBIENCE_TECH_RUINS

/area/kaneyama_boss
	name = "Kaneyama Power Plant Reactor #2"
	icon_state = "bluenew"
	base_turf = /turf/simulated/floor/plating
	ambience = AMBIENCE_TECH_RUINS
	area_flags = AREA_FLAG_ECD_TRIGGER
