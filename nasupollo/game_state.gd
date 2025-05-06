extends Node


const START_LIFES = 3
const START_SCORE = 0

var score: int = 0 :
	set(value):
		score = value
	get:
		return score
var lifes: int = 3 :
	set(value):
		lifes = value
	get:
		return lifes
var game_paused: bool = true :
	set(value):
		game_paused = value
	get:
		return game_paused


func reset_game():
	self.lifes = self.START_LIFES
	self.score = self.START_SCORE
