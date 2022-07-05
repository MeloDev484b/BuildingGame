extends Node

onready var buttons = get_parent().get_node("ButtonPanel")
onready var resources = get_parent().get_node("ResourcesPanel")
onready var cursor = get_parent().get_node("MouseCursor")
onready var hud = get_parent()

var building = false

func _ready():
	pass

# Get player input
func _input(event):
	if (Input.is_action_just_pressed("hide_buttons")):
		if (!buttons.get_visibility() && !building):
			buttons.set_visibility(true)
		else:
			buttons.set_visibility(false)
		
	if (Input.is_action_just_pressed("hide_resources")):
		if (!resources.get_visibility() && !building):
			resources.set_visibility(true)
		else:
			resources.set_visibility(false)
	
	if (Input.is_action_just_pressed("ui_cancel") || Input.is_action_just_pressed("r_click")):
		cancel_building()
	
	if (Input.is_action_just_pressed("l_click")):
		place_building(hud.main.selected_building)

# TODO Make this talk to the TileMap for grid-placement
# TODO Check that button panel is not located below before placement
func place_building(building):
	if (hud.main.selected_building != null):
		var building_instance = hud.main.selected_building.instance()
		building_instance.position = get_viewport().get_mouse_position()
		get_parent().get_parent().add_child(building_instance)
		# Add control to allow multiple placements of the same scene
		hud.main.selected_building = null
		building = false
		buttons.set_visibility(true)
		cursor.reset_cursor()

func is_building_selected():
	return !hud.main.selected_building == null

func set_selected_building(building):
	hud.main.selected_building = building

func _on_HUD_is_building():
	buttons.set_visibility(false)
	building = true

func cancel_building():
	hud.main.selected_building = null
	cursor.reset_cursor()
	building = false
	buttons.set_visibility(true)
