
execute if data storage meowinternal:valorant {RoundActive:1} \
    run tellraw @s ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"You may not join a team while the round is active!","color":"red"}]
execute if data storage meowinternal:valorant {RoundActive:1} \
    run return 1

team leave @s

tellraw @a ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Player ","color":"green"},{"selector":"@s","color":"light_purple"},{"text":" has joined the ","color":"green"},{"text":"Observers","color":"gray","bold":true},{"text":" side!","color":"green"}]

execute store success storage meowinternal:temp TeamJoinSuccess int 1 run team join VAL_OBSV

execute if data storage meowinternal:temp {TeamJoinSuccess:0} \
    run team add VAL_OBSV ["",{"text":"Observer","color":"gray"}]
execute if data storage meowinternal:temp {TeamJoinSuccess:0} \
    run team modify VAL_OBSV color gray
execute if data storage meowinternal:temp {TeamJoinSuccess:0} \
    run team modify VAL_OBSV prefix ["",{"text":"[","color":"dark_gray","italic":true},{"text":"Observer","color":"gray","italic":true},{"text":"] ","color":"dark_gray","italic":true}]
execute if data storage meowintenral:temp {TeamJoinSuccess:0} \
    run team modify VAL_OBSV nametagVisibility hideForOtherTeams
execute if data storage meowintenral:temp {TeamJoinSuccess:0} \
    run team modify VAL_OBSV friendlyFire false
execute if data storage meowintenral:temp {TeamJoinSuccess:0} \
    run team modify VAL_OBSV seeFriendlyInvisibles true
execute if data storage meowintenral:temp {TeamJoinSuccess:0} \
    run team modify VAL_OBSV collisionRule never

execute store success storage meowinternal:temp TeamJoinSuccess int 1 run team join VAL_OBSV

scoreboard objectives add VAL_TEAMS dummy ["",{"text":"TEAMS","color":"gold","bold":true}]
scoreboard objectives setdisplay sidebar.team.aqua VAL_TEAMS
scoreboard objectives setdisplay sidebar.team.red VAL_TEAMS
scoreboard objectives setdisplay sidebar.team.gray VAL_TEAMS

scoreboard players set @s VAL_TEAMS -1