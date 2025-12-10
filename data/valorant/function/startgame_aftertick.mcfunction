scoreboard players set #TICK VAL_WAITTICK -1
scoreboard players set #TICK meow_title_tick -1
scoreboard players set #CD_TICK VAL_WAITTICK -1
scoreboard players set #TIMER_TICKS VAL_WAITTICK -1

title @a[tag=meow_displaytitle] clear
tag @a[tag=meow_displaytitle] remove meow_displaytitle

gamemode spectator @a[team=VAL_OBSV]
gamemode adventure @a[tag=VAL_PLAYING]

# remove dead states
tag @e[team=VAL_ATK] remove VAL_ATKDEADINIT
tag @e[team=VAL_ATK] remove VAL_ATKDEAD
tag @e[team=VAL_DEF] remove VAL_DEFDEADINIT
tag @e[team=VAL_DEF] remove VAL_DEFDEAD

# allow player to see countdown (when available)
tag @e[tag=VAL_PLAYING] add meow_countdowntitle
title @a[tag=meow_countdowntitle] clear

# allow player to see timer (when available)
tag @e[tag=VAL_PLAYING] add meow_displaytimer

# reset data
data merge storage meowinternal:valorant {GameActive:1,RoundActive:0,SpikePlanted:0,AttackersWin:0,SpikePlantedAtRoundEnd:0,RoundOver:0,SpikePos:[]}

# reset player inventories
clear @a[tag=VAL_EVERYONE]
give @a[tag=VAL_PLAYING] minecraft:iron_sword
give @a[tag=VAL_PLAYING] bow[minecraft:enchantments={levels:{infinity:1}}]
give @a[tag=VAL_PLAYING] arrow 1

# heal players and set their health values
execute as @a[tag=VAL_PLAYING] run attribute @s minecraft:max_health modifier remove valhealth
execute as @a[tag=VAL_PLAYING] run attribute @s minecraft:max_health modifier add valhealth -0.5 add_multiplied_total
effect give @a[tag=VAL_PLAYING] minecraft:regeneration 2 255 true
effect give @a[tag=VAL_PLAYING] minecraft:saturation 2 255 true

# game timer init seconds/mins
scoreboard players set #TIMER_SECONDS VAL_WAITTICK 20
scoreboard players set #TIMER_MINUTES VAL_WAITTICK 0

# convert seconds/mins to ticks
scoreboard players set #TIMER_TICKS VAL_WAITTICK 0
scoreboard players set #TEMP_MINUTECONVERT VAL_WAITTICK 0
scoreboard players set #TEMP_SECONDSCONVERT VAL_WAITTICK 0
scoreboard players operation #TEMP_MINUTECONVERT VAL_WAITTICK = #TIMER_MINUTES VAL_WAITTICK
scoreboard players operation #TEMP_SECONDSCONVERT VAL_WAITTICK = #TIMER_SECONDS VAL_WAITTICK
scoreboard players operation #TEMP_MINUTECONVERT VAL_WAITTICK *= #TICKCONSTANT_MINUTES VAL_WAITTICK
scoreboard players operation #TEMP_SECONDSCONVERT VAL_WAITTICK *= #TICKCONSTANT VAL_WAITTICK
scoreboard players operation #TIMER_TICKS VAL_WAITTICK += #TEMP_MINUTECONVERT VAL_WAITTICK
scoreboard players operation #TIMER_TICKS VAL_WAITTICK += #TEMP_SECONDSCONVERT VAL_WAITTICK

# set bossbar maximum value to the timer starting value
execute store result bossbar minecraft:time_bossbar max run scoreboard players get #TIMER_TICKS VAL_WAITTICK

# make the player unable to move
effect give @e[tag=VAL_PLAYING] minecraft:weakness 5 255 true
effect give @e[tag=VAL_PLAYING] minecraft:slowness 5 255 true
effect give @e[tag=VAL_PLAYING] minecraft:blindness 5 255 true

execute as @e[team=VAL_ATK] at @e[type=marker,tag=VAL_ATKSPAWN] run tp ~ ~ ~
execute as @e[team=VAL_DEF] at @e[type=marker,tag=VAL_DEFSPAWN] run tp ~ ~ ~

# spread players at their spawns
execute at @e[type=marker,tag=VAL_ATKSPAWN,limit=1] \
    run spreadplayers ~ ~ 1 2 false @e[team=VAL_ATK]

execute at @e[type=marker,tag=VAL_DEFSPAWN,limit=1] \
    run spreadplayers ~ ~ 1 2 false @e[team=VAL_DEF]

# set spawnpoints
execute at @e[type=marker,tag=VAL_ATKSPAWN,limit=1] \
    as @a[team=VAL_ATK] \
    run spawnpoint @s ~ ~ ~

execute at @e[type=marker,tag=VAL_DEFSPAWN,limit=1] \
    as @a[team=VAL_DEF] \
    run spawnpoint @s ~ ~ ~

# start countdown
scoreboard players set #CD_TICK VAL_WAITTICK 0