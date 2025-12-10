
# Types:
# 0: Float Wand
# 1: Levitate Wand
# 2: Speed wand

# $data merge storage meow:commandstorage {Wands:"$(type)"}
$scoreboard players set #wandstemp meow_temp $(type)

# 0: float
# floatWandName = "bleh"
execute if score #wandstemp meow_temp matches 0 run \ 
    give @s minecraft:blaze_rod[minecraft:custom_name='["",{"text":"Wand of Magical Floatations","color":"light_purple","italic":false,"bold":true}]',minecraft:enchantment_glint_override=1]
execute if score #wandstemp meow_temp matches 0 run \ 
    tellraw @s ["",{"text":"[MEOW] ","color":"light_purple","bold":true},{"text":"You have been given the","color":"yellow"},{"text":" Wand of Magical Floatations","color":"aqua"},{"text":"! Hold the item in your hand and walk around to use.","color":"yellow"}]

# 1: levi
execute if score #wandstemp meow_temp matches 1 run \
    give @s minecraft:stick[minecraft:custom_name='["",{"text":"Wand of Levitation","color":"light_purple","italic":false,"bold":true}]',minecraft:enchantment_glint_override=1]
execute if score #wandstemp meow_temp matches 1 run \
    tellraw @s ["",{"text":"[MEOW] ","color":"light_purple","bold":true},{"text":"You have been given the","color":"yellow"},{"text":" Wand of Levitation","color":"aqua"},{"text":"! Hold the item in your hand to levitate.","color":"yellow"}]

# 2: speed
execute if score #wandstemp meow_temp matches 2 run \
    give @s minecraft:stick[minecraft:custom_name='["",{"text":"Wand of Speed","color":"light_purple","italic":false,"bold":true}]',minecraft:enchantment_glint_override=1]
execute if score #wandstemp meow_temp matches 2 run \
    tellraw @s ["",{"text":"[MEOW] ","color":"light_purple","bold":true},{"text":"You have been given the","color":"yellow"},{"text":" Wand of Speed","color":"aqua"},{"text":"! Hold the item in your hand to run faster.","color":"yellow"}]

scoreboard players reset #wandstemp meow_temp