#!/bin/bash

MYSQL_HOST=${MYSQL_HOST:-localhost}
MYSQL_PORT=${MYSQL_PORT:-3306}
MYSQL_LOGIN=${MYSQL_LOGIN:-topaz}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-topaz}
MYSQL_DATABASE=${MYSQL_DATABASE:-tpzdb}
SERVERNAME=${SERVERNAME:-Topaz}


## map.conf Server Configuration
lightluggage_block=${lightluggage_block:-4}
ah_base_fee_single=${ah_base_fee_single:-1}
ah_base_fee_stacks=${ah_base_fee_stacks:-4}
ah_tax_rate_single=${ah_tax_rate_single:-1.0}
ah_tax_rate_stacks=${ah_tax_rate_stacks:-0.5}
ah_max_fee=${ah_max_fee:-10000}
exp_rate=${exp_rate:-1.0}
exp_loss_rate=${exp_loss_rate:-1.0}
exp_party_gap_penalties=${exp_party_gap_penalties:-1}
fov_allow_alliance=${fov_allow_alliance:-1}
vanadiel_time_offset=${vanadiel_time_offset:-0}
fame_multiplier=${fame_multiplier:-1.00}
exp_retain=${exp_retain:-0}
exp_loss_level=${exp_loss_level:-4}
level_sync_enable=${level_sync_enable:-1}
disable_gear_scaling=${disable_gear_scaling:-0}
all_jobs_widescan=${all_jobs_widescan:-0}
speed_mod=${speed_mod:-0}
mob_speed_mod=${mob_speed_mod:-0}
skillup_chance_multiplier=${skillup_chance_multiplier:-2.5}
craft_chance_multiplier=${craft_chance_multiplier:-2.6}
player_hp_multiplier=${player_hp_multiplier:-1.0}
player_mp_multiplier=${player_mp_multiplier:-1.0}
max_merit_points=${max_merit_points:-30}

## settings.lua Server Configuration
ENABLE_COP=${ENABLE_COP:-0}
ENABLE_TOAU=${ENABLE_TOAU:-0}
ENABLE_WOTG=${ENABLE_WOTG:-0}
ENABLE_ACP=${ENABLE_ACP:-0}
ENABLE_AMK=${ENABLE_AMK:-0}
ENABLE_ASA=${ENABLE_ASA:-0}
ENABLE_ABYSSEA=${ENABLE_ABYSSEA:-0}
ENABLE_SOA=${ENABLE_SOA:-0}
ENABLE_ROV=${ENABLE_ROV:-0}
ENABLE_VOIDWATCH=${ENABLE_VOIDWATCH:-0}

INITIAL_LEVEL_CAP=${INITIAL_LEVEL_CAP:-50}
MAX_LEVEL=${MAX_LEVEL:-75}
NORMAL_MOB_MAX_LEVEL_RANGE_MIN=${NORMAL_MOB_MAX_LEVEL_RANGE_MIN:-81}
NORMAL_MOB_MAX_LEVEL_RANGE_MAX=${NORMAL_MOB_MAX_LEVEL_RANGE_MAX:-84}
START_GIL=${START_GIL:-10}
START_INVENTORY=${START_INVENTORY:-30}
OPENING_CUTSCENE_ENABLE=${OPENING_CUTSCENE_ENABLE:-0}
ALL_MAPS=${ALL_MAPS:-0}
UNLOCK_OUTPOST_WARPS=${UNLOCK_OUTPOST_WARPS:-0}

USE_ADOULIN_WEAPON_SKILL_CHANGES=${USE_ADOULIN_WEAPON_SKILL_CHANGES:-false}

HEALING_TP_CHANGE=${HEALING_TP_CHANGE:--100}

LandKingSystem_NQ=${LandKingSystem_NQ:-0}
LandKingSystem_HQ=${LandKingSystem_HQ:-0}


BETWEEN_2DYNA_WAIT_TIME=${BETWEEN_2DYNA_WAIT_TIME:-24}
DYNA_MIDNIGHT_RESET=${DYNA_MIDNIGHT_RESET:-true}
DYNA_LEVEL_MIN=${DYNA_LEVEL_MIN:-65}
TIMELESS_HOURGLASS_COST=${TIMELESS_HOURGLASS_COST:-500000}
PRISMATIC_HOURGLASS_COST=${PRISMATIC_HOURGLASS_COST:-50000}
CURRENCY_EXCHANGE_RATE=${CURRENCY_EXCHANGE_RATE:-100}
RELIC_2ND_UPGRADE_WAIT_TIME=${RELIC_2ND_UPGRADE_WAIT_TIME:-7200}
RELIC_3RD_UPGRADE_WAIT_TIME=${RELIC_3RD_UPGRADE_WAIT_TIME:-3600}
FREE_COP_DYNAMIS=${FREE_COP_DYNAMIS:-0}

