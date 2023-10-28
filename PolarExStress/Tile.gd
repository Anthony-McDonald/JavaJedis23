extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	mode = RigidBody2D.MODE_STATIC
	
	
func _on_Tile_body_entered(body):
	if body.name == "Player":
		mode = RigidBody2D.MODE_RIGID


		
	

		

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
