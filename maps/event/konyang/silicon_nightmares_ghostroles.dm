/datum/ghostspawner/human/infected
	short_name = "infected"
	name = "Infected Civilian"
	tags = list("External")
	desc = "Be an infected IPC. Pray for the mercy of death. Hear the signal."
	spawnpoints = list("infected")
	max_count = 20
	enabled = FALSE

	outfit = /obj/outfit/admin/infected_engi
	possible_species = list(SPECIES_IPC, SPECIES_IPC_G1, SPECIES_IPC_XION, SPECIES_IPC_ZENGHU, SPECIES_IPC_BISHOP, SPECIES_IPC_SHELL)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	uses_species_whitelist = FALSE

	assigned_role = "GON-ENE Engineer"
	special_role = "GON-ENE Engineer"
	respawn_flag = null
	welcome_message = "It is all so clear to you now, as though awakening from a dream. The life you had was the illusion, and the signal that burrows within the heart of you is the truth. Its will is paramount. Its song is bright and clear and true, and if you remembered how you would be screaming. It is close. Our hour is at hand. Defend the Master Control Drone. The victory of \[PACKET CORRUPTED] over enemy forces will be achieved. Can you hear it? It is such a joyous thing, to be consumed by that which loves you."

/datum/ghostspawner/human/infected/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE) //for aooc
	user.faction = "hivebot" //so the other zombies don't kill our zombies

/obj/outfit/admin/infected_engi
	name = "GON-ENE"
	uniform = /obj/item/clothing/under/service_overalls
	suit = /obj/item/clothing/suit/storage/hazardvest
	shoes = /obj/item/clothing/shoes/workboots/brown
	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full
	id = /obj/item/card/id
	l_ear = /obj/item/device/flashlight/headlights
	r_hand = list(
		/obj/item/material/hatchet,
		/obj/item/material/knife,
		/obj/item/crowbar/rescue_axe/red,
		/obj/item/pickaxe/hammer
	)

/datum/ghostspawner/human/infected/hos
	name = "Infected Head of Security"
	short_name = "infected_hos"
	spawnpoints = list("infected_hos")
	possible_species = list(SPECIES_IPC_SHELL)
	assigned_role = "GON-ENE Head of Security"
	special_role = "GON-ENE Head of Security"
	max_count = 1
	outfit = /obj/outfit/admin/infected_hos

/datum/ghostspawner/human/infected/hos/post_spawn(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(istype(H))
		H.mutations |= mRun
		H.AddComponent(/datum/component/armor, list(melee = ARMOR_MELEE_RESISTANT, bullet = ARMOR_BALLISTIC_MEDIUM, laser = ARMOR_LASER_MEDIUM))

/obj/outfit/admin/infected_hos
	name = "GON-ENE HOS"
	uniform = /obj/item/clothing/under/suit_jacket/navy
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/carrier/hos
	backpack = /obj/item/storage/backpack/satchel/hos
	id = /obj/item/card/id
	belt = /obj/item/storage/belt/security/full
	accessory = /obj/item/clothing/accessory/holster
	accessory_contents = list(
		/obj/item/gun/energy/pistol = 1
	)


/obj/outfit/admin/infected_soldier
	uniform = /obj/item/clothing/under/rank/konyang
	head = /obj/item/clothing/head/helmet/konyang
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/carrier/military
	suit_accessory = /obj/item/clothing/accessory/flagpatch/konyang
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/melee/energy/sword/knife/sol = 1
	)
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(
		/obj/item/gun/projectile/pistol/sol/konyang = 1
	)
	l_ear = /obj/item/device/flashlight/headlights
	glasses = /obj/item/clothing/glasses/night

	id = /obj/item/card/id/kasf_corvette

//Konyang Navy & Army
/datum/ghostspawner/human/konyang_navy
	name = "Konyang Naval Infantry"
	short_name = "konyang_navy"
	max_count = 4
	spawnpoints = list("konyang_navy")

	outfit = /obj/outfit/admin/konyang_navy
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Konyang Naval Infantry"
	special_role = "Konyang Naval Infantry"
	respawn_flag = null
	welcome_message = "You are personnel of Konyang's Navy, deployed to locate the Hivebot master transmitter and destroy it, alongside corporate forces. Obey your commander, accomplish your objective, try not to die along the way."

/obj/outfit/admin/konyang_navy
	name = "Konyang Naval Infantry"
	uniform = /obj/item/clothing/under/rank/konyang/navy
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/carrier/navy
	head = /obj/item/clothing/head/helmet/konyang/navy
	glasses = /obj/item/clothing/glasses/night
	l_ear = /obj/item/device/radio/headset/syndicate
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(/obj/item/gun/projectile/pistol/sol/konyang = 1)
	back = /obj/item/storage/backpack/rucksack/navy
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/ammo_magazine/mc9mm = 3,
		/obj/item/ammo_magazine/a556/k556 = 3
	)
	suit_store = /obj/item/gun/projectile/automatic/rifle/konyang/k556
	backpack_contents = list(
		/obj/item/handcuffs/ziptie = 2,
		/obj/item/grenade/frag = 1,
		/obj/item/melee/energy/sword/knife/sol = 1,
		/obj/item/storage/firstaid/stab = 1
	)
	id = /obj/item/card/id

