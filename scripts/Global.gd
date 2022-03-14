extends Node

var player
var side
var score = 100
var level = 0
var crown = false

const levels = [
	"res://scenes/levels/yourmom.tscn",
	"res://scenes/levels/level1.tscn",
	"res://scenes/levels/level2.tscn"
]

func loadLevel(lvl = level):
	if len(levels) > lvl:
		level = lvl
	get_tree().change_scene(levels[level])

func nextLevel():
	if len(levels) > level + 1:
		level += 1
	loadLevel()

