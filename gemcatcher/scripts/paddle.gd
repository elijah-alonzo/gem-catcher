extends CharacterBody2D

@export var speed: float = 500.0

func _process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	var screen_width = get_viewport_rect().size.x
	var paddle_half_width = get_node("Sprite2D").texture.get_width() / 2

	position.x = clamp(position.x, paddle_half_width, screen_width - paddle_half_width)

	move_and_slide()
