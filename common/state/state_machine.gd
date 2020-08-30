extends Node
class_name StateMachine

"""
You must set a starting node from the inspector or on
the node that inherits from this state machine interface
If you don't the game will crash (on purpose, so you won't 
forget to initialize the state machine)
"""
export(NodePath) var START_STATE
var states_map = {}

var states_stack : Array = []
var current_state : State = null
var _active : bool = false setget set_active

func _ready():
	for child in get_children():
		child.connect(State.SIGNAL_STATE_FINISHED, self, "_change_state")

func initialize(start_state : NodePath):
	set_active(true)
	states_stack.push_front(get_node(start_state))
	current_state = states_stack[0]
	current_state.enter()
	OS.set_window_title("Game state: " + current_state.name)

func set_active(value : bool):
	_active = value
	set_physics_process(value)
	set_process_input(value)
	if not _active:
		states_stack = []
		current_state = null

func _input(event):
	if not _active or not current_state: return
	if current_state: current_state.handle_input(event)

func _physics_process(delta : float):
	if not _active or not current_state: return
	if current_state: current_state.update(delta)

func _on_animation_finished(anim_name : String):
	if not _active or not current_state: return
	current_state._on_animation_finished(anim_name)

func _change_state(state_name : String):
	if not _active or not current_state: return
		
	# Always exit the current state.
	current_state.exit()
	
	# If the provided state is null, pop the state.
	if state_name == null:
		states_stack.pop_front()
	# Otherwise, set the state we want to change to.
	else:
		states_stack[0] = states_map[state_name]
	
	# this is now the current state.
	current_state = states_stack[0]
	
	# If there is valid state now (could be popped to none) - enter it.
	if state_name != null:
		current_state.enter()
		OS.set_window_title("Game state: " + current_state.name)
