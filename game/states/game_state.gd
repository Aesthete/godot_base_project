extends State
class_name GameState

export(PackedScene) var StateScene

onready var _world_root = owner.get_node("World")

var _scene : Node

func enter():
	_scene = StateScene.instance()
	_world_root.add_child(_scene)
	
func exit():	
	_world_root.remove_child(_scene)
