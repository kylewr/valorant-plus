# data merge storage meowinternal:valorant {AvailableMaps:["ascent"]}
scoreboard objectives add VAL_WAITTICK dummy
scoreboard players set #CD_TICK VAL_WAITTICK -1
scoreboard players set #TICK VAL_WAITTICK -1
scoreboard players set #TICKCONSTANT VAL_WAITTICK 20
scoreboard players set #TICKCONSTANT_MINUTES VAL_WAITTICK 1200
scoreboard players set #TIMER_TICKS VAL_WAITTICK -1
scoreboard players set #TIMER_SECONDS VAL_WAITTICK -1
scoreboard players set #TIMER_MINUTES VAL_WAITTICK -1

bossbar add time_bossbar "Time"
bossbar set time_bossbar color yellow
bossbar set time_bossbar style progress
bossbar add spike_bossbar "Spike"
bossbar set spike_bossbar color red
bossbar set spike_bossbar style progress
bossbar set spike_bossbar max 900

gamerule keepInventory true
gamerule doImmediateRespawn true
gamerule doMobSpawning false

data merge storage meowinternal:valorant {MapData:{ \
    ascent:{AtkSpawnCoords:[93.5,77.0,164.0],DefSpawnCoords:[107.5,77.0,76.5],AtkSpawnRotation:[180f,0f],DefSpawnRotation:[0f,0f],CameraCoords:[132d,127d,182d],CameraRotation:[177f,36f]} \
}}

function valorant:loadmap {map:ascent}