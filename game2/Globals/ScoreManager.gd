extends Node

const SCOPES_PATH: String = "user://tappy.tres"

var _high_score: int = 0
var high_score: int:
	get:
		return _high_score
	set(value):
		if value > _high_score:
			_high_score = value

func _ready() -> void:
	load_high_score()
	
func load_high_score() -> void:
	if ResourceLoader.exists(SCOPES_PATH) == true:
		var hsr: HighScoreResource = load(SCOPES_PATH)
		if hsr:
			_high_score = hsr.high_score
			
func get_high_score() -> int:
	if ResourceLoader.exists(SCOPES_PATH) == true:
		var hsr: HighScoreResource = load(SCOPES_PATH)
		if hsr:
			return hsr.high_score
	
	return 0

func save_high_score() -> void:
	var his_high_score = get_high_score()
	print(his_high_score)
	print(_high_score)
	if _high_score > his_high_score:
		var his: HighScoreResource = HighScoreResource.new()
		his.high_score = _high_score
		ResourceSaver.save(his, SCOPES_PATH)
