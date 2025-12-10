summon zombie ~ ~ ~ {Invulnerable:1,NoAI:1,CustomNameVisible:1,CustomName:'["",{"text":"Spike","color":"red","bold":true}]',Tags:["VAL_SPIKE"]}

data modify storage meowinternal:valorant SpikePlanted set value 1
data modify storage meowinternal:valorant SpikePos set from entity @s Pos

bossbar set time_bossbar players
bossbar set spike_bossbar players @a[tag=meow_displaytimer]

# 45s timer for spike
scoreboard players set #TIMER_TICKS VAL_WAITTICK 900
scoreboard players set #TIMER_SECONDS VAL_WAITTICK 45
scoreboard players set #TIMER_MINUTES VAL_WAITTICK 0

tellraw @a[tag=VAL_EVERYONE] ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Spike has been planted!","color":"red","bold":true}]