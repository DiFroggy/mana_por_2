extends Node2D

# Para detectar un input :)
func _input(event):
	
	# Si apretamos una tecla.
	if event is InputEventKey and event.pressed:
		# En caso de apretar espacio, cambiamos de escena a la principal.
		if event.scancode == KEY_SPACE:
			get_tree().change_scene("res://Level.tscn")
