extends Node

var score = 0
var top_scores = []
@onready var claim_sound = $Node2D/Claim

const SAVE_PATH = "user://leaderboard.save"

signal score_updated(new_score)
signal game_over

func add_point():
	score += 1
	score_updated.emit(score)  
	
	var sound_player = AudioStreamPlayer2D.new()
	sound_player.stream = preload("res://resources/spell1_0.wav")
	sound_player.volume_db = 0
	get_tree().current_scene.add_child(sound_player)
	sound_player.play()
	sound_player.finished.connect(func(): sound_player.queue_free())

func end_game():
	var sound_player = AudioStreamPlayer2D.new()
	sound_player.stream = preload("res://resources/spell1_0.wav")
	sound_player.volume_db = 0
	get_tree().current_scene.add_child(sound_player)
	

	game_over.emit()
	sound_player.play()
	save_score(score)
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
	
func reset_game():
	score = 0  # Reset the score
	score_updated.emit(score)  # Update UI if needed


func save_score(new_score):
	load_scores()
	top_scores.append(new_score)
	top_scores.sort()
	top_scores.reverse()
	top_scores = top_scores.slice(0, 5)

	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(top_scores)
	file.close()

func load_scores():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		top_scores = file.get_var()
		file.close()
	else:
		top_scores = []
