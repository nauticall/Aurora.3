//Cargo Shuttle

/datum/shuttle/autodock/ferry/supply/konyang
	name = "OX Supply Shuttle"
	location = 1
	shuttle_area = /area/supply/dock
	dock_target = "cargo_shuttle"
	waypoint_station = "nav_cargo_shuttle_dock"
	waypoint_offsite = "nav_cargo_shuttle_start"

/obj/effect/shuttle_landmark/supply/konyang/start
	name = "SCCV Horizon Cargo Dock"
	landmark_tag = "nav_cargo_shuttle_start"
	base_turf = /turf/unsimulated/floor/plating
	base_area = /area/centcom

/obj/effect/shuttle_landmark/supply/konyang/dock
	name = "Planetary Docking Site"
	landmark_tag = "nav_cargo_shuttle_dock"
	docking_controller = "cargo_shuttle_dock"
	base_turf = /turf/simulated/floor/plating
	base_area = /area/kaneyama_ext

//Canary
/area/shuttle/sn_canary
	name = "SCCV Canary"

/datum/shuttle/autodock/multi/sn_canary
	name = "SCCV Canary"
	current_location = "nav_sn_base"
	warmup_time = 10
	shuttle_area = /area/shuttle/sn_canary
	destination_tags = list("nav_sn_base")

/obj/effect/shuttle_landmark/sn_canary/start
	name = "Kaneyama SCC Outpost"
	landmark_tag = "nav_sn_base"
	base_turf = /turf/simulated/floor/plating
	base_area = /area/kaneyama_ext

/obj/machinery/computer/shuttle_control/multi/sn_canary
	name = "\improper Canary control console"
	shuttle_tag = "SCCV Canary"
	req_access = list(ACCESS_INTREPID)
	density = 0
	icon = 'icons/obj/cockpit_console.dmi'
	icon_state = "right"
	icon_screen = "blue"
	icon_keyboard = null
	circuit = null

/obj/machinery/computer/fake_cockpit_console
	name = "helm control console"
	desc = "A console for long-range flight control. Currently disabled."
	density = 0
	icon = 'icons/obj/cockpit_console.dmi'
	icon_state = "main"
	icon_screen = "helm"
	icon_keyboard = null
	light_color = LIGHT_COLOR_CYAN
	circuit = null

/obj/machinery/computer/fake_cockpit_console/engines
	name = "engine control console"
	icon_state = "right"
	icon_screen = "engine"

/obj/machinery/computer/fake_cockpit_console/sensors
	name = "sensors control console"
	icon_state = "left_wide"
	icon_screen = "sensors"

/obj/machinery/computer/fake_cockpit_console/targeting
	name = "targeting systems console"
	desc = "A console for weapons targeting. Currently disabled."
	icon_state = "left"
	icon_screen = "targeting"

/obj/structure/fake_sensors //no overmap so we replace it with a fake for aesthetics
	name = "sensors suite"
	desc = "An upgrade to the standard ship-mounted sensor array, this beast has massive cooling systems running beneath it, allowing it to run hotter for much longer. Can only run in vacuum to protect delicate quantum BS elements."
	anchored = TRUE
	icon_state = "sensors"
	icon = 'icons/obj/spaceship/scc/shuttle_sensors.dmi'

//ERT
/datum/shuttle/autodock/multi/kasf_ert
	name = "KASF Shuttle"
	current_location = "nav_distress_away"
	warmup_time = 10
	move_time = 45
	dock_target = "distress_shuttle_aft"
	shuttle_area = /area/shuttle/distress
	landmark_transition = "nav_distress_interim"
	destination_tags = list(
		"nav_distress_away",
		"nav_kasf_base",
		"nav_kasf_1",
		"nav_kasf_2",
		"nav_kasf_3",
		"nav_kasf_4"
		)

/obj/effect/shuttle_landmark/distress/kaneyama1
	name = "SCC Outpost"
	landmark_tag = "nav_kasf_base"
	landmark_flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/distress/kaneyama2
	name = "Kaneyama Southern Facility"
	landmark_tag = "nav_kasf_1"
	landmark_flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/distress/kaneyama3
	name = "Kaneyama Power Plant Exterior"
	landmark_tag = "nav_kasf_2"
	landmark_flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/distress/kaneyama4
	name = "Kaneyama Power Plant Bridge"
	landmark_tag = "nav_kasf_3"
	landmark_flags = SLANDMARK_FLAG_AUTOSET

/obj/machinery/computer/shuttle_control/multi/kasf
	name = "shuttle control computer"
	req_access = list(ACCESS_DISTRESS)
	shuttle_tag = "KASF Shuttle"
