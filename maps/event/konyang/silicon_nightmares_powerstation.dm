/datum/map/event/silicon_nightmares_powerstation
	name = "Kaneyama"
	full_name = "Kaneyama Power Station"
	path = "event/konyang"
	lobby_icons = list('icons/misc/titlescreens/lore/silicon_nightmares.dmi')

	allowed_jobs = list(/datum/job/visitor, /datum/job/passenger, /datum/job/captain, /datum/job/xo, /datum/job/operations_manager, /datum/job/chief_engineer, /datum/job/cmo, /datum/job/rd, /datum/job/hos, /datum/job/eventeng, /datum/job/eventmed, /datum/job/eventops, /datum/job/eventsci, /datum/job/eventsec, /datum/job/bridge_crew)

	station_levels = list(1,2)
	admin_levels = list(3)
	contact_levels = list(1,2)
	player_levels = list(1,2)
	accessible_z_levels = list(1,2)

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
		/datum/shuttle/autodock/multi/sn_canary,
		/datum/shuttle/autodock/ferry/lift/kaneyama,
		/datum/shuttle/autodock/ferry/lift/kaneyama_north
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

/area/kaneyama_ext/underground
	name = "Kaneyama Underground"
	icon_state = "mining"
	ambience = AMBIENCE_RUINS
	lighting = FALSE

/area/kaneyama_interiors
	name = "Kaneyama Interiors"
	icon_state = "red"
	base_turf = /turf/simulated/floor/plating
	requires_power = FALSE
	ambience = AMBIENCE_KONYANG_RAIN_MUFFLED

/area/kaneyama_interiors/elevator_zone
	name = "Elevator Shaft"
	base_turf = /turf/simulated/open

/area/kaneyama_interiors/subterrane
	name = "Kaneyama Service Tunnels"
	icon_state = "maintcentral"
	sound_env = TUNNEL_ENCLOSED
	ambience = AMBIENCE_MAINTENANCE
	requires_power = TRUE

/area/kaneyama_interiors/subterrane/elevator_zone
	name = "Elevator Shaft - Bottom"
	requires_power = FALSE

/area/kaneyama_interiors/subterrane/elevator_zone/north
	name = "North Elevator Shaft - Bottom"

/area/kaneyama_plant
	name = "Kaneyama Power Plant"
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	requires_power = FALSE
	ambience = AMBIENCE_TECH_RUINS

/area/kaneyama_plant/elevator_zone
	name = "Plant Elevator Shaft"
	base_turf = /turf/simulated/open

/area/kaneyama_boss
	name = "Kaneyama Power Plant Reactor #2"
	icon_state = "bluenew"
	base_turf = /turf/simulated/floor/plating
	ambience = AMBIENCE_TECH_RUINS
	area_flags = AREA_FLAG_ECD_TRIGGER
