extends Node2D
# Размер клетки
var cell_size = Vector2(64, 64)
# Позиция игрока на сетке
var grid_position = Vector2(0, 0)
# Список стен
var walls = []
# Словарь предметов
var items = {}
# Здоровье игрока
var player_health = 100

# Инициализация
func _ready():
	# Пример стен
	walls = [Vector2(2, 2), Vector2(3, 3)]
	# Пример предметов
	items = {Vector2(1, 1): "sword", Vector2(4, 4): "shield"}

# Обработка ввода
func _input(event):
	if event is InputEventKey and event.pressed:
		var new_position = grid_position
		match event.scancode:
			KEY_W:
				new_position.y -= 1
			KEY_S:
				new_position.y += 1
			KEY_A:
				new_position.x -= 1
			KEY_D:
				new_position.x += 1
		if not is_wall(new_position):
			grid_position = new_position
			position = grid_position * cell_size
			check_for_battle()
			check_for_item()

# Проверка на стену
func is_wall(position):
	return position in walls

# Проверка на предмет
func check_for_item():
	if grid_position in items:
		var item = items[grid_position]
		print("Picked up: " + item)
		items.erase(grid_position)

# Проверка на врага
func check_for_battle():
	if is_enemy_at_position(grid_position):
		start_battle()

# Проверка наличия врага на позиции
func is_enemy_at_position(position):
	# Логика проверки наличия врага на позиции
	return false

# Скрипт для перехода в экран боя и выхода из него
extends Node

# Здоровье врага
var enemy_health = 50

# Начало боя
func start_battle():
	get_tree().change_scene("res://BattleScene.tscn")

# Конец боя
func end_battle(victory):
	if victory:
		remove_enemy()
		get_tree().change_scene("res://MainScene.tscn")
	else:
		print("ПОТРАЧЕНО")
		get_tree().change_scene("res://GameOverScene.tscn")

# Удаление врага с карты
func remove_enemy():
	# Логика удаления врага с карты
	pass
