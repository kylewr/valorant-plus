execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    run scoreboard players add #CD_TICK VAL_WAITTICK 1

execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if score #CD_TICK VAL_WAITTICK matches 0..1 \
    run title @a[tag=meow_countdowntitle] times 0 5s 2

execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if score #CD_TICK VAL_WAITTICK matches 0..1 \
    run title @a[tag=meow_countdowntitle] title ["",{"text":"Prepare to fight!", "color":"red","bold":true}]

execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if score #CD_TICK VAL_WAITTICK matches 40..41 \
    run title @a[tag=meow_countdowntitle] subtitle ["",{"text":"3","color":"red","bold":true}]

execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if score #CD_TICK VAL_WAITTICK matches 60..61 \
    run title @a[tag=meow_countdowntitle] subtitle ["",{"text":"2","color":"gold","bold":true}]

execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if score #CD_TICK VAL_WAITTICK matches 80..81 \
    run title @a[tag=meow_countdowntitle] subtitle ["",{"text":"1","color":"yellow","bold":true}]

execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if score #CD_TICK VAL_WAITTICK matches 100..101 \
    run title @a[tag=meow_countdowntitle] clear
execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if score #CD_TICK VAL_WAITTICK matches 100..101 \
    run title @a[tag=meow_countdowntitle] title ["",{"text":"Fight!","color":"green","bold":true}]

execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if data storage meowinternal:valorant {RoundOver:1} \
    if score #CD_TICK VAL_WAITTICK matches 102 \
    run function valorant:startgame_aftertick
execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if data storage meowinternal:valorant {RoundOver:0} \
    if score #CD_TICK VAL_WAITTICK matches 102 \
    run data merge storage meowinternal:valorant {RoundActive:1}
execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if data storage meowinternal:valorant {RoundOver:0} \
    if score #CD_TICK VAL_WAITTICK matches 102 \
    run bossbar set time_bossbar players @a[tag=meow_displaytimer]

execute unless score #CD_TICK VAL_WAITTICK matches ..-1 \
    if score #CD_TICK VAL_WAITTICK matches 102 \
    run scoreboard players set #CD_TICK VAL_WAITTICK -1