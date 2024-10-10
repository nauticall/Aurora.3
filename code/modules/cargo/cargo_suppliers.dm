/singleton/cargo_supplier
	var/short_name = "generic_supplier" //Short name of the cargo supplier
	var/name = "Generic Supplies Ltd." //Long name of the cargo supplier
	var/description = "The generic company, for generic supplies." //Description of the supplier
	var/tag_line = "You're not supposed to see this." //Tag line of the supplier
	var/shuttle_time = 100 //Time the shuttle takes to get to the supplier
	var/shuttle_price = 100 //Price to call the shuttle
	var/available = 1 //If the supplier is available
	var/price_modifier = 1 //Price modifier for the supplier
	var/list/items = list() //List of items of the supplier

//Gets a list of supplier - to be json encoded
/singleton/cargo_supplier/proc/get_list()
	var/list/data = list()
	data["short_name"] = short_name
	data["name"] = name
	data["description"] = description
	data["tag_line"] = tag_line
	data["shuttle_time"] = shuttle_time
	data["shuttle_price"] = shuttle_price
	data["available"] = available
	data["price_modifier"] = price_modifier
	return data

/singleton/cargo_supplier/proc/get_total_price_coefficient()
	var/final_coef = price_modifier
	if(SSatlas.current_sector)
		if(short_name in SSatlas.current_sector.cargo_price_coef)
			final_coef = SSatlas.current_sector.cargo_price_coef[short_name] * price_modifier

	return final_coef

/singleton/cargo_supplier/generic_supplier

/singleton/cargo_supplier/arizi
	short_name = "arizi"
	name = "Arizi Guild"
	description = "An Unathi guild of craftsmen dedicated to making artisan products such as fine liquor."
	tag_line = "Arizi: The best of Moghes."

/singleton/cargo_supplier/bishop
	short_name = "bishop"
	name = "Bishop Cybernetics"
	description = "A robotics company that specializes in manufacturing high-end IPC chassis, mechanical organs, and prosthetics. A subsidiary of Zeng-Hu."
	tag_line = "Without compromise."

/singleton/cargo_supplier/blam
	short_name = "blam"
	name = "BLAM! Products"
	description = "A janitorial supplies company best known for their highly-effective and mostly-non-toxic 'space cleaner' formula, in wide usage throughout the Spur."
	tag_line = "Just say BLAM! And it's gone!"

/singleton/cargo_supplier/eckharts
	short_name = "eckharts"
	name = "Eckhart's Energy Solutions Limited"
	description = "A small Solarian energy company mostly concerned with the research and development of antimatter and antimatter power."
	tag_line = "The future is in the atom."

/singleton/cargo_supplier/einstein
	short_name = "einstein"
	name = "Einstein Engines"
	description = "A Solarian megacorporation that specializes in faster-than-light warp travel and robotics."
	tag_line = "Lead by our history, leading our future."

/singleton/cargo_supplier/getmore
	short_name = "getmore"
	name = "Getmore Products"
	description = "A food and beverage company that provides many snacks and drinks. A subsidiary of Nanotrasen."
	tag_line = "Get more with Getmore!"

/singleton/cargo_supplier/heph
	short_name = "heph"
	name = "Hephaestus Industries"
	description = "An industrial giant, Hephaestus Industries specializes in all things from mining, to robotics, to manufacturing everything under the stars."
	tag_line = "The anvil on which the world is shaped."

/singleton/cargo_supplier/iac
	short_name = "iac"
	name = "Interstellar Aid Corps"
	description = "A nonprofit humanitarian organization dedicated to providing aid to the needy, especially in the less-affluent areas of the galaxy."
	tag_line = "Making the Spur a better place."

/singleton/cargo_supplier/idris
	short_name = "idris"
	name = "Idris Incorporated"
	description = "A financial and service giant that operates the largest banking and finances network in the galaxy."
	tag_line = "Astronomical figures. Unlimited power."

/singleton/cargo_supplier/molinaris
	short_name = "molinaris"
	name = "Molinari's Animal Shipping Company"
	description = "A logistics courier specializing in delivering live animals across the galaxy. It's become well-known for being the only large carrier to deliver animals alive, well-fed, and not violently killed by blunt force trauma."
	tag_line = "We care about the little guys."

/singleton/cargo_supplier/nanotrasen
	short_name = "nanotrasen"
	name = "NanoTrasen Corporation"
	description = "NanoTrasen is a technology, energy and scientific behemoth. While they built their fortunes off of phoron and biotechnics, they also manufacture and sell plenty of consumer goods under their many subsidiaries."
	tag_line = "The leader in all things phoron!"

/singleton/cargo_supplier/orion
	short_name = "orion"
	name = "Orion Express"
	description = "A massive logistics and shipping company that operates as the logistics division of the Stellar Corporate Conglomerate's constitutent companies."
	tag_line = "Faster than light."

/singleton/cargo_supplier/virgo
	short_name = "virgo"
	name = "Virgo Freight Carriers"
	description = "A Xanan shipping company that operates across the Spur. It's carved a niche in small-volume, high-priority deliveries."
	tag_line = "Go quick, go Virgo."

/singleton/cargo_supplier/vysoka
	short_name = "vysoka"
	name = "Vysoka Farming Supplies Association"
	description = "A collective of farming vendors from Vysoka that provide high-quality agricultural products to farmers, gardeners and hydroponicists across the galaxy."
	tag_line = "All organic. All Vysokan."

/singleton/cargo_supplier/xion
	short_name = "xion"
	name = "Xion Manufacturing Group"
	description = "A robotics company primarily focused on building synthetics and prosthetics intended for durable, hard-labor tasks that focus on function above all else - looks be damned."
	tag_line = "Advancing the fields of robotics, one step at a time."

/singleton/cargo_supplier/zavodskoi
	short_name = "zavodskoi"
	name = "Zavodskoi Interstellar"
	description = "A massive weapons and aerospace manufacturing and development conglomerate that distributes everything from light to heavy arms, space vessel weapons, ship-building, aircraft, ground vehicles, combat spacesuits, and military software."
	tag_line = "Even one matters on the battlefield."

/singleton/cargo_supplier/zeng_hu
	short_name = "zeng_hu"
	name = "Zeng-Hu Pharmaceuticals"
	description = "A trans-stellar medical research and pharmaceutical conglomerate who has a hand in almost every form of medicine throughout the Orion Spur."
	tag_line = "Building a brighter future."

/singleton/cargo_supplier/zharkov
	short_name = "zharkov"
	name = "Zharkov Shipping Company"
	description = "One of the largest logistics companies native to Adhomai, Zharkov specializes in interstellar exports bringing Adhomian goods to alien worlds."
	tag_line = "All around Adhomai in a day or less."

/singleton/cargo_supplier/zora
	short_name = "zora"
	name = "Zo'ra Hive Logistics"
	description = "The logistics branch of the Zo'ra hive, one of the main Vaurca hive societies."
	tag_line = "The Unstoppable."

