class_name Game
extends Node3D


const COLLECTABLE_OBJECT = preload("res://collectable_object.tscn")
const COLLECTABLE_OBJECT_SPAWN_SPREAD = 4.0

@export var collectable_object_spawn_delay = 3.0  # In seconds

var rng := RandomNumberGenerator.new()

@onready var collectable_objects = %CollectableObjects
@onready var collectable_object_spawner = %CollectableObjectSpawner
@onready var collectable_object_timer = %CollectableObjectTimer
@onready var main_menu = %MainMenu


func _ready():
	GameSignals.gain_score.connect(gain_score)
	GameSignals.loose_life_point.connect(loose_life_point)
	GameSignals.game_begin.connect(game_begin)
	GameSignals.game_over.connect(game_over)

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
	GameState.score += score
	print_debug(GameState.score)

func loose_life_point():
	GameState.lifes -= 1
	print_debug(GameState.lifes)
	if GameState.lifes <= 0:
		GameSignals.game_over.emit()
		print_debug("Player lost.")

func game_begin():
	GameState.reset_game()
	main_menu.visible = false
	GameState.game_paused = false
	self.collectable_object_timer.wait_time = self.collectable_object_spawn_delay
	self.collectable_object_timer.start()

func game_over():
	GameState.game_paused = true
	main_menu.visible = true
	self.collectable_object_timer.stop()

func _on_new_game_button_pressed():
	GameSignals.game_begin.emit()

func _on_exit_game_button_pressed():
	get_tree().quit()
