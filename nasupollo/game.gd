class_name Game
extends Node3D


const COLLECTABLE_OBJECT = preload("res://collectable_object.tscn")
const COLLECTABLE_OBJECT_SPAWN_SPREAD = 4.0

@export var collectable_object_spawn_delay = 3.0  # In seconds
@export var start_lives = 3
@export var start_score = 0

var rng := RandomNumberGenerator.new()
var score: int = 0
var lifes: int = 0

@onready var collectable_objects = %CollectableObjects
@onready var collectable_object_spawner = %CollectableObjectSpawner
@onready var collectable_object_timer = %CollectableObjectTimer


func reset_game():
	self.lifes = self.start_lives
	self.score = self.start_score

func _ready():
	self.reset_game()
	GameSignals.gain_score.connect(gain_score)
	GameSignals.loose_life_point.connect(loose_life_point)
	self.collectable_object_timer.wait_time = self.collectable_object_spawn_delay
	self.collectable_object_timer.start()

func _on_collectable_object_timer_timeout():
	var _co = self.COLLECTABLE_OBJECT.instantiate()
	_co.position = self.collectable_object_spawner.position
	_co.position.x += self.rng.randf_range(
		-self.COLLECTABLE_OBJECT_SPAWN_SPREAD, 
		self.COLLECTABLE_OBJECT_SPAWN_SPREAD
	)
	self.collectable_objects.add_child(_co)
	print_debug("Yoink")

func gain_score(score):
	self.score += score
	print_debug(self.score)

func loose_life_point():
	self.lifes -= 1
	print_debug(self.lifes)
	if self.lifes <= 0:
		print_debug("Player lost.")
