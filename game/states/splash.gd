extends GameState

onready var _timer : Timer = $Timer

func enter():
	.enter()
	GUISignals.emit_signal("StartFadeInRequested", 5.0)
	_timer.connect("timeout", self, "_splash_end")

func _splash_end():
	_next_state("game")
