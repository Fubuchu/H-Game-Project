class_name MainMenu
extends Control

@onready var margin_container = $MarginContainer as MarginContainer
@onready var play_button = $MarginContainer/VBoxContainer/Play_Button as Button
@onready var load_button = $MarginContainer/VBoxContainer/Load_Button as Button
@onready var gallery_button = $MarginContainer/VBoxContainer/Gallery_Button as Button
@onready var gallery_menu = $Gallery_Menu as GalleryMenu
@onready var options_button = $MarginContainer/VBoxContainer/Options_Button as Button
@onready var options_menu = $Options_Menu as OptionsMenu
@onready var exit_button = $MarginContainer/VBoxContainer/Exit_Button as Button

func _ready():
	handle_connecting_signals()
func _on_play_button_pressed() -> void:
	#get_tree().change_scene_to_file() #Put game file here
	pass
func _on_load_button_pressed() -> void:
	pass # Replace with function body.
func _on_gallery_pressed() -> void:
	margin_container.visible = false
	gallery_menu.set_process(true)
	gallery_menu.visible = true
func _on_exit_gallery_menu() -> void:
	margin_container.visible = true
	gallery_menu.visible = false
func _on_options_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true
func _on_exit_options_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false
func _on_exit_pressed() -> void:
	get_tree().quit()
func handle_connecting_signals() -> void:
	play_button.button_down.connect(_on_play_button_pressed)
	load_button.button_down.connect(_on_load_button_pressed)
	gallery_button.button_down.connect(_on_gallery_pressed)
	gallery_menu.exit_gallery_menu.connect(_on_exit_gallery_menu)
	options_button.button_down.connect(_on_options_pressed)
	options_menu.exit_options_menu.connect(_on_exit_options_menu)
	exit_button.button_down.connect(_on_exit_pressed)
