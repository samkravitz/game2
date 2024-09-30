extends Area2D

@export var zelda_scene: PackedScene

func _ready():
	$ZeldaTimer.start()

func _process(delta):
	pass

func _on_zelda_timer_timeout():
	var zelda = zelda_scene.instantiate()
	zelda.zelda_done_walking.connect(_on_zelda_done_walking)
	add_child(zelda)

func _on_zelda_done_walking():
	print('done!')
	
