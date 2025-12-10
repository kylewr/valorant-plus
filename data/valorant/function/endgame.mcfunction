tellraw @a[tag=VAL_EVERYONE] ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Game ended!","color":"red"}]

execute in the_end run tp @a[tag=VAL_EVERYONE] 0 54 0 90 0

# Todo: calculate win/loss and display the appropriate message
# todo: calculate kill/deaths

team remove VAL_ATK
team remove VAL_DEF
team remove VAL_OBSV

tag @e remove VAL_ATKDEADINIT
tag @e remove VAL_ATKDEAD
tag @e remove VAL_DEFDEADINIT
tag @e remove VAL_DEFDEAD

gamemode adventure @a
tag @e[tag=VAL_EVERYONE] remove meow_displaytitle
tag @e remove VAL_EVERYONE
tag @e remove VAL_PLAYING
tag @e remove VAL_OBSV

scoreboard players set #CD_TICK VAL_WAITTICK -1
scoreboard players set #TICK VAL_WAITTICK -1
scoreboard players set #TICKCONSTANT VAL_WAITTICK 20
scoreboard players set #TICKCONSTANT_MINUTES VAL_WAITTICK 1200
scoreboard players set #TIMER_TICKS VAL_WAITTICK -1
scoreboard players set #TIMER_SECONDS VAL_WAITTICK -1
scoreboard players set #TIMER_MINUTES VAL_WAITTICK -1

data merge storage meowinternal:valorant {GameActive:0,RoundActive:0,InvertTeamColors:0,SpikePlanted:0,AttackersWin:0,SpikePlantedAtRoundEnd:0,RoundOver:0,SpikePos:[]}

scoreboard objectives remove VAL_TEAMS

bossbar set time_bossbar players
bossbar set spike_bossbar players