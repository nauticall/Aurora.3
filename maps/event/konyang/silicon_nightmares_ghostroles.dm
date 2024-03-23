/datum/ghostspawner/human/infected
	short_name = "infected"
	name = "Infected Engineer - North"
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
	password = "warrior"

/datum/ghostspawner/human/infected/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE) //for aooc
	user.faction = "hivebot" //so the other zombies don't kill our zombies

	var/mob/living/carbon/human/M = user
	if(istype(M))
		var/obj/item/organ/internal/ipc_tag/tag = M.internal_organs_by_name[BP_IPCTAG]
		if(istype(tag))
			tag.serial_number = uppertext(dd_limittext(md5(M.real_name), 12))
			tag.ownership_info = IPC_OWNERSHIP_SELF
			tag.citizenship_info = CITIZENSHIP_COALITION


/obj/outfit/admin/infected_engi
	name = "GON-ENE"
	uniform = /obj/item/clothing/under/service_overalls
	suit = /obj/item/clothing/suit/storage/hazardvest
	shoes = /obj/item/clothing/shoes/workboots/brown
	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full
	id = /obj/item/card/id
	l_ear = /obj/item/device/flashlight/headlights
	r_hand = /obj/random/melee/konyang

/datum/ghostspawner/human/infected/subterrane
	name = "Infected Engineer - Underground"
	short_name = "infected_underground"
	spawnpoints = list("infected_underground")

/datum/ghostspawner/human/infected/guard
	name = "Infected Guard - Security Wing"
	short_name = "infected_guard"
	spawnpoints = list("infected_guard")
	max_count = 7
	assigned_role = "GON-ENE Guard"
	special_role = "GON-ENE Guard"
	outfit = /obj/outfit/admin/infected_guard

/datum/ghostspawner/human/infected/guard/subterrane
	name = "Infected Guard - Underground"
	short_name = "infected_guard_underground"
	spawnpoints = list("infected_guard_underground")

/datum/ghostspawner/human/infected/guard/west
	name = "Infected Guard - West Plant Wing"
	short_name = "infected_guard_west"
	spawnpoints = list("infected_guard_west")
	max_count = 4

/datum/ghostspawner/human/infected/west
	name = "Infected Engineer - West Plant Wing"
	short_name = "infected_west"
	spawnpoints = list("infected_west")
	max_count = 10

/datum/ghostspawner/human/infected/guard/east
	name = "Infected Guard - East Plant Wing"
	short_name = "infected_guard_east"
	spawnpoints = list("infected_guard_east")
	max_count = 4

/datum/ghostspawner/human/infected/east
	name = "Infected Engineer - East Plant Wing"
	short_name = "infected_east"
	spawnpoints = list("infected_east")
	max_count = 10

/datum/ghostspawner/human/infected/ext
	name = "Infected Engineer - East Plant Exterior"
	short_name = "infected_ext"
	spawnpoints = list("infected_ext")
	max_count = 20

/obj/outfit/admin/infected_guard
	name = "GON-ENE Guard"
	uniform = /obj/item/clothing/under/tactical
	suit = /obj/item/clothing/suit/armor/carrier/generic
	head = /obj/item/clothing/head/helmet/security/generic
	belt = /obj/item/storage/belt/security/full
	accessory = /obj/item/clothing/accessory/holster
	accessory_contents = list(
		/obj/random/civgun/konyang = 1
	)
	suit_store = /obj/random/civgun/rifle/konyang
	id = /obj/item/card/id
	back = /obj/item/storage/backpack/security
	shoes = /obj/item/clothing/shoes/jackboots

/datum/ghostspawner/human/infected/hos
	name = "Infected Head of Security"
	short_name = "infected_hos"
	spawnpoints = list("infected_hos")
	assigned_role = "GON-ENE Head of Security"
	special_role = "GON-ENE Head of Security"
	max_count = 1
	outfit = /obj/outfit/admin/infected_hos
	password = "falke"

/obj/outfit/admin/infected_hos
	name = "GON-ENE HOS"
	uniform = /obj/item/clothing/under/suit_jacket/navy
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/carrier/hos/equipped
	backpack = /obj/item/storage/backpack/satchel/hos
	id = /obj/item/card/id
	belt = /obj/item/storage/belt/security/full
	accessory = /obj/item/clothing/accessory/holster
	accessory_contents = list(
		/obj/random/civgun/konyang = 1
	)

/datum/ghostspawner/human/infected/soldier
	name = "Infected Soldier"
	short_name = "infected_soldier"
	spawnpoints = list("infected_soldier")
	max_count = 3
	outfit = /obj/outfit/admin/infected_soldier
	assigned_role = "Konyang Army Personnel"
	special_role = "Konyang Army Personnel"
	password = "jinroh"

