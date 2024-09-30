extends Area2D

@export var zelda_scene: PackedScene
@export var dialogue_scene: PackedScene
var dialogue: Node

func _ready():
	$ZeldaTimer.start()

func _process(delta):
	pass

func _on_zelda_timer_timeout():
	var zelda = zelda_scene.instantiate()
	zelda.zelda_done_walking.connect(_on_zelda_done_walking)
	add_child(zelda)

func _on_zelda_done_walking():
	dialogue = dialogue_scene.instantiate()
	dialogue.dialogue_finished.connect(_on_dialogue_finished)
	add_child(dialogue)

func _on_dialogue_finished():
	dialogue.queue_free()
	
