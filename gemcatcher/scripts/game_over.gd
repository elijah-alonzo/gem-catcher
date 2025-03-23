extends Control

@onready var score_label = $VBoxContainer/Label2 
@onready var restart_button = $VBoxContainer/Button
@onready var main_menu_button = $VBoxContainer/Button2

func _ready():
	await get_tree().process_frame 
	
	
	var sound_player = AudioStreamPlayer2D.new()
	sound_player.stream = preload("res://resources/explode.wav")
	sound_player.volume_db = 0
	get_tree().current_scene.add_child(sound_player)
	sound_player.play()
	sound_player.finished.connect(func(): sound_player.queue_free())
	
	score_label.text = "Final Score: " + str(GameManager.score)
	restart_button.pressed.connect(_on_restart_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)

func _on_restart_pressed():
	GameManager.reset_game() 
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")  

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn") 
