
summon marker ~ ~ ~ {Tags:["direction"]}
execute as @e[tag=direction,limit=1] positioned 0.0 0.0 0.0 run function meowinternal:get_motion

execute anchored eyes run summon tnt ^ ^ ^1 {fuse:80,Tags:["projectile"]}
# execute anchored eyes run summon fireball ^ ^ ^1 {ExplosionPower:100,Tags:["projectile"]}

data modify entity @e[tag=projectile,limit=1,sort=nearest] Motion set from storage meowinternal:storage Motion

tag @e[tag=projectile] add meow_razerocket
tag @e[tag=projectile] remove projectile