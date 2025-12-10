
$execute store success storage meowinternal:storage TeamCreateSuccess int 1 run team join $(name) @s

$execute if data storage meowinternal:storage {TeamCreateSuccess:1} \
    run tellraw @s ["",{"text":"[MEOW] ","color":"light_purple","bold":true},{"text":"You have joined the team ","color":"yellow"},{"text":"$(name)","color":"aqua"},{"text":"!","color":"yellow"}]

$execute if data storage meowinternal:storage {TeamCreateSuccess:0} \
    run tellraw @s ["",{"text":"[MEOW] ","color":"light_purple","bold":true},{"text":"Failed to join the team ","color":"red"},{"text":"$(name)","color":"aqua"},{"text":"!","color":"red"}]

# data remove storage meowinternal:storage TeamCreateSuccess