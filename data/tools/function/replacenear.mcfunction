$fill ~18 ~18 ~ ~-18 ~-18 ~18 minecraft:$(to) replace minecraft:$(from)
$fill ~18 ~18 ~ ~-18 ~-18 ~-18 minecraft:$(to) replace minecraft:$(from)

$kill @e[distance=..18,type=item,nbt={Item:{id:"minecraft:$(from)"}}]
