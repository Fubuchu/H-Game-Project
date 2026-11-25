class_name GalleryMenu
extends Control

@onready var exit_button = $MarginContainer/VBoxContainer/Exit_Button as Button
signal exit_gallery_menu

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false)
func on_exit_pressed() -> void:
	exit_gallery_menu.emit()
	set_process(false)
	print("exiting gallery")
