
$data merge storage meowinternal:temp {AttackersWin:$(atkWin),SpikePlantedAtRoundEnd:$(spikePlanted),RoundOver:1}

# calculate who dies from spike detonation
execute if data storage meowinternal:valorant {SpikePlanted:1} \
    run summon marker ~ ~ ~ {Tags:["VAL_SPIKE"]}
execute if data storage meowinternal:valorant {SpikePlanted:1} \
    run data modify entity @e[tag=VAL_SPIKE,limit=1] Pos set from storage meowinternal:valorant SpikePos 
execute if data storage meowinternal:valorant {SpikePlanted:1} \
    at @e[tag=VAL_SPIKE,limit=1] \
    run kill @e[distance=..30,tag=VAL_PLAYING,gamemode=adventure]

kill @e[tag=VAL_SPIKE]
kill @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh"}}]

gamemode spectator @a[team=VAL_PLAYING]

$title @a[tag=VAL_EVERYONE] title ["",{"text":"$(endText)","color":"red","bold":true}]

execute if data storage meowinternal:temp {AttackersWin:1} \
    run title @a[tag=VAL_EVERYONE] subtitle ["",{"text":"Attackers ","color":"red","bold":true},{"text":"win!","color":"gold","bold":true}]
execute if data storage meowinternal:temp {AttackersWin:0} \
    run title @a[tag=VAL_EVERYONE] subtitle ["",{"text":"Defenders ","color":"aqua","bold":true},{"text":"win!","color":"gold","bold":true}]

tag @a[tag=meow_countdowntitle] remove meow_countdowntitle
scoreboard players set #CD_TICK VAL_WAITTICK 0

bossbar set time_bossbar players
bossbar set spike_bossbar players