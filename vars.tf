### Default Configuration ###

variable "mysql_password" {
    default = "password"
    description = "Password for MySQL Connection."
}

variable "mysql_root_password" {
    default = "password"
    description = "Password for root."
}

variable "mysql_database" {
    default = "dspdb"
    description = "Name of MySQL database."
}

variable "mysql_login" {
  default = "darkstar"
}


variable "ffxi_servername" {
  default = "Hades"
  description = "FFXI Server name to create."
}

variable "ffxi_zoneip" {
    default = "192.168.7.133"
    description = "IP of host system."
}

### Default Configuration ###

### map_darkstar Server Configuration ###

variable "skillup_chance_multiplier" {
    default = 5.5
    description = "Allows you to manipulate the constant multiplier in the skill-up rate formulas, having a potent effect on skill-up rates."
}

variable "craft_chance_multiplier" {
    default = 2.6
}

variable "player_hp_multiplier" {
    default = 1.0
}

variable "player_mp_multiplier" {
    default = 2.0
}

variable "max_merit_points" {
    default = 60
}

### map_darkstar Server Configuration ###

### settings.lua Server Configuration ###

variable "enable_cop" {
    default="1;"
}

variable "enable_toau" {
  default="1;"
}

variable "enable_wotg" {
  default="1;"
}

variable "enable_acp" {
  default="1;"
}

variable "enable_amk" {
  default="1;"
}

variable "enable_asa" {
  default="1;"
}

variable "enable_abyssea" {
  default="1;"
}

variable "enable_soa" {
  default="1;"
}

variable "enable_rov" {
  default="1;"
}

variable "enable_voidwatch" {
  default="1;"
  description="Not an expansion, but has its own storyline."
}

# CHARACTER CONFIG
variable "initial_levl_cap" {
  default="50;"
  description="The initial level cap for new players."
}

variable "max_level" {
  default="99;"
  description="Level max of the server, lowers the attainable cap by disabling Limit Break quests."
}

variable "normal_mob_max_level_range_min" {
  default="0;"
  description="Lower Bound of Max Level Range for Normal Mobs (0 = Uncapped)"
}

variable "normal_mob_max_level_range_max" {
  default="0;"
  description="Upper Bound of Max Level Range for Normal Mobs (0 = Uncapped)"
}

variable "start_gil" {
  default="100000;"
  description="Amount of gil given to newly created characters."
}

variable "start_inventory" {
  default="30;"
  description="Starting inventory and satchel size.  Ignores values < 30.  Do not set above 80!"
}

variable "opening_cutscene_enable" {
  default="1;"
  description="Set to 1 to enable opening cutscenes, 0 to disable."
}

variable "all_maps" {
  default="0;"
  description="Set to 1 to give starting characters all the maps."
}

variable "unlock_outpost_warps" {
  default="2;"
  description="Set to 1 to give starting characters all outpost warps.  2 to add Tu'Lia and Tavnazia."
}

variable "use_adoulin_weapon_skill_changes" {
  default="true;"
  description="true/false. Change to toggle new Adoulin weapon skill damage calculations"
}

variable "healing_tp_change" {
  default="-0;"
  description="Change in TP for each healing tick. Default is -100"
}

variable "landkingsystem_nq" {
  default="2;"
  description="Sets spawn type for: Behemoth, Fafnir, Adamantoise, King Behemoth, Nidhog, Aspidochelone. Use 0 for timed spawns, 1 for force pop only, 2 for both."
}

variable "landkingsystem_hq" {
  default="2;"
  description="Sets spawn type for: Behemoth, Fafnir, Adamantoise, King Behemoth, Nidhog, Aspidochelone. Use 0 for timed spawns, 1 for force pop only, 2 for both."
}

# DYNAMIS SETTINGS

variable "between_2dyna_wait_time" {
  default="0;"
  description="Hours before player can re-enter Dynamis. Default is 1 Earthday (24 hours)."
}

variable "dyna_midnight_reset" {
  default="true;"
  description="if true, makes the wait time count by number of server midnights instead of full 24 hour intervals."
}

variable "dyna_level_min" {
  default="65;"
  description="level min for entering in Dynamis."
}

variable "timeless_hourglass_cost" {
  default="5000;"
  description="refund for the timeless hourglass for Dynamis."
}

variable "prismatic_hourglass_cost" {
  default="5000;"
  description="cost of the prismatic hourglass for Dynamis."
}

variable "currency_exchange_rate" {
  default="100;"
  description="X Tier 1 ancient currency -> 1 Tier 2, and so on.  Certain values may conflict with shop items.  Not designed to exceed 198."
}

variable "relic_2nd_upgrade_wait_time" {
  default="0;"
  description="wait time for 2nd relic upgrade (stage 2 -> stage 3) in seconds. 7200s = 2 hours."
}

variable "relic_3rd_upgrade_wait_time" {
  default="0;"
  description="wait time for 3rd relic upgrade (stage 3 -> stage 4) in seconds. 3600s = 1 hour."
}

variable "free_cop_dynamis" {
  default="0;"
  description="Authorize player to entering inside COP Dynamis without completing COP mission ( 1 = enable 0= disable)"
}

# QUEST/MISSION SPECIFIC SETTINGS

variable "oldschoolg1" {
  default="true;"
  description="Set to true to require farming Exoray Mold, Bombd Coal, and Ancient Papyrus drops instead of allowing key item method."
}

variable "oldschoolg2" {
  default="true;"
  description="Set true to require the NMs for Atop the Highest Mountains be dead to get KI like before SE changed it."
}

variable "fragiciteduration" {
  default="240;"
  description="When OldSChoolG2 is enabled, this is the time (in seconds) you have from killing Boreal NMs to click the ??? target. Default 30"
}

variable "sneak_invisi_duration_multiplier" {
  default="4;"
  description="multiplies duration of sneak,invis,deodorize to reduce player torture. 1 = retail behavior."
}

# MISC
variable "enable_cop_zone_cap" {
  default="0;"
  description="enable or disable lvl cap"
}

variable "number_of_dm_earrings" {
  default="3;"
  description="Number of earrings players can simultaneously own from Divine Might before scripts start blocking them (Default: 1)"
}

variable "homepoint_teleport" {
  default="1;"
  description="Enables the homepoint teleport system."
}

variable "enm_cooldown" {
  default="0;"
  description="Number of hours before a player can obtain same KI for ENMs (default: 5 days)"
}

variable "force_spawn_qm_reset_time" {
  default="5;"
  description="Number of seconds the ??? remains hidden for after the despawning of the mob it force spawns."
}

# ABYSSEA
variable "visitant_bonus" {
  default="5.00;"
  description="Default: 1.00 - (retail) - Multiplies the base time value of each Traverser Stone."
}

### settings.lua Server Configuration ###