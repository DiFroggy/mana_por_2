extends Area2D

func _on_Death_area_entered(area):
	print(area.get_name())
	if("Player" in area.get_name()):
		print("GG")
		get_tree().change_scene("res://MainMenu/MainMenu.tscn")
