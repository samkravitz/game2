extends Area2D

const SPEED = 20

enum ZeldaState {
	WALKING,
	STANDING,
}

var state

func _ready():
	$AnimatedSprite2D.play("walk")
	state = ZeldaState.WALKING

func _process(delta):
	if state == ZeldaState.WALKING:
		position.x += delta * SPEED
		if position.x >= 80:
			state = ZeldaState.STANDING
			$AnimatedSprite2D.play("stand")
