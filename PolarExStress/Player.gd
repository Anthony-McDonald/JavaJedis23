extends KinematicBody2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#stats
var counter: int = 0
var hunger : int = 50
var health : int = 100
onready var ui = get_node("/root/MainScene/CanvasLayer/UI")

#physics
var speed : int = 200
var jumpForce : int = 600
var gravity : int = 800

var vel : Vector2 = Vector2()
var grounded : bool = false

func _physics_process(delta):
	pass
	#reset horizontal velocity
	vel.x = 0
	
	var animation_changed = false
	
	#movement inputs
	if Input.is_action_pressed("move_left"):
		vel.x -= speed * 2
		animation_changed = true
		
	if Input.is_action_pressed("move_right"):
		vel.x += speed * 2
		
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision, self)
			
		animation_changed = true
	
	#animation changes
	if animation_changed:
		sprite.play("Run")
	else:
		sprite.play("Idle")
		
	#applying the velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y += gravity * delta
	 
	#jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
		$AnimatedSprite.animation = "Jump"
	
	#flip spirte depending on player direction
	if vel.x < 0:
		sprite.flip_h = true
	if vel.x > 0:
		sprite.flip_h = false
		
	
	#hunger decrementer
	if counter == 180:
		add_food(-10)
		counter = 0
	else:
		counter += 1
		
		
	

#components
onready var sprite = $AnimatedSprite

#viewwindow


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("Idle")
	pass # Replace with function body.
	
	
func die():
	get_tree().reload_current_scene()
	

func add_food(value) :
	hunger += value
	ui.set_satiation_text(hunger)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


