//Simple borg hand.
//Limited use.
/obj/item/weapon/gripper
	name = "magnetic gripper"
	desc = "A simple grasping tool for synthetic assets."
	icon = 'icons/obj/device.dmi'
	icon_state = "gripper"

	//Has a list of items that it can hold.
	var/list/can_hold = list(
		/obj/item/weapon/cell,
		/obj/item/weapon/firealarm_electronics,
		/obj/item/weapon/airalarm_electronics,
		/obj/item/weapon/airlock_electronics,
		/obj/item/weapon/module/power_control,
		/obj/item/weapon/stock_parts,
		/obj/item/light_fixture_frame,
		/obj/item/apc_frame,
		/obj/item/alarm_frame,
		/obj/item/firealarm_frame,
		/obj/item/weapon/table_parts,
		/obj/item/weapon/table_parts/rack,
		/obj/item/weapon/camera_assembly,
		/obj/item/weapon/tank,
		/obj/item/weapon/circuitboard,
		/obj/item/weapon/smes_coil
		)

	var/obj/item/wrapped = null // Item currently being held.

// VEEEEERY limited version for mining borgs. Basically only for swapping cells and upgrading the drills.
/obj/item/weapon/gripper/miner
	can_hold = list(
	/obj/item/weapon/cell,
	/obj/item/weapon/stock_parts
	)

/obj/item/weapon/gripper/paperwork
	name = "paperwork gripper"
	desc = "A simple grasping tool for clerical work."
	icon = 'icons/obj/device.dmi'
	icon_state = "gripper"

	can_hold = list(
		/obj/item/weapon/clipboard,
		/obj/item/weapon/paper,
		/obj/item/weapon/paper_bundle,
		/obj/item/weapon/card/id
		)

/obj/item/weapon/gripper/attack_self(mob/user as mob)
	if(wrapped)
		return wrapped.attack_self(user)
	return ..()

/obj/item/weapon/gripper/verb/drop_item()

	set name = "Drop Item"
	set desc = "Release an item from your magnetic gripper."
	set category = "Robot Commands"

	if(!wrapped)
		//There's some weirdness with items being lost inside the arm. Trying to fix all cases. ~Z
		for(var/obj/item/thing in src.contents)
			thing.loc = get_turf(src)
		return

	if(wrapped.loc != src)
		wrapped = null
		return

	src.loc << "\red You drop \the [wrapped]."
	wrapped.loc = get_turf(src)
	wrapped = null
	//update_icon()

/obj/item/weapon/gripper/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	return (wrapped ? wrapped.attack(M,user) : 0)

/obj/item/weapon/gripper/afterattack(var/atom/target, var/mob/living/user, proximity, params)

	//There's some weirdness with items being lost inside the arm. Trying to fix all cases. ~Z
	if(!wrapped)
		for(var/obj/item/thing in src.contents)
			wrapped = thing
			break

	if(wrapped) //Already have an item.
		//Temporary put wrapped into user so target's attackby() checks pass.
		wrapped.loc = user

		//Pass the attack on to the target. This might delete/relocate wrapped.
		var/resolved = target.attackby(wrapped,user)
		if(!resolved && wrapped && target)
			wrapped.afterattack(target,user,1)

		//If wrapped was neither deleted nor put into target, put it back into the gripper.
		if(wrapped && user && (wrapped.loc == user))
			wrapped.loc = src
		else
			wrapped = null
			return

	else if(istype(target,/obj/item)) //Check that we're not pocketing a mob.

		//...and that the item is not in a container.
		if(!isturf(target.loc))
			return

		var/obj/item/I = target

		//Check if the item is blacklisted.
		var/grab = 0
		for(var/typepath in can_hold)
			if(istype(I,typepath))
				grab = 1
				break

		//We can grab the item, finally.
		if(grab)
			user << "You collect \the [I]."
			I.loc = src
			wrapped = I
			return
		else
			user << "\red Your gripper cannot hold \the [target]."

	else if(istype(target,/obj/machinery/power/apc))
		var/obj/machinery/power/apc/A = target
		if(A.opened)
			if(A.cell)

				wrapped = A.cell

				A.cell.add_fingerprint(user)
				A.cell.updateicon()
				A.cell.loc = src
				A.cell = null

				A.charging = 0
				A.update_icon()

				user.visible_message("\red [user] removes the power cell from [A]!", "You remove the power cell.")

//TODO: Matter decompiler.
/obj/item/weapon/matter_decompiler

	name = "matter decompiler"
	desc = "Eating trash, bits of glass, or other debris will replenish your stores."
	icon = 'icons/obj/device.dmi'
	icon_state = "decompiler"

	//Metal, glass, wood, plastic.
	var/datum/matter_synth/metal = null
	var/datum/matter_synth/glass = null
	var/datum/matter_synth/wood = null
	var/datum/matter_synth/plastic = null

/obj/item/weapon/matter_decompiler/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	return

