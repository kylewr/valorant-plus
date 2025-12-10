
execute if data storage meowinternal:valorant {RoundActive:1} \
    run tellraw @s ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"You may not join a team while the round is active!","color":"red"}]
execute if data storage meowinternal:valorant {RoundActive:1} \
    run return 1

team leave @s
execute store success storage meowinternal:temp FoundRightColorBool int 1 run data get storage meowinternal:valorant InvertTeamColors

execute if data storage meowinternal:temp {FoundRightColorBool:1} \
    if data storage meowinternal:valorant {InvertTeamColors:0} \
    run tellraw @a ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Player ","color":"green"},{"selector":"@s","color":"light_purple"},{"text":" has joined the ","color":"green"},{"text":"Attackers","color":"red","bold":true},{"text":" side!","color":"green"}]
execute if data storage meowinternal:temp {FoundRightColorBool:1} \
    if data storage meowinternal:valorant {InvertTeamColors:1} \
    run tellraw @a ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Player ","color":"green"},{"selector":"@s","color":"light_purple"},{"text":" has joined the ","color":"green"},{"text":"Attackers","color":"aqua","bold":true},{"text":" side!","color":"green"}]

execute store success storage meowinternal:temp TeamJoinSuccess int 1 run team join VAL_ATK

execute if data storage meowinternal:temp {TeamJoinSuccess:0} \
    run team add VAL_ATK ["",{"text":"Attackers","color":"red"}]
execute if data storage meowinternal:temp {TeamJoinSuccess:0} \
    run team modify VAL_ATK color red
execute if data storage meowinternal:temp {TeamJoinSuccess:0} \
    run team modify VAL_ATK prefix ["",{"text":"[","color":"dark_red","bold":true},{"text":"Attacker","color":"red","bold":true},{"text":"] ","color":"dark_red","bold":true}]
execute if data storage meowintenral:temp {TeamJoinSuccess:0} \
    run team modify VAL_ATK nametagVisibility hideForOtherTeams
execute if data storage meowintenral:temp {TeamJoinSuccess:0} \
    run team modify VAL_ATK friendlyFire false
execute if data storage meowintenral:temp {TeamJoinSuccess:0} \
    run team modify VAL_ATK seeFriendlyInvisibles false

execute store success storage meowinternal:temp TeamJoinSuccess int 1 run team join VAL_ATK

execute if data storage meowinternal:temp {FoundRightColorBool:1} \
    if data storage meowinternal:valorant {InvertTeamColors:1} \
    run team modify VAL_ATK color aqua
execute if data storage meowinternal:temp {FoundRightColorBool:1} \
    if data storage meowinternal:valorant {InvertTeamColors:1} \
    run team modify VAL_ATK prefix ["",{"text":"[","color":"dark_aqua","bold":true},{"text":"Attacker","color":"aqua","bold":true},{"text":"] ","color":"dark_aqua","bold":true}]

execute if data storage meowinternal:temp {FoundRightColorBool:0} \
    run data merge storage meowinternal:valorant {InvertTeamColors:0}

scoreboard objectives add VAL_TEAMS dummy ["",{"text":"TEAMS","color":"gold","bold":true}]
scoreboard objectives setdisplay sidebar.team.aqua VAL_TEAMS
scoreboard objectives setdisplay sidebar.team.red VAL_TEAMS
scoreboard objectives setdisplay sidebar.team.gray VAL_TEAMS

scoreboard players set @s VAL_TEAMS 1

data remove storage meowinternal:temp TeamJoinSuccess
data remove storage meowinternal:temp FoundRightColorBool