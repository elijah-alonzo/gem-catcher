extends Area2D

@export var fall_speed: float = 150.0
@onready var claim_sound = %Claim

func _process(delta):
	position.y += fall_speed * delta
	if position.y > get_viewport_rect().size.y:
		GameManager.end_game()
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("paddle"):
		if claim_sound:
			claim_sound.play() 
		GameManager.add_point()
		queue_free()
