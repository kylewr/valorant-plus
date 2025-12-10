
summon marker ~ ~ ~ {Tags:["val_markertest"]}

#BEGIN
# Check both teams exist
execute store success storage meowinternal:temp TeamExistsSuccess int 1 \
    run team join VAL_DEF @e[tag=val_markertest,limit=1]

execute if data storage meowinternal:temp {TeamExistsSuccess:0} \
    run return run tellraw @s ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"An error occurred. (do both teams exist?)","color":"red"}]

team leave @e[tag=val_markertest,limit=1]

execute store success storage meowinternal:temp TeamExistsSuccess int 1 \
    run team join VAL_ATK @e[tag=val_markertest,limit=1]

execute if data storage meowinternal:temp {TeamExistsSuccess:0} \
    run return run tellraw @s ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"An error occurred. (do both teams exist?)","color":"red"}]
#END

#BEGIN
# Check color swap flag exists, if it does swap it
execute store success storage meowinternal:temp FoundRightColorBool int 1 \
    run data get storage meowinternal:valorant InvertTeamColors

# exit if the color swap flag is not found
execute if data storage meowinternal:temp {FoundRightColorBool:0} \
    run return run tellraw @s ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"An error occurred. (do both teams exist?)","color":"red"}]

# swap the flag
execute store result storage meowinternal:temp OldInvert int 1 run data get storage meowinternal:valorant InvertTeamColors
execute if data storage meowinternal:temp {OldInvert:1} \
    run data modify storage meowinternal:valorant InvertTeamColors set value 0
execute if data storage meowinternal:temp {OldInvert:0} \
    run data modify storage meowinternal:valorant InvertTeamColors set value 1

# first case: ATK RED - DEF AQUA
execute if data storage meowinternal:valorant {InvertTeamColors:0} \
    run team modify VAL_ATK color red
execute if data storage meowinternal:valorant {InvertTeamColors:0} \
    run team modify VAL_ATK prefix ["",{"text":"[","color":"dark_red","bold":true},{"text":"Attacker","color":"red","bold":true},{"text":"] ","color":"dark_red","bold":true}]
execute if data storage meowinternal:valorant {InvertTeamColors:0} \
    run team modify VAL_DEF color aqua
execute if data storage meowinternal:valorant {InvertTeamColors:0} \
    run team modify VAL_DEF prefix ["",{"text":"[","color":"dark_aqua","bold":true},{"text":"Defender","color":"aqua","bold":true},{"text":"] ","color":"dark_aqua","bold":true}]
# second case: ATK AQUA - DEF RED
execute if data storage meowinternal:valorant {InvertTeamColors:1} \
    run team modify VAL_ATK color aqua
execute if data storage meowinternal:valorant {InvertTeamColors:1} \
    run team modify VAL_ATK prefix ["",{"text":"[","color":"dark_aqua","bold":true},{"text":"Attacker","color":"aqua","bold":true},{"text":"] ","color":"dark_aqua","bold":true}]
execute if data storage meowinternal:valorant {InvertTeamColors:1} \
    run team modify VAL_DEF color red
execute if data storage meowinternal:valorant {InvertTeamColors:1} \
    run team modify VAL_DEF prefix ["",{"text":"[","color":"dark_red","bold":true},{"text":"Defender","color":"red","bold":true},{"text":"] ","color":"dark_red","bold":true}]
#END

# swap the teams themselves
team add VAL_SWAP_TEMP
team join VAL_SWAP_TEMP @e[team=VAL_ATK]
team join VAL_ATK @e[team=VAL_DEF]
team join VAL_DEF @e[team=VAL_SWAP_TEMP]
team remove VAL_SWAP_TEMP

scoreboard players set @e[team=VAL_ATK] VAL_TEAMS 1
scoreboard players set @e[team=VAL_DEF] VAL_TEAMS 0

# alert all players
tellraw @a ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Teams have swapped sides!","color":"yellow","bold":true}]

execute if data storage meowinternal:valorant {InvertTeamColors:0} \
    run tellraw @a ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Attackers are now ","color":"gold"},{"text":"RED\n","color":"red","italic":true},{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Defenders are now ","color":"gold"},{"text":"BLUE","color":"aqua","italic":true}]
execute if data storage meowinternal:valorant {InvertTeamColors:1} \
    run tellraw @a ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Attackers are now ","color":"gold"},{"text":"BLUE\n","color":"aqua","italic":true},{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Defenders are now ","color":"gold"},{"text":"RED","color":"red","italic":true}]

title @a[team=VAL_ATK] title ["",{"text":"SWAPPING SIDES","color":"gold","bold":true}]
title @a[team=VAL_DEF] title ["",{"text":"SWAPPING SIDES","color":"gold","bold":true}]
title @a[team=VAL_ATK] subtitle ["",{"text":"You are now ","color":"green"},{"text":"Attacking","color":"red","bold":true}]
title @a[team=VAL_DEF] subtitle ["",{"text":"You are now ","color":"green"},{"text":"Defending","color":"aqua","bold":true}]

execute if data storage meowinternal:valorant {InvertTeamColors:0} \
    run tellraw @a[team=VAL_ATK] ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"You are now ","color":"green"},{"text":"ATTACKING","color":"red","bold":true},{"text":" on the ","color":"green"},{"text":"RED","color":"red","italic":true},{"text":" team","color":"green"}]
execute if data storage meowinternal:valorant {InvertTeamColors:1} \
    run tellraw @a[team=VAL_ATK] ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"You are now ","color":"green"},{"text":"ATTACKING","color":"red","bold":true},{"text":" on the ","color":"green"},{"text":"BLUE","color":"aqua","italic":true},{"text":" team","color":"green"}]
execute if data storage meowinternal:valorant {InvertTeamColors:0} \
    run tellraw @a[team=VAL_DEF] ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"You are now ","color":"green"},{"text":"DEFENDING","color":"aqua","bold":true},{"text":" on the ","color":"green"},{"text":"BLUE","color":"aqua","italic":true},{"text":" team","color":"green"}]
execute if data storage meowinternal:valorant {InvertTeamColors:1} \
    run tellraw @a[team=VAL_DEF] ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"You are now ","color":"green"},{"text":"DEFENDING","color":"aqua","bold":true},{"text":" on the ","color":"green"},{"text":"RED","color":"red","italic":true},{"text":" team","color":"green"}]

function valorant:startgame_aftertick

# cleanup
data remove storage meowinternal:temp TeamExistsSuccess
data remove storage meowinternal:temp FoundRightColorBool
data remove storage meowinternal:temp OldInvert
kill @e[tag=val_markertest,limit=1,sort=nearest]