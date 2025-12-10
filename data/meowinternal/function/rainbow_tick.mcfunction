execute as @e[scores={meow_rainbow=5..}] \
    if items entity @e armor.head minecraft:red_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:orange_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=10..}] \
    if items entity @e armor.head minecraft:orange_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:yellow_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=15..}] \
    if items entity @e armor.head minecraft:yellow_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:lime_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=20..}] \
    if items entity @e armor.head minecraft:lime_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:green_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=25..}] \
    if items entity @e armor.head minecraft:green_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:cyan_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=30..}] \
    if items entity @e armor.head minecraft:cyan_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:light_blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=35..}] \
    if items entity @e armor.head minecraft:light_blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=40..}] \
    if items entity @e armor.head minecraft:blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:purple_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=45..}] \
    if items entity @e armor.head minecraft:purple_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:magenta_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=50..}] \
    if items entity @e armor.head minecraft:magenta_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:pink_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=55..}] \
    if items entity @e armor.head minecraft:pink_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run item replace entity @s armor.head with minecraft:red_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]']

execute as @e[scores={meow_rainbow=55..}] \
    run scoreboard players set @s meow_rainbow 2

execute as @e[scores={meow_rainbow=1..}] run scoreboard players add @s meow_rainbow 1

execute as @e[scores={meow_rainbow=1..}] \
    unless items entity @s armor.head minecraft:red_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:orange_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:yellow_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:lime_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:green_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:cyan_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:light_blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:purple_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:magenta_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    unless items entity @s armor.head minecraft:pink_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
    run scoreboard players set @s meow_rainbow -2

# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:red_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:red_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:red_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:orange_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:orange_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:orange_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:yellow_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:yellow_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:yellow_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:lime_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:lime_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:lime_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:green_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:green_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:green_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:cyan_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:cyan_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:cyan_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:light_blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:light_blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:light_blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:blue_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:purple_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:purple_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:purple_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:magenta_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:magenta_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:magenta_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1
# execute \
#     as @a[scores={meow_rainbow=..-1}] \
#     if items entity @s inventory.* minecraft:pink_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     unless items entity @s armor.head minecraft:pink_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] \
#     run clear @s minecraft:pink_stained_glass[custom_name='["",{"text":"Ruffr\'s Rainbow Helm","color":"yellow","italic":false,"bold":true}]'] 1