/turf/simulated/floor/hivebot
	name = "alien circuitry"
	desc = "A strange, almost organic pattern of circuitry. It pulses softly, glowing with a dull red light."
	icon = 'maps/event/konyang/silicon_nightmares.dmi'
	icon_state = "hivecircuitfloor"
	light_power = 1
	light_color = LIGHT_COLOR_EMERGENCY_SOFT
	light_range = MINIMUM_USEFUL_LIGHT_RANGE

/turf/simulated/floor/hivebot/proc/deactivate()
	icon_state = "hivecircuitfloor_deactivated"
	set_light(0)
	spark(src, 1, GLOB.alldirs)

/obj/item/mech_component/manipulators/combat/konyang
	name = "chollima combat manipulators"
	exosuit_desc_string = "flexible, advanced manipulators"
	desc = "A set of state-of-the-art combat manipulators used by the Konyang Armed Forces' Mechatronic Corps. They are resilient, but their short structure means they can only hold shoulder-mounted weapons."
	icon_state = "police_arms"
	max_damage = 2000

/obj/item/mech_component/propulsion/combat/konyang
	name = "chollima hydraulic motivators"
	exosuit_desc_string = "heavy hydraulic legs"
	desc = "Complex armor provides excellent protective coverage over the internals of these enormous quadruped motivators."
	icon_state = "police_legs"
	move_delay = 5
	turn_delay = 5
	max_damage = 650
	trample_damage = 45

/obj/item/mech_component/sensors/combat/konyang
	name = "chollima high-resolution sensors"
	exosuit_desc_string = "high-resolution sensors"
	desc = "A highly advanced cockpit with high-resolution thermal optics installed on its faces. Decenly armored with excellent situational awareness."
	icon_state = "police_head"
	max_damage = 500
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/mech_component/chassis/combat/konyang
	name = "chollima sealed exousit chassis"
	pilot_coverage = 100
	exosuit_desc_string = "a heavily armored chassis"
	icon_state = "police_body"
	max_damage = 750
	mech_health = 3500
	power_use = 15000

/obj/item/mech_component/chassis/combat/konyang/prebuild()
	. = ..()
	QDEL_NULL(cell)
	cell = new /obj/item/cell/hyper(src)
	mech_armor = new /obj/item/robot_parts/robot_component/armor/mech/combat(src)

/mob/living/heavy_vehicle/premade/konyang
	name = "Chollima"
	desc = "An incredibly heavy-duty quadruped war machine, designed for the Konyang Armed Forces' Mechatronic Corps."
	icon_state = "darkgygax"

	e_head = /obj/item/mech_component/sensors/combat/konyang
	e_body = /obj/item/mech_component/chassis/combat/konyang
	e_arms = /obj/item/mech_component/manipulators/combat/konyang
	e_legs = /obj/item/mech_component/propulsion/combat/konyang
	e_color = COLOR_TITANIUM
	h_r_shoulder = /obj/item/mecha_equipment/mounted_system/combat/grenadefrag
	h_l_shoulder = /obj/item/mecha_equipment/mounted_system/combat/smg
	decal = "police_body_lights"

/mob/living/heavy_vehicle/premade/light/recon/konyang
	e_color = COLOR_TITANIUM

/mob/living/heavy_vehicle/premade/light/iac/konyang
	e_color = COLOR_TITANIUM

//Corpses & Fluff Notes

/obj/effect/landmark/corpse/konyang_soldier
	name = "Konyang Army Soldier"
	corpseuniform = /obj/item/clothing/under/rank/konyang
	corpsesuit = /obj/item/clothing/suit/armor/carrier/military
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsehelmet = /obj/item/clothing/head/helmet/konyang
	corpsebelt = /obj/item/gun/projectile/pistol/sol/konyang
	corpseid = FALSE
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/konyang_soldier/do_extra_customization(mob/living/carbon/human/M)
	. = ..()
	if(prob(20))
		M.equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/rifle/konyang/k556(M), slot_back)
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/konyang_soldier/officer
	name = "Konyang Army Officer"
	corpseuniform = /obj/item/clothing/under/rank/konyang/officer
	corpsesuit = null
	corpsehelmet = /obj/item/clothing/head/konyang/army/officer
	corpsebelt = /obj/item/gun/projectile/pistol/sol/konyang

