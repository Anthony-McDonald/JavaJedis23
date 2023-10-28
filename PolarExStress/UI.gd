extends Control #and "res://Enemy.gd"



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var satiationText = get_node("Satiation")


# Called when the node enters the scene tree for the first time.

func set_satiation_text(satiation) :
	
	if satiation == 100:
		$AnimatedSprite.animation = "100health"
	elif satiation == 80:
		$AnimatedSprite.animation = "80health"
	elif satiation == 60:
		$AnimatedSprite.animation = "60health"
	elif satiation == 40:
		$AnimatedSprite.animation = "40health"
	elif satiation == 20:
		$AnimatedSprite.animation = "20health"
	if satiation <= 0:
		$AnimatedSprite.animation = "0health"
	
	#satiationText.text = str(satiation, "%")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
