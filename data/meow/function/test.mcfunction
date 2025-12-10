
execute in the_end run kill @e[tag=VAL_TPBUFFER]
execute in the_end run summon marker ~ ~ ~ {Tags:["VAL_TPBUFFER"]}
data modify entity @e[tag=VAL_TPBUFFER,limit=1] Pos set from storage meowinternal:valorant CameraCoords
data modify entity @e[tag=VAL_TPBUFFER,limit=1] Rotation set from storage meowinternal:valorant CameraRotation
tp @a[tag=VAL_EVERYONE] @e[tag=VAL_TPBUFFER,limit=1]
execute in overworld as @a[tag=VAL_EVERYONE] run tp ~ ~ ~