extends Node2D

var data_filter_scene = preload("res://gameplay/data_filter/data_filter.tscn")
var new_data_filter = null
var new_data_filter_valid_position = false


func _process(delta):
	if new_data_filter:
		new_data_filter.global_position = get_global_mouse_position()
		new_data_filter_valid_position = (new_data_filter.global_position.distance_to($gui/creation_button.rect_global_position) >= 100)
			
		if not new_data_filter_valid_position:
			new_data_filter.modulate = Color.red
		else:
			new_data_filter.modulate = Color.white


func _input(event):
	if new_data_filter and event is InputEventMouseButton and not event.pressed and event.button_index == BUTTON_LEFT:
		if new_data_filter_valid_position:
			new_data_filter.active = true
			new_data_filter = null
		else:
			new_data_filter.queue_free()
			new_data_filter = null


func _on_creation_button_button_down():
	new_data_filter = data_filter_scene.instance()
	add_child(new_data_filter)
	new_data_filter.global_position = get_global_mouse_position()
	new_data_filter.active = false
