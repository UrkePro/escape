extends Node

var player
var side
var score = 500
var level = 0
var hat = "default"
var hatown = ["default"]

const levels = [
	"res://scenes/levels/yourmom.tscn",
	"res://scenes/levels/level1.tscn",
	"res://scenes/levels/level2.tscn",
	#"res://scenes/levels/level3.tscn"
]

const hats = {
	"default": 0,
	"crown": 50,
	"santa_hat": 65,
	"viking_hat": 70,
	"amogus_hat": 85,
	"fedora": 100,
	"gold_fedora": 150
}

func _ready():
	load_game()
	OS.set_window_fullscreen(true)

func loadLevel(lvl = level):
	if lvl == 0:
		get_tree().change_scene(levels[0])
		return
	if len(levels) > lvl:
		level = lvl
	get_tree().change_scene(levels[level])

func nextLevel():
	if len(levels) > level + 1:
		level += 1
	loadLevel()

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json({
		"score" : score,
		"level" : level,
		"hat": hat,
		"hatown": hatown
	}))
	save_game.close()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	save_game.open("user://savegame.save", File.READ)
	var data = parse_json(save_game.get_line())
	score = data.score if "score" in data else 0
	level = data.level if "level" in data else 1
	hat = data.hat if "hat" in data else "default"
	hatown = data.hatown if "hatown" in data else ["default"]
	save_game.close()

func select_hat(selected_hat):
	if hatown.has(selected_hat):
		hat = selected_hat
		return
	if score >= hats[selected_hat]:
		hat = selected_hat
		score -= hats[hat]
		hatown.append(hat)
