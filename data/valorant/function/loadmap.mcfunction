
# $data merge storage meowinternal:temp {QueryCommandMap:$(map)}
# data merge storage meowinternal:temp {ExitCode:0}
# data merge storage meowinternal:temp {ExitFresh:0}
data merge storage meowinternal:temp {FoundMap:0}

summon marker ~ ~ ~ {Tags:["val_stringcompare"]}

# CHECK MAP: ASCENT
tag @e[type=marker,tag=val_stringcompare,limit=1] add ascent
$execute store success storage meowinternal:temp StringCompareFailure int 1 \
    run tag @e[type=marker,tag=val_stringcompare,limit=1] add $(map)

$execute if data storage meowinternal:temp {StringCompareFailure:0} \
    run data merge storage meowinternal:valorant {$(map):1}

execute if data storage meowinternal:temp {StringCompareFailure:0} \
    run data modify storage meowinternal:temp FoundMap set value 1

# execute if data storage meowinternal:temp {ExitCode:0} \
#     if data merge storage meowinternal:temp {ExitFresh:1}
#     run 

$execute unless data storage meowinternal:temp {FoundMap:1} \
    run tellraw @a ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Map $(map) not found!","color":"red"}]
$execute if data storage meowinternal:temp {FoundMap:1} \
    run tellraw @a ["",{"text":"[VAL] ","color":"dark_purple","bold":true},{"text":"Set the map to ","color":"green"},{"text":"$(map)","color":"aqua"}]

# set spawn points for attackers and defenders with markers
execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run kill @e[tag=VAL_ATKSPAWN]
execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run kill @e[tag=VAL_DEFSPAWN]
execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run summon marker ~ ~ ~ {Tags:["VAL_ATKSPAWN"]}
execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run summon marker ~ ~ ~ {Tags:["VAL_DEFSPAWN"]}
$execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run data modify entity @e[type=marker,tag=VAL_ATKSPAWN,limit=1] Pos set from storage meowinternal:valorant MapData.$(map).AtkSpawnCoords
$execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run data modify entity @e[type=marker,tag=VAL_DEFSPAWN,limit=1] Pos set from storage meowinternal:valorant MapData.$(map).DefSpawnCoords
$execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run data modify entity @e[type=marker,tag=VAL_ATKSPAWN,limit=1] Rotation set from storage meowinternal:valorant MapData.$(map).AtkSpawnRotation
$execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run data modify entity @e[type=marker,tag=VAL_DEFSPAWN,limit=1] Rotation set from storage meowinternal:valorant MapData.$(map).DefSpawnRotation

# make camera marker
execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run kill @e[tag=VAL_CAMERA]
execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run summon marker ~ ~ ~ {Tags:["VAL_CAMERA"]}

$execute if data storage meowinternal:temp {FoundMap:1} \
    run data modify storage meowinternal:valorant CameraCoords set from storage meowinternal:valorant MapData.$(map).CameraCoords
$execute if data storage meowinternal:temp {FoundMap:1} \
    run data modify storage meowinternal:valorant CameraRotation set from storage meowinternal:valorant MapData.$(map).CameraRotation

execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run data modify entity @e[type=marker,tag=VAL_CAMERA,limit=1] Pos set from storage meowinternal:valorant CameraCoords
execute if data storage meowinternal:temp {FoundMap:1} in overworld \
    run data modify entity @e[type=marker,tag=VAL_CAMERA,limit=1] Rotation set from storage meowinternal:valorant CameraRotation

# data remove storage meowinternal:temp QueryCommandMap
# data remove storage meowinternal:temp ExitCode
# data remove storage meowinternal:temp ExitFresh
data remove storage meowinternal:temp StringCompareFailure
kill @e[type=marker,tag=val_stringcompare,limit=1]