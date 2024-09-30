extends Area2D

const SPEED = 80

enum ZeldaState {
	WALKING,
	STANDING,
}

var state

signal zelda_done_walking

func _ready():
	$AnimatedSprite2D.play("walk")
	state = ZeldaState.WALKING

func _process(delta):
	if state == ZeldaState.WALKING:
		position.x += delta * SPEED
		if position.x >= 320:
			state = ZeldaState.STANDING
			$AnimatedSprite2D.play("stand")
			zelda_done_walking.emit()