/obj/effect/landmark/corpse/kaneyama_worker
	name = "GON-ENE Engineer"
	corpseuniform = /obj/item/clothing/under/service_overalls
	corpsesuit = /obj/item/clothing/suit/storage/hazardvest
	corpseshoes = /obj/item/clothing/shoes/workboots/brown
	corpsehelmet = /obj/item/clothing/head/hardhat
	corpsebelt = /obj/item/storage/belt/utility/full
	corpseid = FALSE
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/kaneyama_worker/do_extra_customization(mob/living/carbon/human/M)
	. = ..()
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/kaneyama_guard
	name = "GON-ENE Guard"
	corpseuniform = /obj/item/clothing/under/tactical
	corpsesuit = /obj/item/clothing/suit/armor/carrier/generic
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsehelmet = /obj/item/clothing/head/helmet/security/generic
	corpsebelt = /obj/item/storage/belt/security/full
	corpseid = FALSE
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/kaneyama_guard/do_extra_customization(mob/living/carbon/human/M)
	. = ..()
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/kaneyama_suit
	name = "GON-ENE Manager"
	corpseuniform = /obj/item/clothing/under/suit_jacket/navy
	corpseshoes = /obj/item/clothing/shoes/laceup
	corpseid = FALSE
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/kaneyama_suit/do_extra_customization(mob/living/carbon/human/M)
	. = ..()
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/kaneyama_suit/office
	name = "GON-ENE Office Worker"
	corpseuniform = /obj/item/clothing/under/sl_suit

/obj/machinery/computer/terminal/kaneyama_power
	name = "reactor monitoring terminal"
	desc = "A heavy terminal for monitoring the reactors of the Kaneyama power plant. This one is displaying a warning about structural damage."
	icon_screen = "power_screen"
	icon_keyboard = "tech_key"

/obj/machinery/computer/terminal/kaneyama_alarm
	name = "alarm monitoring terminal"
	desc = "A heavy terminal for monitoring the alarms of the Kaneyama power plant. This one is flashing red, warning of imminent critical failures across nearly all plant systems!"
	icon_screen = "alert:2"
	icon_keyboard = "generic_key"

/obj/machinery/computer/terminal/kaneyama_alarm/proc/calmdown()
	icon_screen = "alert:0"
	desc = "A heavy terminal for monitoring the alarms of the Kaneyama power plant. This one is flashing green, indicating no major alarms."

//Vending Machines

/obj/machinery/vending/volunteer
	name = "volunteer equipment"
	desc = "Holds basic equipment for crew volunteers."
	icon_state = "sec"
	icon_vend = "sec-vend"
	deny_time = 16
	vend_id = "volunteer"
	products = list(
		/obj/item/clothing/suit/armor/carrier/scc = 50,
		/obj/item/clothing/head/helmet/security/scc = 50,
		/obj/item/gun/projectile/leyon = 50,
		/obj/item/ammo_magazine/mc10mm/leyon = 100,
		/obj/item/device/flashlight = 100,
		/obj/item/gun/projectile/automatic/rifle/carbine/civcarbine = 10,
		/obj/item/ammo_magazine/a556/carbine/polymer = 50,
		/obj/item/gun/energy/gun = 10,
		/obj/item/storage/firstaid/stab = 10,
		/obj/item/device/flashlight/maglight = 50,
		/obj/item/recharger_backpack = 3,
	)
	restock_items = FALSE
	random_itemcount = FALSE

/obj/machinery/vending/konyang
	name = "\improper Konyang Armed Forces equipment"
	desc = "Holds Konyang-branded weapons and ammunition."
	icon_state = "sec"
	icon_vend = "sec-vend"
	deny_time = 16
	vend_id = "konyang"
	req_access = list(ACCESS_KONYANG_POLICE)
	products = list(
		/obj/item/ammo_magazine/mc9mm = 100,
		/obj/item/ammo_magazine/submachinemag = 50,
		/obj/item/gun/projectile/pistol/sol/konyang = 10,
		/obj/item/gun/projectile/automatic/tommygun/konyang = 5,
		/obj/item/clothing/accessory/holster/hip = 50,
		/obj/item/device/flashlight/maglight,
	)
	restock_items = FALSE
	random_itemcount = FALSE

/obj/machinery/vending/security_ammo
	name = "security resupply vendor"
	desc = "Holds ammunition for security's weapons."
	icon_state = "sec"
	icon_vend = "sec-vend"
	deny_time = 16
	vend_id = "secammo"
	req_access = list(ACCESS_SECURITY)
	products = list(
		/obj/item/ammo_magazine/c45m = 20,
		/obj/item/ammo_magazine/a556/carbine = 20,
		/obj/item/device/flashlight/maglight = 50,
	)
