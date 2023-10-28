extends Node2D

func _ready():
	pass # Replace with function body.

func _on_StartButton_pressed():
	get_tree().change_scene("res://MainScene.tscn")

func _on_TutorialButton_pressed():
	get_tree().change_scene("res://Tutorial.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_BackButton_pressed():
	get_tree().change_scene("res://StartMenu.tscn")

	

func _on_CreditButton_pressed():
	get_tree().change_scene("res://Credit.tscn")
