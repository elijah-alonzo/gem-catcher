extends Node2D

@export var gem_scene: PackedScene  # Drag your `gem.tscn` here

@onready var timer = $Timer

func _ready():
	timer.timeout.connect(spawn_gem)
	timer.start()

func spawn_gem():
	if gem_scene:
		var gem = gem_scene.instantiate()
		var spawn_x = randf_range(50, get_viewport_rect().size.x - 50)
		gem.position = Vector2(spawn_x, -50)  # Spawns above the screen
		
		# Manually connect body_entered
		gem.connect("body_entered", Callable(gem, "_on_body_entered"))

		get_parent().add_child(gem)
