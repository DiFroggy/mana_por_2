extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_Continue_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state


func _on_Exit_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	get_tree().change_scene("res://MainMenu/MainMenu.tscn")


func _on_RestartLevel_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	get_tree().reload_current_scene()

