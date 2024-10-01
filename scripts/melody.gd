extends Control

enum KeyState {
	KEY_NONE,
	KEY_UP,
	KEY_LEFT,
	KEY_RIGHT,
	KEY_SPACE,
}

var state: KeyState
var can_play_note := true
@onready var player := $AudioStreamPlayer

func _ready():
	state = KeyState.KEY_NONE

func _process(delta):
	if can_play_note:
		if Input.is_action_pressed('up'):
			can_play_note = false
			player.stream = preload('res://assets/piano-d4.wav')
			player.play()
			$NoteTimer.start()
		if Input.is_action_pressed('down'):
			can_play_note = false
			player.stream = preload('res://assets/piano-f3.wav')
			player.play()
			$NoteTimer.start()
		if Input.is_action_pressed('space'):
			can_play_note = false
			player.stream = preload('res://assets/piano-d3.wav')
			player.play()
			$NoteTimer.start()
		if Input.is_action_pressed('left'):
			can_play_note = false
			player.stream = preload('res://assets/piano-b4.mp3')
			player.play()
			$NoteTimer.start()
		if Input.is_action_pressed('right'):
			can_play_note = false
			player.stream = preload('res://assets/piano-a3.wav')
			player.play()
			$NoteTimer.start()


func _on_note_timer_timeout():
	can_play_note = true
