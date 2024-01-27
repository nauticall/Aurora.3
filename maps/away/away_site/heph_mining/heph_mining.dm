/datum/map_template/ruin/away_site/heph_mining_station
	name = "derelict Hephaestus mining station"
	description = "A Hephaestus-owned mining station situated on a mineral-rich asteroid. It was built to mine the asteroid it was attached to, as well as its surroundings, and had schematics of shuttles. This one seems freshly abandoned."
	suffixes = list("away_site/sensor_relay/sensor_relay.dmm")
	sectors = ALL_CORPORATE_SECTORS
	id = "heph_mining"
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED

/singleton/submap_archetype/heph_mining_station
	map = "derelict Hephaestus mining station"
	descriptor = "A Hephaestus-owned mining station situated on a mineral-rich asteroid. It was built to mine the asteroid it was attached to, as well as its surroundings, and had schematics of shuttles. This one seems freshly abandoned."

/obj/effect/overmap/visitable/sector/heph_mining_station
	name = "derelict Hephaestus mining station"
	desc = "A Hephaestus-owned mining station situated on a mineral-rich asteroid. It was built to mine the asteroid it was attached to, as well as its surroundings, and had schematics of shuttles. This one seems freshly abandoned."

/area/heph_mining
	name = "mining station"
	icon_state = "dk_yellow"
	requires_power = TRUE

/area/heph_mining/hallway
	name = "North Hallway"
	icon_state = "hallF"

/area/heph_mining/hallway/south
	name = "South Hallway"
	icon_state = "hallA"

/area/heph_mining/hallway/north_dock
	name = "North Docking Arm"
	icon_state = "entry_1"

/area/heph_mining/hallway/east_dock
	name = "East Docking Arm"
	icon_state = "entry_2"

/area/heph_mining/storage
	name = "Storage Bay A"
	icon_state = "primarystorage"

/area/heph_mining/storage/bar
	name = "Storage Bay B"
	icon_state = "bar"

/area/heph_mining/storage/gym
	name = "Storage Bay C"
	icon_state = "fitness_gym"

/area/heph_mining/medbay
	name = "Medical Bay"
	icon_state = "medbay"

/area/heph_mining/mess_hall
	name = "Mess Hall"
	icon_state = "crew_area"

/area/heph_mining/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/heph_mining/hydro
	name = "Hydroponics"
	icon_state = "hydro"

/area/heph_mining/crew_quarters
	name = "Crew Quarters"
	icon_state = "crew_quarters"

/area/heph_mining/mining_bay
	name = "Mining Bay"
	icon_state = "mining_production"

/area/heph_mining/engineering
	name = "Engineering"
	icon_state = "engineering"

/area/heph_mining/shelter
	name = "Emergency Shelter"
	icon_state = "outpost_mine_main"
