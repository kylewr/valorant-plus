# tick loop for carrot on a stick

#BEGIN
# detect player right clicks
# execute as @e[scores={meow_carrot=1..}] \
#     if items entity @s weapon.* carrot_on_a_stick[custom_name='["",{"text":"Raze Rocket","color":"gold","italic":false,"bold":true}]',enchantment_glint_override=1] \
#     run scoreboard players add @s meow_temp 1

# calculate projectile motion
execute as @e[scores={meow_carrot=1..}] at @s \
    if items entity @s weapon.* carrot_on_a_stick[custom_name='["",{"text":"Raze Rocket","color":"gold","italic":false,"bold":true}]',enchantment_glint_override=1] \
    run function meowinternal:projectile
#END
execute as @e[scores={meow_carrot=1..}] at @s \
    if items entity @s weapon.* carrot_on_a_stick[custom_name='["",{"text":"Door Key","color":"green","italic":false,"bold":true}]',enchantment_glint_override=1] \
    run say hi


# reset right click counter
scoreboard players reset @e meow_carrot

#BEGIN
# if the water clearing flag is enabled summon a marker
execute if data storage meowinternal:storage {ClearWaterEnable:1b} \
    run summon marker ~ ~ ~ {Tags:["meow_waterclear"]}

# set the marker's position to the exploded tnt's position
execute if data storage meowinternal:storage {ClearWaterEnable:1b} \
    as @e[tag=meow_waterclear,limit=1] at @s \
    run data modify entity @s Pos set from storage meowinternal:storage WaterCoords

# clear the water around the exploded tnt
execute as @e[tag=meow_waterclear,limit=1] at @s \
    run fill ~-1 ~ ~-1 ~1 ~ ~1 air replace water[level=1]

# disable the water clearing flag
execute as @e[tag=meow_waterclear,limit=1] \
    run data merge storage meowinternal:storage {ClearWaterEnable:0b}

# kill the marker
execute as @e[tag=meow_waterclear,limit=1] \
    run kill @s
#END

#BEGIN
# if a raze rocket tnt is on the ground, align it to center of block
execute as @e[tag=meow_razerocket,nbt={OnGround:1b}] at @s \
    align xz \
    run tp @s ~.5 ~ ~.5

# if rocket on ground, fill water around it
execute as @e[tag=meow_razerocket,nbt={OnGround:1b}] at @s \
    run fill ~-1 ~ ~-1 ~1 ~ ~1 water[level=1] replace air
    # run setblock ~ ~ ~ water[level=1] replace

# if rocket, store pre-exploded tnt's position to WaterCoords
execute as @e[tag=meow_razerocket,nbt={OnGround:1b}] at @s \
    run data modify storage meowinternal:storage WaterCoords set from entity @s Pos

# if rocket, set flag to clear water for next loop
execute as @e[tag=meow_razerocket,nbt={OnGround:1b}] at @s \
    run data merge storage meowinternal:storage {ClearWaterEnable:1b}

# if rocket, explode
execute as @e[tag=meow_razerocket,nbt={OnGround:1b}] at @s \
    run data merge entity @s {fuse:0}
#END