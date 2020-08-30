class_name InputActions

###
# Input action helpers.
###

const INPUT_ACTION_MOVE_LEFT : String = "move_left"
const INPUT_ACTION_MOVE_RIGHT : String = "move_right"
const INPUT_ACTION_MOVE_UP : String = "move_up"
const INPUT_ACTION_MOVE_DOWN : String = "move_down"

enum Direction { Left, Right, Up, Down }

static func get_input_action_name(direction) -> String:
	if (direction == Direction.Left): return INPUT_ACTION_MOVE_LEFT
	if (direction == Direction.Right): return INPUT_ACTION_MOVE_RIGHT
	if (direction == Direction.Up): return INPUT_ACTION_MOVE_UP
	if (direction == Direction.Down): return INPUT_ACTION_MOVE_DOWN
	return ""

static func is_direction_pressed(direction) -> bool:
	return Input.is_action_pressed(get_input_action_name(direction))
	
static func get_input_directions() -> Vector2:
	var input_direction : Vector2 = Vector2()
	input_direction.x = int(is_direction_pressed(Direction.Right)) - int(is_direction_pressed(Direction.Left))
	input_direction.y = int(is_direction_pressed(Direction.Down)) - int(is_direction_pressed(Direction.Up))
	return input_direction
