
execute store result storage meowinternal:temp TeamATKNum int 1 run team list VAL_ATK
execute store result storage meowinternal:temp TeamDEFNum int 1 run team list VAL_DEF

execute if data storage meowinternal:temp {TeamATKNum:0} \
    run tellraw @s ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"No Attackers found!","color":"red"}]

execute if data storage meowinternal:temp {TeamDEFNum:0} \
    run tellraw @s ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"No Defenders found!","color":"red"}]

execute if data storage meowinternal:valorant {MapSelectedFlag:1} \
    run tellraw @s ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"No map selected!","color":"red"}]

scoreboard objectives setdisplay sidebar.team.aqua
scoreboard objectives setdisplay sidebar.team.red
scoreboard objectives setdisplay list VAL_TEAMS

tag @e[team=VAL_ATK] add VAL_EVERYONE
tag @e[team=VAL_DEF] add VAL_EVERYONE
tag @e[team=VAL_OBSV] add VAL_EVERYONE
tag @e[team=VAL_ATK] add VAL_PLAYING
tag @e[team=VAL_DEF] add VAL_PLAYING

gamemode spectator @a[tag=VAL_EVERYONE]

# execute in overworld run tp @a[tag=VAL_EVERYONE] ~ ~ ~
# execute in overworld as @e[type=marker,tag=VAL_CAMERA] at @s run tp @a[tag=VAL_EVERYONE] @s

# load current map camera coordinates and teleport the player there, then tp to overworld
execute in the_end run summon marker ~ ~ ~ {Tags:["VAL_TPBUFFER"]}
data modify entity @e[tag=VAL_TPBUFFER,limit=1] Pos set from storage meowinternal:valorant CameraCoords
data modify entity @e[tag=VAL_TPBUFFER,limit=1] Rotation set from storage meowinternal:valorant CameraRotation
tp @a[tag=VAL_EVERYONE] @e[tag=VAL_TPBUFFER,limit=1]
execute in overworld run tp @a[tag=VAL_EVERYONE] ~ ~ ~

scoreboard objectives remove VAL_KILLEDBYRED
scoreboard objectives remove VAL_KILLEDBYBLUE
scoreboard objectives remove VAL_DEATHS

scoreboard objectives add VAL_KILLEDBYRED killedByTeam.red
scoreboard objectives add VAL_KILLEDBYBLUE killedByTeam.blue
scoreboard objectives add VAL_DEATHS deathCount

tag @a[tag=VAL_EVERYONE] add meow_displaytitle

scoreboard players set #TICK VAL_WAITTICK 1
data modify storage meowinternal:valorant GameActive set value 1

effect give @a[tag=VAL_EVERYONE] minecraft:blindness 2 2 true

# in the future add forced movements of the player
function tools:title {1:'A',2:'s',3:'c',4:'e',5:'n',6:'t',7:'["",{"text":""}]',8:'["",{"text":""}]'}
tag @a[tag=VAL_EVERYONE] add meow_displaytitle

title @a[tag=meow_displaytitle] subtitle ["",{"text":"Mechanics created by ", "color":"blue"},{"text":"Ruffr","color":"dark_green","bold":true}]
title @a[tag=meow_displaytitle] actionbar ["",{"text":"Thanks for playing!","color":"light_purple"}]