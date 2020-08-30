"""
Base interface for all states.
"""
extends Node
class_name State

const SIGNAL_STATE_FINISHED : String = "finished";
signal finished(next_state)

func enter():
	return

func exit():
	return

func handle_input(event):
	return

func update(delta):
	return

func _on_animation_finished(anim_name):
	return

func _next_state(next : String) -> void:
	emit_signal("finished", next)
