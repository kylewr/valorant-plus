scoreboard objectives remove meow_title_tick

scoreboard objectives add meow_title_tick dummy
scoreboard players set #TICK meow_title_tick 0
# scoreboard players set #TYP2 meow_title_tick -1

kill @e[type=marker,tag=meow_title]

$summon marker 0 0 0 {Tags:["meow_title","meow_title_1"],CustomName:'$(1)'}
$summon marker 0 0 0 {Tags:["meow_title","meow_title_2"],CustomName:'$(2)'}
$summon marker 0 0 0 {Tags:["meow_title","meow_title_3"],CustomName:'$(3)'}
$summon marker 0 0 0 {Tags:["meow_title","meow_title_4"],CustomName:'$(4)'}
$summon marker 0 0 0 {Tags:["meow_title","meow_title_5"],CustomName:'$(5)'}
$summon marker 0 0 0 {Tags:["meow_title","meow_title_6"],CustomName:'$(6)'}
$summon marker 0 0 0 {Tags:["meow_title","meow_title_7"],CustomName:'$(7)'}
$summon marker 0 0 0 {Tags:["meow_title","meow_title_8"],CustomName:'$(8)'}

title @a[tag=meow_displaytitle] times 0s 3s 1s