/datum/ghostspawner/human/infected/pilot
	name = "Infected Pilot"
	short_name = "infected_pilot"
	spawnpoints = list("infected_soldier")
	max_count = 1
	outfit = /obj/outfit/admin/infected_pilot
	assigned_role = "Konyang Army Pilot"
	special_role = "Konyang Army Pilot"
	password = "campingpls"

/obj/outfit/admin/infected_soldier
	uniform = /obj/item/clothing/under/rank/konyang
	head = /obj/item/clothing/head/helmet/konyang
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/carrier/military
	suit_accessory = /obj/item/clothing/accessory/flagpatch/konyang
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/melee/energy/sword/knife/sol = 1,
		/obj/item/ammo_magazine/a556/carbine/konyang47 =1
	)
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(
		/obj/item/gun/projectile/pistol/sol/konyang = 1
	)
	l_ear = /obj/item/device/flashlight/headlights
	suit_store = /obj/item/gun/projectile/automatic/rifle/konyang/konyang47

	id = /obj/item/card/id/kasf_corvette

/obj/outfit/admin/infected_pilot
	uniform = /obj/item/clothing/under/rank/konyang/mech_pilot
	head = /obj/item/clothing/head/helmet/konyang/pilot
	shoes = /obj/item/clothing/shoes/jackboots
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(
		/obj/item/gun/projectile/pistol/sol/konyang = 1
	)
	l_ear = /obj/item/device/flashlight/headlights
	id = /obj/item/card/id/kasf_corvette

/datum/ghostspawner/human/infected/diver
	name = "Infected Diver"
	short_name = "infected_diver"
	spawnpoints = list("infected_diver")
	max_count = 1
	possible_species = list(SPECIES_IPC_G2, SPECIES_IPC_SHELL)
	outfit = /obj/outfit/admin/infected_diver

/obj/outfit/admin/infected_diver
	suit = null
	head = null
	back = /obj/item/rig/diving

/datum/ghostspawner/human/infected/diver/post_spawn(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(istype(H))
		H.mutations |= HULK

/datum/ghostspawner/human/infected/diver_entrance
	name = "Infected Diver - Entrance"
	short_name = "infected_diver_entrance"
	spawnpoints = list("infected_diver")
	max_count = 1
	possible_species = list(SPECIES_IPC_SHELL)
	outfit = /obj/outfit/admin/infected_diver

/obj/outfit/admin/infected_diver
	suit = null
	head = null
	back = /obj/item/rig/diving

/datum/ghostspawner/human/infected/police
	name = "Infected Police - South"
	short_name = "infected_cop"
	spawnpoints = list("infected_cop")
	max_count = 6
	outfit = /obj/outfit/admin/infected_cop

/datum/ghostspawner/human/infected/police/north
	name = "Infected Police - North"
	short_name = "infected_cop_north"
	spawnpoints = list("infected_cop_north")
	max_count = 10

/datum/ghostspawner/human/infected/south
	name = "Infected Engineer - South"
	short_name = "infected_south"
	spawnpoints = list("infected_south")
	max_count = 10

/obj/outfit/admin/infected_cop
	uniform = /obj/item/clothing/under/rank/konyang/police
	head = /obj/item/clothing/head/konyang/police
	belt = /obj/item/storage/belt/security/full
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(
		/obj/item/gun/projectile/revolver/konyang/police = 1
	)
	back = /obj/item/storage/backpack/satchel
	suit = /obj/item/clothing/suit/storage/vest/konyang

//Konyang Navy & Army
/datum/ghostspawner/human/konyang_naval_infantry
	short_name = "konyang_naval_infantry"
	name = "Konyang Naval Infantry"
	desc = "You are a soldier of Konyang's Naval Infantry, deployed to assist with the Kaneyama crisis."
	max_count = 8
	tags = list("External")
	spawnpoints = list("konyang_naval_infantry")
	outfit = /obj/outfit/admin/konyang_navy
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	assigned_role = "Konyang Naval Infantry"
	special_role = "Konyang Naval Infantry"
	respawn_flag = null
	enabled = TRUE
	welcome_message = "You are personnel of Konyang's Navy, deployed to locate the Hivebot master transmitter and destroy it, alongside corporate forces. Obey your commander, accomplish your objective, try not to die along the way."
	password = "marines"


/obj/outfit/admin/konyang_navy
	name = "Konyang Naval Infantry"
	uniform = /obj/item/clothing/under/rank/konyang/navy
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/carrier/navy
	head = /obj/item/clothing/head/helmet/konyang/navy
	l_ear = /obj/item/device/radio/headset/syndicate
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(/obj/item/gun/projectile/pistol/sol/konyang = 1)
	back = /obj/item/storage/backpack/rucksack/navy
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/ammo_magazine/mc9mm = 3,
		/obj/item/ammo_magazine/a556/carbine/konyang47 = 3
	)
	suit_store = /obj/item/gun/projectile/automatic/rifle/konyang/konyang47
	backpack_contents = list(
		/obj/item/handcuffs/ziptie = 2,
		/obj/item/grenade/frag = 1,
		/obj/item/melee/energy/sword/knife/sol = 1,
		/obj/item/storage/firstaid/stab = 1,
		/obj/item/device/flashlight/maglight = 1
	)
	id = /obj/item/card/id

