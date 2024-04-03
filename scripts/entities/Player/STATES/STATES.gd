extends Node
class_name STATES

##En esta clase se guardan todas las referencias a los estados disponibles del jugador
##
##en el caso de necesitar agregar un estado nuevo a la maquina, es necesario guardar en esa clase el path del nodo clsae corresponiente

##Estado base del jugador en el cual esta estatico sobre el suelo 
@onready var IDLE = $IDLE
##estado de movimiento, se ingresa a el cuando hay input de movimiento 
@onready var MOVE = $MOVE
##estado de salto, se ingresa a el cuando hay input de salto 
@onready var JUMP = $JUMP
##Estado de caid, se ingresa a el cuando el personaje no esta en el suelo y la velocidad en y es positiva
@onready var FALL = $FALL

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass
