extends Control

@onready var labels = [
	$VBoxContainer/Label,
	$VBoxContainer/Label2,
	$VBoxContainer/Label3,
	$VBoxContainer/Label4,
	$VBoxContainer/Label5
]
@onready var main_menu_button = $VBoxContainer/MainMenuButton

func _ready():
	GameManager.load_scores()
	for i in range(labels.size()):
		if i < GameManager.top_scores.size():
			labels[i].text = str(i + 1) + ". " + str(GameManager.top_scores[i])
		else:
			labels[i].text = str(i + 1) + ". ---"

	main_menu_button.pressed.connect(_on_main_menu_pressed)

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
