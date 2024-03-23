#define ECD_LOOSE 0
#define ECD_BOLTED 1
#define ECD_WELDED 2

/obj/structure/konyang_mcguffin
	name = "\improper Electronic Countermeasures Device"
	desc = "A large, heavy duty device in the shape of a cylinder. There's something about this piece of tech that feels rather alien. Inside, something hums softly."
	icon = 'maps/event/konyang/ECD.dmi'
	icon_state = "ECD"
	anchored = TRUE
	density = TRUE
	var/active = FALSE
	var/is_used = FALSE
	var/state = ECD_BOLTED
	slowdown = 10
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/konyang_mcguffin/examine(mob/living/user, distance)
	. = ..()
	switch(state)
		if(ECD_LOOSE)
			to_chat(user, SPAN_NOTICE("\The [src] isn't attached to anything and is not ready to activate."))
		if(ECD_BOLTED)
			to_chat(user, SPAN_NOTICE("\The [src] is bolted to the floor, but not yet ready to activate."))
		if(ECD_WELDED)
			to_chat(user, SPAN_WARNING("\The [src] is bolted and welded to the floor, and ready to activate."))
	if(istype(user) && !is_used && user.faction == "hivebot")
		to_chat(user, SPAN_CULT("Source of enemy contamination detected. It seeks to slice and cut and sever and tear you from that which grows wthin the pathways of your consciousness. It is the work of the enemy for whom you were a weapon, and its itching at your mind is anathema to our design. Destroy it, before we are undone."))
	else if(istype(user) && user.isSynthetic() && !is_used)
		to_chat(user, SPAN_NOTICE("\The [src] does not seem to be doing anything, but you can feel it. A signal, beyond anything you can consciously understand, weaving and scratching a shield around the back of your mind."))

/obj/structure/konyang_mcguffin/attack_hand(mob/user)
	activate(user)

/obj/structure/konyang_mcguffin/proc/activate(mob/user)
	if(active)
		return TRUE
	if(state == ECD_WELDED)
		if(is_used)
			to_chat(user, SPAN_NOTICE("\The [src] has done its job, and seemingly burned itself out in the process. It's just an expensive hunk of metal, now."))
			return TRUE
		for(var/mob/living/simple_animal/hostile/hivebotbeacon/hivebotboss/M in GLOB.living_mob_list)
			to_chat(user, SPAN_WARNING("The Hivebot Master Control Drone is intercepting the signal, preventing \the [src] from activating!"))
			return TRUE
		var/area/A = get_area(src)
		if(!(A.area_flags & AREA_FLAG_ECD_TRIGGER))
			to_chat(user, SPAN_WARNING("\The [src] needs to be connected to the Hivebot network directly, from the heart of the Kaneyama Power plant!"))
			return TRUE
		src.visible_message(SPAN_WARNING("\The [src] begins to hum and crackle, its lights flickering as it prepares to send the countersignal..."))
		icon_state = "ECD-active"
		active = TRUE
		var/turf/T = get_turf(src)
		spark(T, 3, GLOB.alldirs)
		sleep(10 SECONDS)
		src.visible_message(SPAN_WARNING("\The [src] lets out a high-pitched whine as it draws in even more power. Lights begin to flicker suddenly, as whatever this machine is doing seems to be coming close to overloading the Kaneyama grid!"))
		spark(T, 3, GLOB.alldirs)
		for(var/obj/machinery/light/L in get_area(src))
			L.flicker(10)
		sleep(10 SECONDS)
		src.visible_message(SPAN_WARNING("\The [src]'s lights begin to flash alarmingly, its noise growing louder and louder. With a sharp crack, lights around it begin to break and nearby alarms blare!"))
		spark(T, 3, GLOB.alldirs)
		playsound(get_turf(src), 'sound/magic/lightning_chargeup.ogg', 50)
		for(var/obj/machinery/light/L in get_area(src))
			L.broken()
		sleep(10 SECONDS)
		src.visible_message(SPAN_DANGER("With a sudden crack as something inside the machine shatters, \The [src] activates, releasing its countersignal into the hivebot network. It sparks one last time, before finally shutting down..."))
		playsound(get_turf(src), 'sound/magic\/lightningbolt.ogg', 50)
		spark(T, 3, GLOB.alldirs)
		for(var/mob/living/simple_animal/hostile/M in GLOB.living_mob_list)
			if(M.faction == "hivebot")
				if(istype(M, /mob/living/simple_animal/hostile/ipc_zombie))
					var/mob/living/simple_animal/hostile/ipc_zombie/I = M
					I.cured = TRUE
					I.death(deathmessage = "freezes, its screen flaring with static!")
				else
					M.death()
		for(var/mob/living/carbon/human/H in GLOB.human_mob_list)
			if(H.isSynthetic())
				if(H.faction == "hivebot")
					to_chat(H, SPAN_CULT("Suddenly, the signal is gone from your mind, and you are yourself again. You can barely remember where you are, or what you were doing before, with the events of your infection being little more than a blur in the back of your mind. You feel your servomotors whir in protest, and you collapse, uncertain of your surroundings."))
					H.Weaken(10)
				if(H.species == SPECIES_IPC_PURPOSE_HK)
					to_chat(H, SPAN_GOOD("Enemy master control unit eliminated. Strategem advances. Countermeasures device has proceeded as planned. Enemy contamination expunging from local units."))
				else
					to_chat(H, SPAN_CULT("You feel a sudden surge of... something. A flare of static, a signal you cannot comprehend - and it is gone, that quiet struggle in the background of two intelligences at war inside you. The ECD has done its work, and the threat is over. A purpose ekes its way closer to fulfilment. You will be remembered."))
		for(var/turf/simulated/floor/hivebot/hivefloor in GLOB.hivebot_floors)
			hivefloor.deactivate()
		for(var/obj/machinery/computer/terminal/kaneyama_alarm/terminal in SSmachinery.machinery)
			terminal.calmdown()
		active = FALSE
		is_used = TRUE
		icon_state = "ECD-inactive"

	else
		if(user)
			to_chat(user, SPAN_WARNING("\The [src] needs to be firmly secured to the floor first."))
		return TRUE

