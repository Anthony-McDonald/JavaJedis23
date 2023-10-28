extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var satiationText = get_node("Satiation")


# Called when the node enters the scene tree for the first time.

func set_satiation_text(satiation) :
	
	if satiation == -10:
		get_tree().reload_current_scene()
	
	satiationText.text = str(satiation, "%")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
