extends Label

func _ready():
	GameManager.score_updated.connect(update_score)
	text = "Score: 0"

func update_score(new_score):
	text = "Score: " + str(new_score)
