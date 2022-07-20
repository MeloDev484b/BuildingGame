extends Building
class_name House

signal starving

var recipe = "house"

var residents = 4

var compatible_tiles = [12, 14]

onready var residentLabel = $ResidentCount/ResidentLabel

func _ready():
	resource = RESIDENTS

# Override
func consume_resources():
	var current_water = PlayerResources.get_water()
	var current_food = PlayerResources.get_food()
	if (current_water > 4 && current_food > 4):
		if (residents < 4):
			residents += 1
		PlayerResources.set_water(current_water - residents)
		PlayerResources.set_food(current_food - residents)
	if (residents == 0):
		queue_free()
	if (current_water < 4 || current_food < 4):
		residents -= 1
		emit_signal("starving")
		print("starving")
	update_residentLabel()

func update_residentLabel():
	residentLabel.text = str(residents) + "/4"

func get_compatible_tiles():
	return compatible_tiles
