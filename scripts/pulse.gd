extends AudioStreamPlayer

@export var bpm := 80
@export var measures := 16 # number of meatures in track
@export var song_path := 'res://assets/music/001_80bpm.wav'

@onready var measure := 1 # current measure playing
@onready var beat := 1 # current beat playing

signal beat_complete(beat)
signal measure_complete(measure)

var sec_per_beat = 60.0 / bpm
var song_position_in_secs = 0.0
var beats_before_start = 0
var last_reported_beat = -1

func _ready():
	stream = load(song_path)
	playing = true

func _process(delta):
	if is_playing():
		song_position_in_secs = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position_in_secs -= AudioServer.get_output_latency()
		beat = int(floor(song_position_in_secs / sec_per_beat)) + beats_before_start
		update_beat_status()

func update_beat_status():
	if last_reported_beat < beat:
		if measure > measures:
			measure = 1

		if beat % 4 == 0:
			measure_complete.emit(measure)
			measure += 1

		beat_complete.emit(beat % 4 + 1)

		last_reported_beat = beat
