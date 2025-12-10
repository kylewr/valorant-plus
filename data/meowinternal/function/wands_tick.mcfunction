# 0: float
execute as @e[tag=!nomeow] at @s if items entity @s weapon.* \
    minecraft:blaze_rod[minecraft:custom_name='["",{"text":"Wand of Magical Floatations","color":"light_purple","italic":false,"bold":true}]',minecraft:enchantment_glint_override=1] \
    run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 sea_lantern replace air

# execute as @e[tag=!nomeow] at @s if items entity @s weapon.* \
#     minecraft:blaze_rod[minecraft:custom_name='["",{"text":"Wand of Magical Floatations","color":"light_purple","italic":false,"bold":true}]',minecraft:enchantment_glint_override=1] \
#     run kill @e[distance=..8,type=item,nbt={Item:{id:"minecraft:big_dripleaf"}}]

# 1: levi
execute as @e[tag=!nomeow] at @s if items entity @s weapon.* \
    minecraft:stick[minecraft:custom_name='["",{"text":"Wand of Levitation","color":"light_purple","italic":false,"bold":true}]',minecraft:enchantment_glint_override=1] \
    run effect give @s minecraft:levitation infinite 15 true

execute as @e[tag=!nomeow] at @s unless items entity @s weapon.* \
    minecraft:stick[minecraft:custom_name='["",{"text":"Wand of Levitation","color":"light_purple","italic":false,"bold":true}]',minecraft:enchantment_glint_override=1] \
    run effect clear @s minecraft:levitation

# 2: speed
execute as @e[tag=!nomeow] at @s if items entity @s weapon.* \
    minecraft:stick[minecraft:custom_name='["",{"text":"Wand of Speed","color":"light_purple","italic":false,"bold":true}]',minecraft:enchantment_glint_override=1] \
    run effect give @s minecraft:speed infinite 10 true

execute as @e[tag=!nomeow] at @s unless items entity @s weapon.* \
    minecraft:stick[minecraft:custom_name='["",{"text":"Wand of Speed","color":"light_purple","italic":false,"bold":true}]',minecraft:enchantment_glint_override=1] \
    run effect clear @s minecraft:speed
