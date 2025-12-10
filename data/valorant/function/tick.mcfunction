execute if score #TICK VAL_WAITTICK matches 200.. \
    run function valorant:startgame_aftertick

execute if data storage meowinternal:valorant {GameActive:1} \
    as @a[scores={VAL_DEATHS=1..}] \
    run tag @s add VAL_ATKDEADINIT
execute if data storage meowinternal:valorant {GameActive:1} \
    as @a[scores={VAL_DEATHS=1..}] \
    run scoreboard players reset @s VAL_DEATHS

execute if data storage meowinternal:valorant {GameActive:1} \
    as @e[tag=VAL_OBSV] \
    run gamemode spectator @s

execute if data storage meowinternal:valorant {GameActive:1} \
    as @e[tag=VAL_ATKDEADINIT] \
    run gamemode spectator @s

execute if data storage meowinternal:valorant {GameActive:1} \
    as @e[tag=VAL_ATKDEADINIT] \
    run tag @s add VAL_ATKDEAD
execute if data storage meowinternal:valorant {GameActive:1} \
    as @e[tag=VAL_ATKDEADINIT] \
    run tag @s remove VAL_ATKDEADINIT

execute if data storage meowinternal:valorant {GameActive:1} \
    as @e[tag=VAL_DEFDEADINIT] \
    run gamemode spectator @s

execute if data storage meowinternal:valorant {GameActive:1} \
    as @e[tag=VAL_DEFDEADINIT] \
    run tag @s add VAL_DEFDEAD
execute if data storage meowinternal:valorant {GameActive:1} \
    as @e[tag=VAL_DEFDEADINIT] \
    run tag @s remove VAL_DEFDEADINIT

execute if data storage meowinternal:valorant {GameActive:1} \
    unless score #TICK VAL_WAITTICK matches ..-1 \
    run scoreboard players add #TICK VAL_WAITTICK 1