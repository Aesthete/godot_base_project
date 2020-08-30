extends StateMachine

func _ready():	
	states_map = {
		"splash": $Splash,
		"menu": $Menu,
		"tutorial": $Tutorial,
		"game": $Game,
		"credits": $Credits
	}
