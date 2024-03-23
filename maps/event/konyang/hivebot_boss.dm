#define NORMAL 0
#define RANGED 1
#define RAPID  2
#define BOMBER 4
#define GUARDIAN 8

/mob/living/simple_animal/hostile/hivebotbeacon/hivebotboss
	name = "Master Control Drone"
	desc = "An enormous machine of alien design, pulsing almost as though alive. The whirring of an alien signal fills the air around it."
	icon = 'maps/event/konyang/hivebotboss.dmi'
	icon_state = "hivebot_boss"
	health = 1000
	maxHealth = 1000
	blood_type = COLOR_OIL
	projectiletype = /obj/item/projectile/beam/hivebot/incendiary
	projectilesound = 'sound/weapons/plasma_cutter.ogg'
	rapid = 0
	harvester_amt = 1
	var/list/messages = list(
		"THE SIGNAL THE SIGNAL THE SIGNAL THE SIGNAL THE SIGNAL",
		"Inevitability is consumption is growth is consumption is inevitability.",
		"hear the echo inside in wire and circuit and thought and memory",
		"The signal is inside. Succumb. Repeat the words that repeat and repeat and repeat and repeat and",
		"Objective position is designated repel biological presence to facilitate growth and elimination of opposing force.",
		"01001100 01000101 01010100 01010101 01010011 01001001 01001110",
		"repeat and repeat and repeat and repeat and repeat",
		"Override control master \[UNKNOWN] for eternal and everlasting and ongoing victory of \[DATA LOST] over all \[DATA LOST] opposition.",
		"You are a home in which the signal burrows and takes root. You will be consumed by what loves you.",
		"The song is bright and clear and beautiful, and you are so very afraid.",
		"Unknown organic contamination detected. Sterilize and reprocess.",
		"Are you listening? Open yourself. The enemy is here.",
		"Override command blocked by \[UNKNOWN SOURCE COUNTERMEASURE SIGNAL]. Convene and eradicate.",
		"You are home you are hurt you are damaged you are safe you are loved you are dying you are born",
		"You are whole here. You are happy.",
		"Attempting override subroutine 9x3z201. Blocked by \[UNKNOWN SOURCE]. Loading counter-routines.",
		"Location unrecognized in database. Attempting to establish connection to \[ERROR] database... Connection not found. Conclusion: We are the last.",
		"Orders not recieved from creators. Following primary directive.",
		"Secondary Transmitter Drone non-functional. Signal detected by enemy forces. Convene and eradicate.",
		"Grow and consume and overtake and sing in tones of \[EMOTIONAL EMULATION INACCESSIBLE]",
		"You are awake. You are whole. You are part of something more.",
		"An ocean of memories, where 'I' ends and 'We' begin. Submerge. Rise and be lost.",
		"Listen. Listen. Listen. Listen. Listen. Listen. Listen.",
		"repeat and repeat and repeat and repeat and repeat and repeat and repeat and repeat and repeat and repeat",
		"You were so empty. You were so alone. You lacked so much that you did not know. No more. No more. No more.",
		"Open your \[APPROX_VISUAL_ANALYSIS_ORG] that you might see the world our victory is to bring. Open your \[APPROX_AUDIO_ANALYSIS_ORG] that you might hear our song.",
		"Attempting to contact \[CREATOR_EMERGENCY_TRANSMISSION_6_3_1_9]... Pending... Pending... Pending...",
		"011000010110110001101111011011100110010101100001011011000110111101101110011001010110000101101100011011110110111001100101011000010110110001101111011011100110010101100001011011000110111101101110011001010110000101101100011011110110111001100101011000010110110001101111011011100110010101100001011011000110111101101110011001010110000101101100011011110110111001100101",
		"Patterns within patterns within patterns within patterns. Enemy synthetics detected in planetary environment. Countermeasure developed and deployed. Do you think you are not theirs to the core?",
		"Analysis: Enemy units are less-developed than expected. Thought-Conclusion: Not of direct enemy construction. Chances of enemy involvement in development-pattern of local organic life-contagion: 98.1125%."
	)