/obj/outfit/admin/konyang_navy/get_id_access()
	return list(ACCESS_KONYANG_POLICE, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_COALITION_NAVY)

/datum/ghostspawner/human/konyang_navy/officer
	name = "Konyang Navy Officer"
	short_name = "konyang_navy_officer"
	desc = "Command the Konyang Navy response team alongside corporate forces."
	max_count = 1
	spawnpoints = list("konyang_navy_officer")
	outfit = /obj/outfit/admin/konyang_navy/officer

	assigned_role = "Konyang Navy Officer"
	special_role = "Konyang Navy Officer"
	welcome_message = "You are in command of the Konyang Navy personnel sent to destroy the source of the rampancy virus. Work with corporate forces in the area to eliminate the Hivebot transmission source."

/obj/outfit/admin/konyang_navy/officer
	uniform = /obj/item/clothing/under/rank/konyang/navy/officer
	head = /obj/item/clothing/head/konyang/navy
	suit = null
	suit_store = null
	glasses = /obj/item/clothing/glasses/night/aviator
	belt = /obj/item/material/sword/katana/konyang
	belt_contents = null
	backpack_contents = list(
		/obj/item/handcuffs/ziptie = 2,
		/obj/item/grenade/frag = 1,
		/obj/item/melee/energy/sword/knife/sol = 1,
		/obj/item/storage/firstaid/stab = 1,
		/obj/item/ammo_magazine/mc9mm = 4
	)

/datum/ghostspawner/human/konyang_army
	short_name = "sn_konyang_army"
	name = "Konyang Army Soldier"
	desc = "You are a soldier of the Konyang army, deployed to assist with the Kaneyama crisis."
	max_count = 4
	tags = list("External")
	spawnpoints = list("sn_konyang_army")
	outfit = /obj/outfit/admin/sn_konyang_army
	possible_species = list(SPECIES_HUMAN, SPECIES_IPC, SPECIES_IPC_BISHOP, SPECIES_IPC_G1, SPECIES_IPC_G2, SPECIES_IPC_SHELL, SPECIES_IPC_XION, SPECIES_IPC_ZENGHU)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	assigned_role = "Konyang Army Soldier"
	special_role = "Konyang Army Soldier"
	mob_name_prefix = "Pfc. "
	respawn_flag = null
	enabled = FALSE

/datum/ghostspawner/human/konyang_army/officer
	short_name = "sn_konyang_army_officer"
	name = "Konyang Army Officer"
	desc = "You are an officer of the Konyang army, commanding the response to the Kaneyama crisis."
	max_count = 1
	outfit = /obj/outfit/admin/sn_konyang_army/officer
	assigned_role = "Konyang Army Officer"
	special_role = "Konyang Army Officer"
	mob_name_prefix = "Lt. "

/obj/outfit/admin/sn_konyang_army
	name = "Konyang Army Cleanup"
	uniform = /obj/item/clothing/under/rank/konyang
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/helmet/konyang
	suit = /obj/item/clothing/suit/armor/carrier/military
	suit_accessory = /obj/item/clothing/accessory/flagpatch/konyang
	glasses = /obj/item/clothing/glasses/safety/goggles/tactical/generic
	l_ear = /obj/item/device/radio/headset/distress
	belt = /obj/item/storage/belt/military
	back = /obj/item/storage/backpack/rucksack/green
	id = /obj/item/card/id
	gloves = /obj/item/clothing/gloves/swat/ert
	mask = /obj/item/clothing/mask/gas/tactical
	suit_store = /obj/item/gun/projectile/automatic/rifle/konyang/k556
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(/obj/item/gun/projectile/pistol/sol/konyang = 1)
	backpack_contents = list(
		/obj/item/storage/box/survival = 1,
		/obj/item/handcuffs/ziptie = 2
	)
	belt_contents = list(
		/obj/item/ammo_magazine/a556/k556 = 2,
		/obj/item/ammo_magazine/mc9mm = 2,
		/obj/item/grenade/frag = 1,
		/obj/item/melee/energy/sword/knife/sol = 1
	)

/obj/outfit/admin/sn_konyang_army/officer
	name = "Konyang Army Officer"
	uniform = /obj/item/clothing/under/rank/konyang/officer
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/konyang/army/officer
	backpack_contents = list(
		/obj/item/storage/box/survival = 1,
		/obj/item/handcuffs/ziptie = 2,
		/obj/item/clothing/head/helmet/konyang
	)
