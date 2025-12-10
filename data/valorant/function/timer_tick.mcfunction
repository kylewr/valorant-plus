# remove 1 each tick
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    run scoreboard players remove #TIMER_TICKS VAL_WAITTICK 1

# calculate seconds
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    run scoreboard players operation #DIVREMAINDER VAL_WAITTICK = #TIMER_TICKS VAL_WAITTICK
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    run scoreboard players operation #DIVREMAINDER VAL_WAITTICK %= #TICKCONSTANT VAL_WAITTICK

# update seconds if needed
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    if score #DIVREMAINDER VAL_WAITTICK matches 0 \
    run scoreboard players remove #TIMER_SECONDS VAL_WAITTICK 1

scoreboard players set #DIVREMAINDER VAL_WAITTICK -1

# calculate minutes
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    run scoreboard players operation #TEMP_TICKS VAL_WAITTICK = #TIMER_TICKS VAL_WAITTICK
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    run scoreboard players add #TEMP_TICKS VAL_WAITTICK 20
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    run scoreboard players operation #DIVREMAINDER VAL_WAITTICK = #TEMP_TICKS VAL_WAITTICK
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    run scoreboard players operation #DIVREMAINDER VAL_WAITTICK %= #TICKCONSTANT_MINUTES VAL_WAITTICK

# update minutes if needed
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    if score #DIVREMAINDER VAL_WAITTICK matches 0 \
    run scoreboard players remove #TIMER_MINUTES VAL_WAITTICK 1
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    if score #DIVREMAINDER VAL_WAITTICK matches 0 \
    run scoreboard players set #TIMER_SECONDS VAL_WAITTICK 59

# set the bossbar value (for both, although only one will be displayed at a time)
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    store result bossbar minecraft:time_bossbar value \
    run scoreboard players get #TIMER_TICKS VAL_WAITTICK
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    store result bossbar minecraft:spike_bossbar value \
    run scoreboard players get #TIMER_TICKS VAL_WAITTICK

# set the bossbar name
# if the timer has less than 10 seconds, display a 0 in front of the number
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    if data storage meowinternal:valorant {SpikePlanted:0} \
    if score #TIMER_SECONDS VAL_WAITTICK matches 0..9 \
    run bossbar set minecraft:time_bossbar name [{"text":"Time: ","color":"gold","bold":true},{"score":{"name":"#TIMER_MINUTES","objective":"VAL_WAITTICK"},"color":"green","bold":false},{"text":":0","color":"green","bold":false},{"score":{"name":"#TIMER_SECONDS","objective":"VAL_WAITTICK"},"color":"green","bold":false}]
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    if data storage meowinternal:valorant {SpikePlanted:0} \
    unless score #TIMER_SECONDS VAL_WAITTICK matches 0..9 \
    run bossbar set minecraft:time_bossbar name [{"text":"Time: ","color":"gold","bold":true},{"score":{"name":"#TIMER_MINUTES","objective":"VAL_WAITTICK"},"color":"green","bold":false},{"text":":","color":"green","bold":false},{"score":{"name":"#TIMER_SECONDS","objective":"VAL_WAITTICK"},"color":"green","bold":false}]
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    if data storage meowinternal:valorant {SpikePlanted:1} \
    if score #TIMER_SECONDS VAL_WAITTICK matches 0..9 \
    run bossbar set minecraft:spike_bossbar name [{"text":"SPIKE: ","color":"red","bold":true},{"score":{"name":"#TIMER_MINUTES","objective":"VAL_WAITTICK"},"color":"dark_red","bold":false},{"text":":0","color":"dark_red","bold":false},{"score":{"name":"#TIMER_SECONDS","objective":"VAL_WAITTICK"},"color":"dark_red","bold":false}]
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    if data storage meowinternal:valorant {SpikePlanted:1} \
    unless score #TIMER_SECONDS VAL_WAITTICK matches 0..9 \
    run bossbar set minecraft:spike_bossbar name [{"text":"SPIKE: ","color":"red","bold":true},{"score":{"name":"#TIMER_MINUTES","objective":"VAL_WAITTICK"},"color":"dark_red","bold":false},{"text":":","color":"dark_red","bold":false},{"score":{"name":"#TIMER_SECONDS","objective":"VAL_WAITTICK"},"color":"dark_red","bold":false}]

execute if score #TIMER_TICKS VAL_WAITTICK matches ..0 \
    run data modify storage meowinternal:valorant RoundOver set value 1

execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    if score #TIMER_TICKS VAL_WAITTICK matches ..0 \
    if data storage meowinternal:valorant {SpikePlanted:0} \
    run function valorant:resetround {atkWin:0,spikePlanted:0,endText:"Time's Up!"}
execute if data storage meowinternal:valorant {GameActive:1,RoundActive:1} \
    if score #TIMER_TICKS VAL_WAITTICK matches ..0 \
    if data storage meowinternal:valorant {SpikePlanted:1} \
    run function valorant:resetround {atkWin:1,spikePlanted:1,endText:"Spike Detonated!"}

execute if score #TIMER_TICKS VAL_WAITTICK matches ..0 \
    run data modify storage meowinternal:valorant RoundActive set value 0