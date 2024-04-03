extends state

var can_jump = true
func update(delta):
	Player.gravity(delta)
	player_movement()
	if Player.is_on_floor():
		return STATES.IDLE
	if Player.jump_input_actuation and can_jump:
		return STATES.JUMP
	return null

