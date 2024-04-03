extends Node 
class_name state

##Esta clase es la [i]maquina de estados[/i] la cual se encarga de gestionar la entra, salida y el update de cada clase, ademas es la clase de la cual heredan todos los estados
##
##Las funciones creadas en esta clase son 3 y se utilizaran para controlar que pasa en cada momento con los estados
##[br] [b]enter_state()[/b] [br] [b]exit_state()[/b] [br] [b]update()[/b]

var STATES = null ## array donde se guardan las referencias de todos los estados
var Player = null## Referencia del jugador 

##Funcion que se ejecuta al entrar a cualquier estado
func enter_state(): 
	pass
##Funcion que se ejecuta al salir de cualquier estado
func exit_state(): 
	pass
##Funcion que se ejecuta en cada frame mientras se esta en el estado
func update(delta): 
	return null

##Movimiento basico del jugador, esta funcion se crea en esta clase para poder ser llamada en todos los estados
func player_movement():
	if Player.movement_input.x >0:
		Player.velocity.x = Player.SPEED
		Player.last_direction = Vector2.RIGHT
	elif Player.movement_input.x <0:
		Player.velocity.x = - Player.SPEED
		Player.last_direction = Vector2.LEFT
	else:
		Player.velocity.x = 0
