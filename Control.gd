extends Control

func _on_CharacterButton_pressed(character_name):
	# Сохраните выбранного персонажа в глобальной переменной или настройках
   # Global.selected_character = character_name
	# Перейдите к следующей сцене
	get_tree().change_scene("res://path_to_next_scene.tscn")
