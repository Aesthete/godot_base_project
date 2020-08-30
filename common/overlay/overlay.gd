extends ColorRect

class_name DarkenedOverlay

onready var _timer : Timer = $Timer
enum FadeDirection { In, Out, None }
var _fade_direction = FadeDirection.Out

const FadeSpeed = 7.5
var _start_fade_time = 1.0

signal FadeComplete()

func _ready():
	_timer.connect("timeout", self, "_timeout")
	set_size(get_viewport().size)

func _timeout():
	emit_signal("FadeComplete")

func fade_in(fade_time = 5.0):
	fade(fade_time, FadeDirection.In)
	
func fade_out(fade_time = 5.0):
	fade(fade_time, FadeDirection.Out)

func force(dir):
	_fade_direction = FadeDirection.None
	_timer.stop()
	color.a = 1.0 if dir == FadeDirection.In else 0.0
	
func fade(time, dir):
	_fade_direction = dir
	_start_fade_time = time / FadeSpeed
	_timer.start(_start_fade_time)

func _process(delta):
	if _fade_direction == FadeDirection.In:
		color.a = (_timer.time_left / _start_fade_time)
	else:
		color.a = abs((_timer.time_left / _start_fade_time) - 1.0)
