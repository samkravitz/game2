extends Control

enum KeyState {
	KEY_NONE,
	KEY_UP,
	KEY_DOWN,
	KEY_LEFT,
	KEY_RIGHT,
	KEY_SPACE,
}

var state: KeyState
var can_play_note := true

@onready var player := $AudioStreamPlayer
@onready var notes := []

func _ready():
	state = KeyState.KEY_NONE

func _process(delta):
	if can_play_note:
		if Input.is_action_pressed('up'):
			can_play_note = false
			player.stream = preload('res://assets/piano-d4.wav')
			calculate_note_position(KeyState.KEY_UP)
			player.play()
			$NoteTimer.start()
		if Input.is_action_pressed('down'):
			can_play_note = false
			calculate_note_position(KeyState.KEY_DOWN)
			player.stream = preload('res://assets/piano-f3.wav')
			player.play()
			$NoteTimer.start()
		if Input.is_action_pressed('space'):
			can_play_note = false
			calculate_note_position(KeyState.KEY_SPACE)
			player.stream = preload('res://assets/piano-d3.wav')
			player.play()
			$NoteTimer.start()
		if Input.is_action_pressed('left'):
			can_play_note = false
			calculate_note_position(KeyState.KEY_LEFT)
			player.stream = preload('res://assets/piano-b4.mp3')
			player.play()
			$NoteTimer.start()
		if Input.is_action_pressed('right'):
			can_play_note = false
			calculate_note_position(KeyState.KEY_RIGHT)
			player.stream = preload('res://assets/piano-a3.wav')
			player.play()
			$NoteTimer.start()

func calculate_note_position(note: KeyState):
	var x = 0
	var y = 0
	
	var node = Sprite2D.new()

	if note == KeyState.KEY_UP:
		node.texture = preload('res://assets/melody_button_arrow.png')
		node.rotation = -PI/2
		node.position.y = 7
	elif note == KeyState.KEY_DOWN:
		node.position.y = 70
		node.texture = preload('res://assets/melody_button_arrow.png')
		node.rotation = PI/2
	elif note == KeyState.KEY_LEFT:
		node.position.y = 36
		node.texture = preload('res://assets/melody_button_arrow.png')
		node.rotation = PI
	elif note == KeyState.KEY_RIGHT:
		node.position.y = 49
		node.texture = preload('res://assets/melody_button_arrow.png')
	else:
		node.position.y = 102
		node.texture = preload('res://assets/melody_button_space.png')

	node.scale = Vector2(2, 2)
	node.position.x = 250 + notes.size() * 60

	notes.push_back(note)
	add_child(node)

func _on_note_timer_timeout():
	can_play_note = true
