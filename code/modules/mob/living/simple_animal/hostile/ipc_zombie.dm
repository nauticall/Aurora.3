/mob/living/simple_animal/hostile/ipc_zombie
	name = "infected IPC"
	desc = "A Baseline IPC, which appears to be in a state of disrepair. Wires are hanging out of it and its screen is cracked and flickering."
	icon = 'icons/mob/npc/ipc_zombie.dmi'
	icon_state = "baseline_grey"
	icon_living = "baseline_grey"
	icon_dead = "baseline_grey_dead"
	blood_type = COLOR_OIL
	health = 100
	maxHealth = 100
	melee_damage_lower = 15
	melee_damage_upper = 20
	armor_penetration = 20
	attack_sound = 'sound/weapons/smash.ogg'
	attacktext = "smashed"
	faction = "hivebot"
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	speed = 4
	see_in_dark = 8
	emote_hear = list("emits a harsh noise")
	emote_sounds = list(
		'sound/effects/creatures/hivebot/synth_possessed.ogg',
		'sound/effects/creatures/hivebot/synth_possessed_ping.ogg',
		'sound/effects/creatures/hivebot/synth_possessed_sigh.ogg',
	)
	speak_chance = 5
	attack_emote = "focuses on"
	tameable = FALSE
	psi_pingable = FALSE
	stop_automated_movement_when_pulled = 0
	///Icon state for screen overlay
	var/screen

	///Overlay of a screen to display on the zombie's monitor
	var/image/screen_overlay

	///Is the IPC cured?
	var/cured = FALSE
	var/icon_off = "baseline_grey_off"

/mob/living/simple_animal/hostile/ipc_zombie/Initialize()
	. = ..()
	icon_state = pick("baseline_grey", "baseline_red", "baseline_green", "baseline_yellow")
	icon_living = icon_state
	icon_dead = "[icon_state]_dead"
	icon_off = "[icon_state]_off"
	screen = pick("screen_blue", "screen_red", "screen_orange", "screen_lumi_eyes", "screen_goggles", "screen_console", "screen_static2", "screen_static3")
	screen_overlay = image('icons/mob/npc/ipc_zombie.dmi', "[screen]", EFFECTS_ABOVE_LIGHTING_LAYER)
	screen_overlay.appearance_flags = KEEP_APART
	add_overlay(screen_overlay)
	set_light(MINIMUM_USEFUL_LIGHT_RANGE, 2, LIGHT_COLOR_TUNGSTEN)

/mob/living/simple_animal/hostile/ipc_zombie/update_icon()
	if(stat == DEAD && !cured)
		icon_state = icon_dead
	if(stat == DEAD && cured)
		icon_state = icon_off
		screen = "screen_static2"
	cut_overlays()
	if(screen && (stat != DEAD || cured))
		screen_overlay = image('icons/mob/npc/ipc_zombie.dmi', "[screen]", EFFECTS_ABOVE_LIGHTING_LAYER)
		screen_overlay.appearance_flags = KEEP_APART
		add_overlay(screen_overlay)

/mob/living/simple_animal/hostile/ipc_zombie/death(gibbed, deathmessage="collapses, its servos no longer functioning!")
	if(cured)
		dir = SOUTH
	if(!cured)
		set_light(0)
	. = ..()

/mob/living/simple_animal/hostile/ipc_zombie/get_examine_text(mob/user, distance, is_adjacent, infix, suffix)
	. = ..()
	if (stat == DEAD && !cured)
		. += SPAN_DANGER("It looks damaged to the point of inoperability. Intensive repair will be required.")
	if (stat == DEAD && cured)
		. += SPAN_WARNING("It is standing perfectly still, seemingly locked in place. Its screen reads 'REBOOTING CORE OS'.")
	if (health < maxHealth * 0.5)
		. += "<span class='danger'>It looks badly damaged.</span>"
	else if (health < maxHealth)
		. += "<span class='warning'>It looks damaged.</span>"

/mob/living/simple_animal/hostile/ipc_zombie/think()
	. = ..()
	if(stance != HOSTILE_STANCE_IDLE)
		environment_smash = TRUE
	else
		environment_smash = FALSE

/mob/living/simple_animal/hostile/ipc_zombie/get_bullet_impact_effect_type(var/def_zone)
	return BULLET_IMPACT_METAL

/mob/living/simple_animal/hostile/ipc_zombie/isSynthetic()
	return TRUE

/mob/living/simple_animal/hostile/ipc_zombie/adjustHalLoss(amount)
	return FALSE

/mob/living/simple_animal/hostile/ipc_zombie/adjustToxLoss(amount)
	return FALSE

/mob/living/simple_animal/hostile/ipc_zombie/adjustOxyLoss(amount)
	return FALSE

/obj/effect/landmark/corpse/ipc_zombie //just a naked baseline corpse
	name = "IPC Zombie"
	species = SPECIES_IPC

/obj/effect/landmark/corpse/ipc_zombie/do_extra_customization(mob/living/carbon/human/M)
	var/obj/item/organ/internal/ipc_tag/tag = M.internal_organs_by_name[BP_IPCTAG]
	if(istype(tag))
		tag.serial_number = uppertext(dd_limittext(md5(M.real_name), 12))
		tag.ownership_info = IPC_OWNERSHIP_SELF
		tag.citizenship_info = CITIZENSHIP_COALITION
