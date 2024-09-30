extends Control
  
@onready var content := get_node("Content") as RichTextLabel
@onready var type_timer := get_node("TypeTimer") as Timer

const DIALOGUE_MESSAGES = [
	'N-Ness? Ness... It\'s me, Zelda.',
	'I have come to visit you in a dream.',
	'I need your help... I\'ve been kidnapped, and I need you to rescue me!',
	'You\'ll need our melody to rescue me.',
	'Our melody, you remember it right? How did it go again?',
]

var dialogue_index

func _ready() -> void:
	dialogue_index = 0
	start_message(DIALOGUE_MESSAGES[dialogue_index])
  
# Update the message and starts typing
func start_message(message: String) -> void:
	content.bbcode_text = message
	content.visible_characters = 0
	type_timer.start()

func _on_type_timer_timeout():
	if content.visible_characters < content.text.length():
		content.visible_characters += 1
	else:
		type_timer.stop()