/obj/outfit/admin/konyang_navy/get_id_access()
	return list(ACCESS_KONYANG_POLICE, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_COALITION_NAVY)

/datum/ghostspawner/human/konyang_naval_infantry/officer
	name = "Konyang Navy Officer"
	short_name = "konyang_navy_officer"
	desc = "Command the Konyang Navy response team alongside corporate forces."
	max_count = 2
	spawnpoints = list("konyang_navy_officer")
	outfit = /obj/outfit/admin/konyang_navy/officer
	possible_species = list(SPECIES_HUMAN, SPECIES_IPC)
	assigned_role = "Konyang Navy Officer"
	special_role = "Konyang Navy Officer"
	welcome_message = "You are in command of the Konyang Navy personnel sent to destroy the source of the rampancy virus. Work with corporate forces in the area to eliminate the Hivebot transmission source."
	password = "torres"

/obj/outfit/admin/konyang_navy/officer
	uniform = /obj/item/clothing/under/rank/konyang/navy/officer
	head = /obj/item/clothing/head/konyang/navy
	glasses = null
	suit = null
	suit_store = null
	belt = /obj/item/material/sword/katana/konyang
	belt_contents = null
	backpack_contents = list(
		/obj/item/handcuffs/ziptie = 2,
		/obj/item/grenade/frag = 1,
		/obj/item/melee/energy/sword/knife/sol = 1,
		/obj/item/storage/firstaid/stab = 1,
		/obj/item/ammo_magazine/mc9mm = 4,
		/obj/item/device/flashlight/maglight = 1
	)

/datum/ghostspawner/human/konyang_army
	short_name = "sn_konyang_army"
	name = "Konyang Army Soldier"
	desc = "You are a soldier of the Konyang army, deployed to assist with the Kaneyama crisis."
	max_count = 8
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
	max_count = 2
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

//The Trustworthy Merchant
/datum/ghostspawner/human/konyang_merchant
	name = "Trustworthy Merchant"
	short_name = "konyang_merchant"
	tags = list("External")
	desc = "The rampancy virus holds no terror for you - only opportunities for profit. Sell your various wares to those who find their way to you."
	spawnpoints = list("konyang_merchant")
	max_count = 1
	enabled = FALSE

	outfit = /obj/outfit/admin/konyang_merchant
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Merchant"
	special_role = "Merchant"
	respawn_flag = null
	password = "stranger"

/datum/ghostspawner/human/konyang_merchant/post_spawn(mob/user)
	. = ..()
	user.faction = "hivebot" //so the zombies inexplicably don't kill this guy

/obj/outfit/admin/konyang_merchant
	name = "Trustworthy Merchant"
	uniform = /obj/item/clothing/under/konyang/pirate/tanktop
	suit = /obj/item/clothing/suit/storage/toggle/trench
	accessory = /obj/item/clothing/accessory/storage/brown_vest
	back = /obj/item/storage/backpack/satchel/leather
	l_pocket = /obj/item/storage/wallet/sol_rich
	id = /obj/item/card/id
	l_ear = /obj/item/device/radio/headset

/obj/outfit/admin/konyang_merchant/get_id_access()
	return list(ACCESS_MERCHANT)

//The Reporter
/datum/ghostspawner/human/bitbyte
	name = "BitByte Reporter"
	short_name = "bitbyte"
	tags = list("External")
	desc = "As a BitByte field reporter, cover the LIVE response to the rampancy outbreak!"
	spawnpoints = list("bitbyte")
	max_count = 1
	enabled = TRUE

	outfit = /obj/outfit/admin/bitbyte
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	extra_languages = list(LANGUAGE_SOL_COMMON)

	assigned_role = "BitByte Reporter"
	special_role = "BitByte Reporter"
	respawn_flag = null
	password = "bytetheminute"

/obj/outfit/admin/bitbyte
	name = "BitByte Reporter"
	uniform = /obj/item/clothing/under/sl_suit
	accessory = /obj/item/clothing/accessory/tie/blue_clip
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/storage/backpack/satchel/leather
	id = /obj/item/card/id
	backpack_contents = list(
		/obj/item/storage/box/survival = 1
	)

/obj/outfit/admin/bitbyte/get_id_access()
	return list(ACCESS_JOURNALIST)
