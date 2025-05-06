class_name Game
extends Node3D


const COLLECTABLE_OBJECT = preload("res://collectable_object.tscn")
const COLLECTABLE_OBJECT_SPAWN_SPREAD = 4.0

@export var collectable_object_spawn_delay = 3.0  # In seconds

var rng := RandomNumberGenerator.new()
var score: int = 0

@onready var collectable_objects = %CollectableObjects
@onready var collectable_object_spawner = %CollectableObjectSpawner
@onready var collectable_object_timer = %CollectableObjectTimer


func _ready():
	collectable_object_timer.wait_time = collectable_object_spawn_delay
	collectable_object_timer.start()

func _on_collectable_object_timer_timeout():
	var _co = COLLECTABLE_OBJECT.instantiate()
	_co.position = collectable_object_spawner.position
	_co.position.x += rng.randf_range(-COLLECTABLE_OBJECT_SPAWN_SPREAD, COLLECTABLE_OBJECT_SPAWN_SPREAD)
	collectable_objects.add_child(_co)
	print_debug("Yoink")

func _on_player_gain_score(_score):
	score += _score
	print_debug(score)