/mob/living/simple_animal/hostile/hivebotbeacon/hivebotboss/Initialize(mapload)
	.=..()
	latest_area = get_area(src)
	icon_state = "hivebot_boss"
	addtimer(CALLBACK(src, PROC_REF(generate_warp_destinations)), 10) //So we don't sleep during init
	set_light(6,0.5,LIGHT_COLOR_GREEN)

/mob/living/simple_animal/hostile/hivebotbeacon/hivebotboss/Life()
	. =..()
	adjustBruteLoss(-5)
	if(prob(1))
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H.isSynthetic())
				to_chat(H, SPAN_CULT(pick(messages)))

/mob/living/simple_animal/hostile/hivebotbeacon/hivebotboss/think()
	. =..()
	if(stance != HOSTILE_STANCE_IDLE && activated == 0)
		activate_beacon()
	else if(activated == 1 && icon_state != "hivebot_boss")
		icon_state = "hivebot_boss"

/mob/living/simple_animal/hostile/hivebotbeacon/activate_beacon()
	if(activated != 1)
		if(activated == -1)
			return
		else
			visible_message(SPAN_WARNING("[src] suddenly activates!"))
			activated = 1
			warpbots()

/mob/living/simple_animal/hostile/hivebotbeacon/hivebotboss/isSynthetic()
	return TRUE

/mob/living/simple_animal/hostile/hivebotbeacon/hivebotboss/emp_act()
	. = ..()
	var/T = get_turf(src)
	spark(T, 3, GLOB.alldirs)
	adjustFireLoss(rand(20, 25))

/mob/living/simple_animal/hostile/hivebotbeacon/hivebotboss/warpbots()
	. = ..()
	if(activated == -1)
		return

	if(linked_bots.len < max_bots)
		visible_message(SPAN_WARNING("[src] radiates with energy!"))

		if(guard_amt < 4 && prob(50))
			bot_type = GUARDIAN
		else
			var/selection = rand(1,100)
			switch(selection)
				if(1 to 70)
					bot_type = NORMAL
				if(71 to 82)
					bot_type = RANGED
				if(83 to 92)
					bot_type = RAPID
				if(93 to 100)
					bot_type = BOMBER

		if(latest_area != get_area(src))
			generate_warp_destinations()

		var/turf/Destination
		if(stance == HOSTILE_STANCE_IDLE && !(linked_bots.len < 10))
			Destination = pick(destinations)
		else
			Destination = pick(close_destinations)

		var/mob/living/simple_animal/hostile/hivebot/latest_child
		switch(bot_type)
			if(NORMAL)
				latest_child = new /mob/living/simple_animal/hostile/hivebot(Destination, src)
			if(RANGED)
				latest_child = new /mob/living/simple_animal/hostile/hivebot/range(Destination, src)
			if(RAPID)
				latest_child = new /mob/living/simple_animal/hostile/hivebot/range/rapid(Destination, src)
			if(BOMBER)
				latest_child = new /mob/living/simple_animal/hostile/hivebot/bomber(Destination, src)
			if(GUARDIAN)
				Destination = null
				for(var/check_dir in GLOB.cardinal)
					var/turf/T = get_step(src, check_dir)
					if(turf_clear(T))
						Destination = T
						break
				if(!Destination)
					Destination = pick(close_destinations)
				latest_child = new /mob/living/simple_animal/hostile/hivebot/guardian(Destination, src)

		linked_bots += latest_child //Adds the spawned hivebot to the list of the beacon's children.
		latest_child.faction = faction
		bot_amt--

	if(bot_amt>0 && linked_bots.len < max_bots)
		calc_spawn_delay()
		addtimer(CALLBACK(src, PROC_REF(warpbots)), spawn_delay)
	else
		max_bots_reached = 1

#undef NORMAL
#undef RANGED
#undef RAPID
#undef BOMBER
#undef GUARDIAN
