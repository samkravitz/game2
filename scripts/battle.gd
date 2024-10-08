extends Node2D

func _ready():
	$Pulse.beat_complete.connect(_on_pulse_beat_complete)
	$Pulse.measure_complete.connect(_on_pulse_measure_complete)

func _on_pulse_beat_complete(beat):
	print('beat: {beat}'.format({'beat': beat}))

func _on_pulse_measure_complete(measure):
	print('measure: {measure}'.format({'measure': measure}))
