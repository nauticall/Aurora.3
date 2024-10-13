/singleton/cargo_item/medicalaidset
	category = "medical"
	name = "medical aid set"
	supplier = "iac"
	description = "A set of medical first aid kits."
	price = 2000
	items = list(
		/obj/item/storage/firstaid/regular,
		/obj/item/storage/firstaid/fire,
		/obj/item/storage/firstaid/toxin,
		/obj/item/storage/firstaid/o2,
		/obj/item/storage/firstaid/adv
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/firstaidkit
	category = "medical"
	name = "first-aid kit"
	supplier = "nanotrasen"
	description = "It's an emergency medical kit for those serious boo-boos."
	price = 150
	items = list(
		/obj/item/storage/firstaid/regular
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/advancedfirstaidkit
	category = "medical"
	name = "advanced first-aid kit"
	supplier = "nanotrasen"
	description = "Contains advanced medical treatments."
	price = 500
	items = list(
		/obj/item/storage/firstaid/adv
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/firefirstaidkit
	category = "medical"
	name = "fire first-aid kit"
	supplier = "nanotrasen"
	description = "It's an emergency medical kit for when the toxins lab <i>-spontaneously-</i> burns down."
	price = 450
	items = list(
		/obj/item/storage/firstaid/fire
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/oxygendeprivationfirstaid
	category = "medical"
	name = "oxygen deprivation first aid"
	supplier = "nanotrasen"
	description = "A box full of oxygen goodies."
	price = 450
	items = list(
		/obj/item/storage/firstaid/o2
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/toxinfirstaid
	category = "medical"
	name = "toxin first aid"
	supplier = "nanotrasen"
	description = "Used to treat when you have a high amount of toxins in your body."
	price = 250
	items = list(
		/obj/item/storage/firstaid/toxin
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/bloodpack_ominus
	category = "medical"
	name = "O- blood pack (x1)"
	supplier = "zeng_hu"
	description = "A blood pack filled with O- Blood."
	price = 300
	items = list(
		/obj/item/reagent_containers/blood/OMinus
	)
	access = ACCESS_MEDICAL
	container_type = "freezer"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/bloodpack_sbs
	category = "medical"
	name = "SBS blood pack (x1)"
	supplier = "zeng_hu"
	description = "A blood pack filled with Synthetic Blood Substitute. WARNING: Not compatible with organic blood!"
	price = 270
	items = list(
		/obj/item/reagent_containers/blood/sbs
	)
	access = ACCESS_MEDICAL
	container_type = "freezer"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/bloodpacksbags
	category = "medical"
	name = "empty IV bags"
	supplier = "nanotrasen"
	description = "This box contains empty IV bags."
	price = 85
	items = list(
		/obj/item/storage/box/bloodpacks
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/butazoline_autoinjector
	category = "medical"
	name = "butazoline autoinjector"
	supplier = "nanotrasen"
	description = "An autoinjector designed to treat severe physical trauma."
	price = 150
	items = list(
		/obj/item/reagent_containers/hypospray/autoinjector/trauma
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/dermaline_autoinjector
	category = "medical"
	name = "dermaline autoinjector"
	supplier = "nanotrasen"
	description = "An autoinjector designed to treat severe burns."
	price = 150
	items = list(
		/obj/item/reagent_containers/hypospray/autoinjector/burn
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/dexplus_autoinjector
	category = "medical"
	name = "dexalin plus autoinjector"
	supplier = "nanotrasen"
	description = "An autoinjector designed to treat oxygen deprivation."
	price = 350
	items = list(
		/obj/item/reagent_containers/hypospray/autoinjector/oxygen
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/peridaxonautoinjector
	category = "medical"
	name = "peridaxon autoinjector"
	supplier = "nanotrasen"
	description = "An autoinjector designed to treat minor organ damage."
	price = 800
	items = list(
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/bodybags
	category = "medical"
	name = "body bags"
	supplier = "nanotrasen"
	description = "This box contains body bags."
	price = 255
	items = list(
		/obj/item/storage/box/bodybags
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/injectors_box
	category = "medical"
	name = "box of empty autoinjectors"
	supplier = "nanotrasen"
	description = "Contains empty autoinjectors."
	price = 500
	items = list(
		/obj/item/storage/box/autoinjectors
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/sterilegloves_box
	category = "medical"
	name = "box of sterile gloves"
	supplier = "zeng_hu"
	description = "Contains sterile gloves."
	price = 98
	items = list(
		/obj/item/storage/box/gloves
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/sterilemasks_box
	category = "medical"
	name = "box of sterile masks"
	supplier = "zeng_hu"
	description = "This box contains masks of sterility."
	price = 98
	items = list(
		/obj/item/storage/box/masks
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/syringes_box
	category = "medical"
	name = "box of syringes"
	supplier = "nanotrasen"
	description = "A box full of syringes."
	price = 200
	items = list(
		/obj/item/storage/box/syringes
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/dylovenebottle
	category = "medical"
	name = "dylovene bottle"
	supplier = "nanotrasen"
	description = "A small bottle of dylovene. Counters poisons, and repairs damage. A wonder drug."
	price = 20
	items = list(
		/obj/item/reagent_containers/glass/bottle/antitoxin
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/hyronalinbottle
	category = "medical"
	name = "hyronalin bottle"
	supplier = "nanotrasen"
	description = "A small bottle. Contains hyronalin - used to treat radiation poisoning."
	price = 1000
	items = list(
		/obj/item/reagent_containers/glass/bottle/hyronalin
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/inaprovalinebottle
	category = "medical"
	name = "inaprovaline bottle"
	supplier = "nanotrasen"
	description = "A small bottle. Contains inaprovaline - used to stabilize patients."
	price = 25
	items = list(
		/obj/item/reagent_containers/glass/bottle/inaprovaline
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/soporificbottle
	category = "medical"
	name = "soporific bottle"
	supplier = "nanotrasen"
	description = "A small bottle of soporific. Just the fumes make you sleepy."
	price = 55
	items = list(
		/obj/item/reagent_containers/glass/bottle/stoxin
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/medicalbelt
	category = "medical"
	name = "medical belt"
	supplier = "nanotrasen"
	description = "Can hold various medical equipment."
	price = 75
	items = list(
		/obj/item/storage/belt/medical
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/medicalmask
	category = "medical"
	name = "medical mask"
	supplier = "nanotrasen"
	description = "A close-fitting sterile mask that can be connected to an air supply."
	price = 105
	items = list(
		/obj/item/clothing/mask/breath/medical
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/surgicalcap
	category = "medical"
	name = "surgical cap"
	supplier = "nanotrasen"
	description = "A cap surgeons wear during operations. Keeps their hair from tickling your internal organs."
	price = 200
	items = list(
		/obj/item/clothing/head/surgery
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/medicalscrubs
	category = "medical"
	name = "medical scrubs"
	supplier = "nanotrasen"
	description = "It's made of a special fiber that provides minor protection against biohazards."
	price = 200
	items = list(
		/obj/item/clothing/under/rank/medical/surgeon
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/medicalgown
	category = "medical"
	name = "medical gown"
	supplier = "nanotrasen"
	description = "A loose-fitting gown for medical patients."
	price = 60
	items = list(
		/obj/item/clothing/under/medical_gown
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/medicalvoidsuit
	category = "medical"
	name = "medical voidsuit"
	supplier = "nanotrasen"
	description = "A special suit that protects against hazardous, low pressure environments. Has minor radiation shielding."
	price = 4200
	items = list(
		/obj/item/clothing/suit/space/void/medical
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/medicalvoidsuithelmet
	category = "medical"
	name = "medical voidsuit helmet"
	supplier = "nanotrasen"
	description = "A special helmet designed for work in a hazardous, low pressure environment. Has minor radiation shielding."
	price = 2850
	items = list(
		/obj/item/clothing/head/helmet/space/void/medical
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/nanopaste
	category = "medical"
	name = "nanopaste"
	supplier = "zeng_hu"
	description = "A tube of paste containing swarms of repair nanites. Very effective in repairing robotic machinery."
	price = 2000
	items = list(
		/obj/item/stack/nanopaste
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/pillbottles
	category = "medical"
	name = "pill bottles"
	supplier = "nanotrasen"
	description = "A storage box containing pill bottles."
	price = 155
	items = list(
		/obj/item/storage/pill_bottle
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/stasisbag
	category = "medical"
	name = "stasis bag"
	supplier = "zeng_hu"
	description = "A folded, non-reusable bag designed to keep patients in stasis for transport."
	price = 900
	items = list(
		/obj/item/bodybag/cryobag
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/stabilizer_harness
	category = "medical"
	name = "stabilizer harness"
	supplier = "nanotrasen"
	description = "A specialized medical harness that gives regular compressions to the patient's ribcage for cases of urgent heart issues, and functions as an emergency artificial respirator for cases of urgent lung issues."
	price = 300
	items = list(
		/obj/item/auto_cpr
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

//Surgery stuff

/singleton/cargo_item/surgerykit
	category = "medical"
	name = "surgery kit"
	supplier = "zeng_hu"
	description = "A kit containing surgical tools, either for resupply or for use on-the-go."
	price = 2000
	items = list(
		/obj/item/storage/firstaid/surgery
	)
	access = ACCESS_SURGERY
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/anesthetictank
	category = "medical"
	name = "anesthetic tank"
	supplier = "nanotrasen"
	description = "A tank with an N2O/O2 gas mix."
	price = 200
	items = list(
		/obj/item/tank/anesthetic
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/scalpel
	category = "medical"
	name = "scalpel"
	supplier = "zeng_hu"
	description = "Cut, cut, and once more cut."
	price = 100
	items = list(
		/obj/item/surgery/scalpel
	)
	access = ACCESS_SURGERY
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/retractor
	category = "medical"
	name = "retractor"
	supplier = "zeng_hu"
	description = "Retracts stuff."
	price = 115
	items = list(
		/obj/item/surgery/retractor
	)
	access = ACCESS_SURGERY
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/hemostat
	category = "medical"
	name = "hemostat"
	supplier = "zeng_hu"
	description = "You think you have seen this before."
	price = 135
	items = list(
		/obj/item/surgery/hemostat
	)
	access = ACCESS_SURGERY
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/circularsaw
	category = "medical"
	name = "circular saw"
	supplier = "zeng_hu"
	description = "For heavy duty cutting."
	price = 195
	items = list(
		/obj/item/surgery/circular_saw
	)
	access = ACCESS_SURGERY
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/fix_o_vein
	category = "medical"
	name = "vascular recoupler"
	supplier = "zeng_hu"
	description = "An advanced automatic surgical instrument that operates with extreme finesse."
	price = 495
	items = list(
		/obj/item/surgery/fix_o_vein
	)
	access = ACCESS_SURGERY
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/cautery
	category = "medical"
	name = "cautery"
	supplier = "zeng_hu"
	description = "This stops bleeding."
	price = 165
	items = list(
		/obj/item/surgery/cautery
	)
	access = ACCESS_SURGERY
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/surgicaldrill
	category = "medical"
	name = "surgical drill"
	supplier = "zeng_hu"
	description = "You can drill using this item. You dig?"
	price = 195
	items = list(
		/obj/item/surgery/surgicaldrill
	)
	access = ACCESS_SURGERY
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/bonegel
	category = "medical"
	name = "bone gel"
	supplier = "zeng_hu"
	description = "A bottle-and-nozzle applicator containing a specialized gel. When applied to bone tissue, it can reinforce and repair breakages and act as a glue to keep bones in place while they heal."
	price = 495
	items = list(
		/obj/item/surgery/bone_gel
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/bonesetter
	category = "medical"
	name = "bone setter"
	supplier = "zeng_hu"
	description = "Sets bones into place."
	price = 225
	items = list(
		/obj/item/surgery/bonesetter
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/tajaranlatexgloves
	category = "medical"
	name = "tajaran latex gloves"
	supplier = "zharkov"
	description = "Sterile latex gloves. Designed for Tajara use."
	price = 8
	items = list(
		/obj/item/clothing/gloves/latex/tajara
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/therapydoll
	category = "medical"
	name = "therapy doll"
	supplier = "virgo"
	description = "A toy for therapeutic and recreational purposes."
	price = 200
	items = list(
		/obj/item/toy/plushie/therapy
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/unathilatexgloves
	category = "medical"
	name = "unathi latex gloves"
	supplier = "arizi"
	description = "Sterile latex gloves. Designed for Unathi use."
	price = 8
	items = list(
		/obj/item/clothing/gloves/latex/unathi
	)
	access = ACCESS_MEDICAL
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

