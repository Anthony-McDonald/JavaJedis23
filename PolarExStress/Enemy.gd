extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#variables
export var speed : int = 500
export var moveDist: int = 100

onready var startX : float = position.x
onready var targetX : float = position.x + moveDist

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	#move to target x
	position.x = move_to(position.x, targetX, speed * delta)
	
	#if at target, move other way
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX
			
			
func move_to (current,to,step) :
	var new = current
	#if moving positive
	if new < to:
		new += step
		
		if new > to:
			new = to
	#if moving negative
	else:
		new -= step
		
		if new < to:
			new = to
			
	return new

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()
		
