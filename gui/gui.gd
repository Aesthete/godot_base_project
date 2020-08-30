extends Node

# GUI Singleton.

onready var _controller = $"../Main/GUI"
onready var _overlay = $"../Main/GUI/DarkenedOverlay"

func _ready():
	GUISignals.connect("StartFadeInRequested", _overlay, "fade_in")
	GUISignals.connect("StartFadeOutRequested", _overlay, "fade_out")
