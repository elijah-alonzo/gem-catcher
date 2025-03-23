extends Control

@onready var start_button = $VBoxContainer/StartButton
@onready var leaderboard_button = $VBoxContainer/LeaderboardsButton
@onready var quit_button = $VBoxContainer/QuitButton

func _ready():
	start_button.pressed.connect(_on_start_pressed)
	leaderboard_button.pressed.connect(_on_leaderboard_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")

func _on_leaderboard_pressed():
	get_tree().change_scene_to_file("res://scenes/leaderboards.tscn")

func _on_quit_pressed():
	get_tree().quit()