/obj/item/weapon/matter_decompiler/afterattack(atom/target as mob|obj|turf|area, mob/living/user as mob|obj, proximity, params)

	if(!proximity) return //Not adjacent.

	//We only want to deal with using this on turfs. Specific items aren't important.
	var/turf/T = get_turf(target)
	if(!istype(T))
		return

	//Used to give the right message.
	var/grabbed_something = 0

	for(var/mob/M in T)
		if(istype(M,/mob/living/simple_animal/lizard) || istype(M,/mob/living/simple_animal/mouse))
			src.loc.visible_message("\red [src.loc] sucks [M] into its decompiler. There's a horrible crunching noise.","\red It's a bit of a struggle, but you manage to suck [M] into your decompiler. It makes a series of visceral crunching noises.")
			new/obj/effect/decal/cleanable/blood/splatter(get_turf(src))
			del(M)
			if(wood)
				wood.add_charge(2000)
			if(plastic)
				plastic.add_charge(2000)
			return

		else if(istype(M,/mob/living/silicon/robot/drone) && !M.client)

			var/mob/living/silicon/robot/D = src.loc

			if(!istype(D))
				return

			D << "<span class='danger'>You begin decompiling [M].</span>"

			if(!do_after(D,50))
				D << "<span class='danger'>You need to remain still while decompiling such a large object.</span>"
				return

			if(!M || !D) return

			D << "<span class='danger'>You carefully and thoroughly decompile [M], storing as much of its resources as you can within yourself.</span>"
			del(M)
			new/obj/effect/decal/cleanable/blood/oil(get_turf(src))

			if(metal)
				metal.add_charge(15000)
			if(glass)
				glass.add_charge(15000)
			if(wood)
				wood.add_charge(2000)
			if(plastic)
				plastic.add_charge(1000)
			return
		else
			continue

	for(var/obj/W in T)
		//Different classes of items give different commodities.
		if(istype(W,/obj/item/weapon/cigbutt))
			if(plastic)
				plastic.add_charge(500)
		else if(istype(W,/obj/effect/spider/spiderling))
			if(wood)
				wood.add_charge(2000)
			if(plastic)
				plastic.add_charge(2000)
		else if(istype(W,/obj/item/weapon/light))
			var/obj/item/weapon/light/L = W
			if(L.status >= 2) //In before someone changes the inexplicably local defines. ~ Z
				if(metal)
					metal.add_charge(250)
				if(glass)
					glass.add_charge(250)
			else
				continue
		else if(istype(W,/obj/effect/decal/remains/robot))
			if(metal)
				metal.add_charge(2000)
			if(plastic)
				plastic.add_charge(2000)
			if(glass)
				glass.add_charge(1000)
		else if(istype(W,/obj/item/trash))
			if(metal)
				metal.add_charge(1000)
			if(plastic)
				plastic.add_charge(3000)
		else if(istype(W,/obj/effect/decal/cleanable/blood/gibs/robot))
			if(metal)
				metal.add_charge(2000)
			if(glass)
				glass.add_charge(2000)
		else if(istype(W,/obj/item/ammo_casing))
			if(metal)
				metal.add_charge(1000)
		else if(istype(W,/obj/item/weapon/shard/shrapnel))
			if(metal)
				metal.add_charge(1000)
		else if(istype(W,/obj/item/weapon/shard))
			if(glass)
				glass.add_charge(1000)
		else if(istype(W,/obj/item/weapon/reagent_containers/food/snacks/grown))
			if(wood)
				wood.add_charge(4000)
		else if(istype(W,/obj/item/pipe))
			// This allows drones and engiborgs to clear pipe assemblies from floors.
		else
			continue

		del(W)
		grabbed_something = 1

	if(grabbed_something)
		user << "\blue You deploy your decompiler and clear out the contents of \the [T]."
	else
		user << "\red Nothing on \the [T] is useful to you."
	return

//PRETTIER TOOL LIST.
/mob/living/silicon/robot/drone/installed_modules()

	if(weapon_lock)
		src << "\red Weapon lock active, unable to use modules! Count:[weaponlock_time]"
		return

	if(!module)
		module = new /obj/item/weapon/robot_module/drone(src)

	var/dat = "<HEAD><TITLE>Drone modules</TITLE></HEAD><BODY>\n"
	dat += {"
	<B>Activated Modules</B>
	<BR>
	Module 1: [module_state_1 ? "<A HREF=?src=\ref[src];mod=\ref[module_state_1]>[module_state_1]<A>" : "No Module"]<BR>
	Module 2: [module_state_2 ? "<A HREF=?src=\ref[src];mod=\ref[module_state_2]>[module_state_2]<A>" : "No Module"]<BR>
	Module 3: [module_state_3 ? "<A HREF=?src=\ref[src];mod=\ref[module_state_3]>[module_state_3]<A>" : "No Module"]<BR>
	<BR>
	<B>Installed Modules</B><BR><BR>"}


	var/tools = "<B>Tools and devices</B><BR>"
	var/resources = "<BR><B>Resources</B><BR>"

	for (var/O in module.modules)

		var/module_string = ""

		if (!O)
			module_string += text("<B>Resource depleted</B><BR>")
		else if(activated(O))
			module_string += text("[O]: <B>Activated</B><BR>")
		else
			module_string += text("[O]: <A HREF=?src=\ref[src];act=\ref[O]>Activate</A><BR>")

		if((istype(O,/obj/item/weapon) || istype(O,/obj/item/device)) && !(istype(O,/obj/item/stack/cable_coil)))
			tools += module_string
		else
			resources += module_string

	dat += tools

	if (emagged)
		if (!module.emag)
			dat += text("<B>Resource depleted</B><BR>")
		else if(activated(module.emag))
			dat += text("[module.emag]: <B>Activated</B><BR>")
		else
			dat += text("[module.emag]: <A HREF=?src=\ref[src];act=\ref[module.emag]>Activate</A><BR>")

	dat += resources

	src << browse(dat, "window=robotmod")