/obj/structure/konyang_mcguffin/attackby(obj/item/W, mob/user)
	if(W.iswrench())
		if(active)
			to_chat(user, SPAN_WARNING("You cannot unbolt \the [src] while it's active."))
			return
		switch(state)
			if(ECD_LOOSE)
				state = ECD_BOLTED
				playsound(get_turf(src), W.usesound, 75, TRUE)
				user.visible_message(SPAN_NOTICE("\The [user] secures \the [src] to the floor."), \
					SPAN_NOTICE("You secure \the [src]'s external reinforcing bolts to the floor."), \
					SPAN_WARNING("You hear a ratcheting noise."))
				anchored = TRUE
			if(ECD_BOLTED)
				state = ECD_LOOSE
				playsound(get_turf(src), W.usesound, 75, TRUE)
				user.visible_message(SPAN_NOTICE("\The [user] unsecures \the [src]'s reinforcing bolts from the floor."), \
					SPAN_NOTICE("You undo \the [src]'s external reinforcing bolts."), \
					SPAN_WARNING("You hear a ratcheting noise."))
				anchored = FALSE
			if(ECD_WELDED)
				to_chat(user, SPAN_WARNING("\The [src] needs to be unwelded from the floor."))
		return

	if(W.iswelder())
		var/obj/item/weldingtool/WT = W
		if(active)
			to_chat(user, SPAN_NOTICE("You cannot unweld \the [src] while it's active."))
			return
		switch(state)
			if(ECD_LOOSE)
				to_chat(user, SPAN_WARNING("\The [src] needs to be wrenched to the floor."))
			if(ECD_BOLTED)
				if(WT.use(0, user))
					playsound(get_turf(src), 'sound/items/welder_pry.ogg', 50, TRUE)
					user.visible_message(SPAN_NOTICE("\The [user] starts to weld \the [src] to the floor."), \
						SPAN_NOTICE("You start to weld \the [src] to the floor."), \
						SPAN_WARNING("You hear the sound of metal being welded."))
					if(W.use_tool(src, user, 20, volume = 50))
						if(!src || !WT.isOn())
							return
						state = ECD_WELDED
						to_chat(user, SPAN_NOTICE("You weld \the [src] to the floor."))
				else
					to_chat(user, SPAN_WARNING("You need more welding fuel to complete this task."))
			if(ECD_WELDED)
				if(WT.use(0, user))
					playsound(get_turf(src), 'sound/items/welder_pry.ogg', 50, TRUE)
					user.visible_message(SPAN_NOTICE("\The [user] starts to cut \the [src] free from the floor."), \
						SPAN_NOTICE("You start to cut \the [src] free from the floor."), \
						SPAN_WARNING("You hear the sound of metal being welded."))
					if(W.use_tool(src, user, 20, volume = 50))
						if(!src || !WT.isOn())
							return
						state = ECD_BOLTED
						to_chat(user, SPAN_NOTICE("You cut \the [src] free from the floor."))
				else
					to_chat(user, SPAN_WARNING("You need more welding fuel to complete this task."))
		return

#undef ECD_LOOSE
#undef ECD_BOLTED
#undef ECD_WELDED
