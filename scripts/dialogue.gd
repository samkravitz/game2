extends Control
  
@onready var content := get_node("Content") as RichTextLabel
@onready var type_timer := get_node("TypeTimer") as Timer

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	update_message("Hi I was generated for the dialogue system test for the godot game engine")
  
# Update the message and starts typing
func update_message(message: String) -> void:
	content.bbcode_text = message
	content.visible_characters = 0
	type_timer.start()

func _on_type_timer_timeout():
	if content.visible_characters < content.text.length():
		content.visible_characters += 1
	else:
		type_timer.stop()
