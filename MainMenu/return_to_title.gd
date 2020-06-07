extends Control



func _on_Button_pressed():
	get_tree().change_scene("res://MainMenu/MainMenu.tscn")


func _on_Level_1_pressed():
	get_tree().change_scene("res://LevelJ.tscn")