OldSchoolG1=${OldSchoolG1:-false}
OldSchoolG2=${OldSchoolG2:-false}
FrigiciteDuration=${FrigiciteDuration:-30}

SNEAK_INVIS_DURATION_MULTIPLIER=${SNEAK_INVIS_DURATION_MULTIPLIER:-1}

ENABLE_COP_ZONE_CAP=${ENABLE_COP_ZONE_CAP:-1}
NUMBER_OF_DM_EARRINGS=${NUMBER_OF_DM_EARRINGS:-1}
HOMEPOINT_TELEPORT=${HOMEPOINT_TELEPORT:-0}
ENM_COOLDOWN=${ENM_COOLDOWN:-120}
FORCE_SPAWN_QM_RESET_TIME=${FORCE_SPAWN_QM_RESET_TIME:-300}

VISITANT_BONUS=${VISITANT_BONUS:-1.00}

## Need to move files from conf/default to conf
mv -v conf/default/* conf


## modify configuration
function modConfig() {
    local db_files=(login.conf map.conf search_server.conf)

    for f in ${db_files[@]}
    do
        if [[ -f conf/$f ]]; then
            sed -i "s/^\(mysql_host:\s*\).*\$/\1$MYSQL_HOST/" conf/$f
            sed -i "s/^\(mysql_port:\s*\).*\$/\1$MYSQL_PORT/" conf/$f
            sed -i "s/^\(mysql_login:\s*\).*\$/\1$MYSQL_LOGIN/" conf/$f
            sed -i "s/^\(mysql_password:\s*\).*\$/\1$MYSQL_PASSWORD/" conf/$f
            sed -i "s/^\(mysql_database:\s*\).*\$/\1$MYSQL_DATABASE/" conf/$f
        fi
    done

    sed -i "s/^\(servername:\s*\).*\$/\1$SERVERNAME/" conf/login.conf
}

function modSettings() {
    local conf_file=(map.conf)
    local settings_file=(settings.lua)

    for f in ${conf_file[@]}
    do
        if [[ -f conf/$f ]]; then
            sed -i "s/^\(lightluggage_block:\s*\).*\$/\1$lightluggage_block/" conf/$f
            sed -i "s/^\(ah_base_fee_single:\s*\).*\$/\1$ah_base_fee_single/" conf/$f
            sed -i "s/^\(ah_base_fee_stacks:\s*\).*\$/\1$ah_base_fee_stacks/" conf/$f
            sed -i "s/^\(ah_tax_rate_single:\s*\).*\$/\1$ah_tax_rate_single/" conf/$f
            sed -i "s/^\(ah_tax_rate_stacks:\s*\).*\$/\1$ah_tax_rate_stacks/" conf/$f
            sed -i "s/^\(ah_max_fee:\s*\).*\$/\1$ah_max_fee/" conf/$f
            sed -i "s/^\(exp_rate:\s*\).*\$/\1$exp_rate/" conf/$f
            sed -i "s/^\(exp_loss_rate:\s*\).*\$/\1$exp_loss_rate/" conf/$f
            sed -i "s/^\(exp_party_gap_penalties:\s*\).*\$/\1$exp_party_gap_penalties/" conf/$f
            sed -i "s/^\(fov_allow_alliance:\s*\).*\$/\1$fov_allow_alliance/" conf/$f
            sed -i "s/^\(vanadiel_time_offset:\s*\).*\$/\1$vanadiel_time_offset/" conf/$f
            sed -i "s/^\(fame_multiplier:\s*\).*\$/\1$fame_multiplier/" conf/$f
            sed -i "s/^\(exp_retain:\s*\).*\$/\1$exp_retain/" conf/$f
            sed -i "s/^\(exp_loss_level:\s*\).*\$/\1$exp_loss_level/" conf/$f
            sed -i "s/^\(level_sync_enable:\s*\).*\$/\1$level_sync_enable/" conf/$f
            sed -i "s/^\(disable_gear_scaling:\s*\).*\$/\1$disable_gear_scaling/" conf/$f
            sed -i "s/^\(all_jobs_widescan:\s*\).*\$/\1$all_jobs_widescan/" conf/$f
            sed -i "s/^\(speed_mod:\s*\).*\$/\1$speed_mod/" conf/$f
            sed -i "s/^\(mob_speed_mod:\s*\).*\$/\1$mob_speed_mod/" conf/$f
            sed -i "s/^\(skillup_chance_multiplier:\s*\).*\$/\1$skillup_chance_multiplier/" conf/$f
            sed -i "s/^\(craft_chance_multiplier:\s*\).*\$/\1$craft_chance_multiplier/" conf/$f
            sed -i "s/^\(player_hp_multiplier:\s*\).*\$/\1$player_hp_multiplier/" conf/$f
            sed -i "s/^\(player_mp_multiplier:\s*\).*\$/\1$player_mp_multiplier/" conf/$f
            sed -i "s/^\(max_merit_points:\s*\).*\$/\1$max_merit_points/" conf/$f
        fi
    done

    for f in ${settings_file[@]}
    do
        if [[ -f scripts/globals/$f ]]; then
            sed -i "s/^\(ENABLE_COP[[:blank:]]*=\s*\).*\$/\1$ENABLE_COP/" scripts/globals/$f
            sed -i "s/^\(ENABLE_TOAU[[:blank:]]*=\s*\).*\$/\1$ENABLE_TOAU/" scripts/globals/$f
            sed -i "s/^\(ENABLE_WOTG[[:blank:]]*=\s*\).*\$/\1$ENABLE_WOTG/" scripts/globals/$f
            sed -i "s/^\(ENABLE_ACP[[:blank:]]*=\s*\).*\$/\1$ENABLE_ACP/" scripts/globals/$f
            sed -i "s/^\(ENABLE_AMK[[:blank:]]*=\s*\).*\$/\1$ENABLE_AMK/" scripts/globals/$f
            sed -i "s/^\(ENABLE_ASA[[:blank:]]*=\s*\).*\$/\1$ENABLE_ASA/" scripts/globals/$f
            sed -i "s/^\(ENABLE_ABYSSEA[[:blank:]]*=\s*\).*\$/\1$ENABLE_ABYSSEA/" scripts/globals/$f
            sed -i "s/^\(ENABLE_SOA[[:blank:]]*=\s*\).*\$/\1$ENABLE_SOA/" scripts/globals/$f
            sed -i "s/^\(ENABLE_ROV[[:blank:]]*=\s*\).*\$/\1$ENABLE_ROV/" scripts/globals/$f
            sed -i "s/^\(ENABLE_VOIDWATCH[[:blank:]]*=\s*\).*\$/\1$ENABLE_VOIDWATCH/" scripts/globals/$f
            sed -i "s/^\(INITIAL_LEVEL_CAP[[:blank:]]*=\s*\).*\$/\1$INITIAL_LEVEL_CAP/" scripts/globals/$f
            sed -i "s/^\(MAX_LEVEL[[:blank:]]*=\s*\).*\$/\1$MAX_LEVEL/" scripts/globals/$f
            sed -i "s/^\(NORMAL_MOB_MAX_LEVEL_RANGE_MIN[[:blank:]]*=\s*\).*\$/\1$NORMAL_MOB_MAX_LEVEL_RANGE_MIN/" scripts/globals/$f
            sed -i "s/^\(NORMAL_MOB_MAX_LEVEL_RANGE_MAX[[:blank:]]*=\s*\).*\$/\1$NORMAL_MOB_MAX_LEVEL_RANGE_MAX/" scripts/globals/$f
            sed -i "s/^\(START_GIL[[:blank:]]*=\s*\).*\$/\1$START_GIL/" scripts/globals/$f
            sed -i "s/^\(START_INVENTORY[[:blank:]]*=\s*\).*\$/\1$START_INVENTORY/" scripts/globals/$f
            sed -i "s/^\(OPENING_CUTSCENE_ENABLE[[:blank:]]*=\s*\).*\$/\1$OPENING_CUTSCENE_ENABLE/" scripts/globals/$f
            sed -i "s/^\(ALL_MAPS[[:blank:]]*=\s*\).*\$/\1$ALL_MAPS/" scripts/globals/$f
            sed -i "s/^\(UNLOCK_OUTPOST_WARPS[[:blank:]]*=\s*\).*\$/\1$UNLOCK_OUTPOST_WARPS/" scripts/globals/$f
            sed -i "s/^\(USE_ADOULIN_WEAPON_SKILL_CHANGES[[:blank:]]*=\s*\).*\$/\1$USE_ADOULIN_WEAPON_SKILL_CHANGES/" scripts/globals/$f
            sed -i "s/^\(HEALING_TP_CHANGE[[:blank:]]*=\s*\).*\$/\1$HEALING_TP_CHANGE/" scripts/globals/$f
            sed -i "s/^\(LandKingSystem_NQ[[:blank:]]*=\s*\).*\$/\1$LandKingSystem_NQ/" scripts/globals/$f
            sed -i "s/^\(LandKingSystem_HQ[[:blank:]]*=\s*\).*\$/\1$LandKingSystem_HQ/" scripts/globals/$f
            sed -i "s/^\(BETWEEN_2DYNA_WAIT_TIME[[:blank:]]*=\s*\).*\$/\1$BETWEEN_2DYNA_WAIT_TIME/" scripts/globals/$f
            sed -i "s/^\(DYNA_MIDNIGHT_RESET[[:blank:]]*=\s*\).*\$/\1$DYNA_MIDNIGHT_RESET/" scripts/globals/$f
            sed -i "s/^\(DYNA_LEVEL_MIN[[:blank:]]*=\s*\).*\$/\1$DYNA_LEVEL_MIN/" scripts/globals/$f
            sed -i "s/^\(TIMELESS_HOURGLASS_COST[[:blank:]]*=\s*\).*\$/\1$TIMELESS_HOURGLASS_COST/" scripts/globals/$f
            sed -i "s/^\(PRISMATIC_HOURGLASS_COST[[:blank:]]*=\s*\).*\$/\1$PRISMATIC_HOURGLASS_COST/" scripts/globals/$f
            sed -i "s/^\(CURRENCY_EXCHANGE_RATE[[:blank:]]*=\s*\).*\$/\1$CURRENCY_EXCHANGE_RATE/" scripts/globals/$f
            sed -i "s/^\(RELIC_2ND_UPGRADE_WAIT_TIME[[:blank:]]*=\s*\).*\$/\1$RELIC_2ND_UPGRADE_WAIT_TIME/" scripts/globals/$f
            sed -i "s/^\(RELIC_3RD_UPGRADE_WAIT_TIME[[:blank:]]*=\s*\).*\$/\1$RELIC_3RD_UPGRADE_WAIT_TIME/" scripts/globals/$f
            sed -i "s/^\(FREE_COP_DYNAMIS[[:blank:]]*=\s*\).*\$/\1$FREE_COP_DYNAMIS/" scripts/globals/$f
            sed -i "s/^\(OldSchoolG1[[:blank:]]*=\s*\).*\$/\1$OldSchoolG1/" scripts/globals/$f
            sed -i "s/^\(OldSchoolG2[[:blank:]]*=\s*\).*\$/\1$OldSchoolG2/" scripts/globals/$f
            sed -i "s/^\(FrigiciteDuration[[:blank:]]*=\s*\).*\$/\1$FrigiciteDuration/" scripts/globals/$f
            sed -i "s/^\(SNEAK_INVIS_DURATION_MULTIPLIER[[:blank:]]*=\s*\).*\$/\1$SNEAK_INVIS_DURATION_MULTIPLIER/" scripts/globals/$f
            sed -i "s/^\(ENABLE_COP_ZONE_CAP[[:blank:]]*=\s*\).*\$/\1$ENABLE_COP_ZONE_CAP/" scripts/globals/$f
            sed -i "s/^\(NUMBER_OF_DM_EARRINGS[[:blank:]]*=\s*\).*\$/\1$NUMBER_OF_DM_EARRINGS/" scripts/globals/$f
            sed -i "s/^\(HOMEPOINT_TELEPORT[[:blank:]]*=\s*\).*\$/\1$HOMEPOINT_TELEPORT/" scripts/globals/$f
            sed -i "s/^\(ENM_COOLDOWN[[:blank:]]*=\s*\).*\$/\1$ENM_COOLDOWN/" scripts/globals/$f
            sed -i "s/^\(FORCE_SPAWN_QM_RESET_TIME[[:blank:]]*=\s*\).*\$/\1$FORCE_SPAWN_QM_RESET_TIME/" scripts/globals/$f
            sed -i "s/^\(VISITANT_BONUS[[:blank:]]*=\s*\).*\$/\1$VISITANT_BONUS/" scripts/globals/$f
        fi
    done
}

modConfig
modSettings