extends Node

onready var _states : StateMachine = $States

func _ready():
	_states.initialize(_states.START_STATE)
