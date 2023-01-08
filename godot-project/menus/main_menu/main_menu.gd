extends Control


func _ready():
	$center_container/panel/margin_container2/vbox_container/buttons_container/exit_button.visible = (OS.get_name() != "HTML5")


func _on_play_button_pressed():
	get_tree().change_scene("res://gameplay/main/main.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
