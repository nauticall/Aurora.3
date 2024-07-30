/datum/map_template/ruin/away_site/tempest
	name = "Zeng-Hu Station"
	description = "A Zeng-Hu Pharmaceuticals-operated xenobiological research facility in the atmosphere of the gas giant Vejovis. "
	prefix = "odyssey/"
	suffix = "sinking_feeling.dmm"

	sectors = ALL_POSSIBLE_SECTORS
	id = "tempest"
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED
	sectors_blacklist = list(SECTOR_LEMURIAN_SEA) //because finding a sensor relay in hell would be weird

/obj/effect/overmap/visitable/sector/tempest
	name = "sensor relay"
	icon = 'icons/obj/overmap/overmap_stationary.dmi'
	icon_state = "battlestation"
	color = COLOR_PURPLE_GRAY
	desc = "A ring-shaped installation with a powerful sensor suite. These stations were originally built during the pre-Interstellar War era by the Solarian Alliance's \
	Department of Colonization as a method of making interstellar travel safer. Thousands of these 'beacon stations' were built by the Alliance and many were abandoned during the \
	Interstellar War and its aftermath. While they have been mostly replaced in more developed sectors, such as Liberty's Cradle and the Jewel Worlds, beacon stations are still \
	a common sight in less developed sectors of the Orion Spur such as the Badlands and Weeping Stars."
	comms_support = TRUE
	use_common = TRUE
	comms_name = "Tempest"
