extends Node2D

onready var timer = $TickTimer
onready var hud = $HUD
onready var world = $WorldMap

# Preloaded buildings
onready var house = preload("res://Buildings/House.tscn")
onready var mine = preload("res://Buildings/Mine.tscn")
onready var blacksmith = preload("res://Buildings/Blacksmith.tscn")
onready var fishingboat = preload("res://Buildings/FishingBoat.tscn")
onready var well = preload("res://Buildings/Well.tscn")
onready var shop = preload("res://Buildings/Shop.tscn")
onready var woodchop = preload("res://Buildings/Woodchop.tscn")
onready var hunter_shanty = preload("res://Buildings/HunterShanty.tscn")

# Building the player has selected from the button bar
var selected_building = null

func _on_TickTimer_timeout():
	hud.update_labels()
