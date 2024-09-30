extends Control
  
@onready var content := get_node("Content") as RichTextLabel
@onready var type_timer := get_node("TypeTimer") as Timer

const DIALOGUE_MESSAGES = [
	'N-Ness? Ness... It\'s me, Zelda.',
	'I have come to visit you in a dream.',
	'I need your help... I\'ve been kidnapped, and I need you to rescue me.',
	'You\'ll need our melody to rescue me.',
	'Our melody, you remember it, don\'t you? How did it go again?',
]

var dialogue_index

signal dialogue_finished

func _ready():
	dialogue_index = 0
	start_message(DIALOGUE_MESSAGES[dialogue_index])

func _process(_delta):
	if $Label.is_visible():
		if Input.is_action_pressed('space'):
			if dialogue_index == DIALOGUE_MESSAGES.size() - 1:
				dialogue_finished.emit()
			else:
				dialogue_index += 1
				start_message(DIALOGUE_MESSAGES[dialogue_index])
  
func start_message(message: String) -> void:
	$Label.hide()
	content.bbcode_text = message
	content.visible_characters = 0
	type_timer.start()

func _on_type_timer_timeout():
	if content.visible_characters < content.text.length():
		content.visible_characters += 1
	else:
		$Label.show()
		type_timer.stop()
