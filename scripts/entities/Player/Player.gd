extends CharacterBody2D
class_name Player

##Clase principal aplicada al nodo "player"
##
##en esta clase se gestiona el input del usuario, se recorre el nodo STATES para guardar referencia de los estados en un array y se gestiona el cambio de estados

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity_value = ProjectSettings.get_setting("physics/2d/default_gravity")

#player input
##[Vector2] que se utiliza para guardar el input de movimiento del jugador 
var movement_input = Vector2.ZERO
##variable para guardar si el jugador salta
var jump_input = false
##variable para guardar "cuando" el jugador salta
var jump_input_actuation = false

#player_movement
##velocidad del jugador
@export var SPEED = 70.0
##fuerza de salto del jugador
@export var JUMP_VELOCITY = -400.0


#states
##variable donde se guarda el estado actual del jugador
var current_state = null
##variable donde se guarda el estado anterior del jugador
var prev_state = null

#nodes
##referencia al nodo estates donde se guardan los estados dentro del arbol del personaje
@onready var STATES = $STATES

##en esta funcion se recorren todos los nodos dentro del nodo STATES para guardar la referencia 
func _ready():
	for state in STATES.get_children():
		state.STATES = STATES
		state.Player = self
	prev_state = STATES.IDLE
	current_state = STATES.IDLE

func _physics_process(delta):
	player_input()
	change_state(current_state.update(delta))
	$Label.text = str(current_state.get_name())
	move_and_slide()


func gravity(delta):
	if not is_on_floor():
		velocity.y += gravity_value * delta
		

func change_state(input_state):
	if input_state != null:
		prev_state = current_state 
		current_state = input_state
		
		prev_state.exit_state()
		current_state.enter_state()


func player_input():
	movement_input = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		movement_input.x += 1
	if Input.is_action_pressed("move_left"):
		movement_input.x -= 1
	if Input.is_action_pressed("move_up"):
		movement_input.y -= 1
	if Input.is_action_pressed("move_down"):
		movement_input.y += 1


	# jumps
	if Input.is_action_pressed("jump"):
		jump_input = true
	else: 
		jump_input = false
	if Input.is_action_just_pressed("jump"):
		jump_input_actuation = true
	else: 
		jump_input_actuation = false











