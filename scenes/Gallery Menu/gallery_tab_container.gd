extends Control

@onready var grid1: GridContainer = $"TabContainer/Yuuka/MarginContainer/ScrollContainer/GridContainer"
@onready var full_screen_viewer1: TextureRect = $"TabContainer/Yuuka/MarginContainer/FullScreenViewer"
@onready var Yuuka: TextureRect = $"TabContainer/Yuuka/MarginContainer/FullScreenViewer/TextureRect"
@onready var grid2: GridContainer = $"TabContainer/Character 2/MarginContainer/ScrollContainer/GridContainer"
@onready var full_screen_viewer2: TextureRect = $"TabContainer/Character 2/MarginContainer/FullScreenViewer"
@onready var Char2: TextureRect = $"TabContainer/Character 2/MarginContainer/FullScreenViewer/TextureRect"
@onready var grid3: GridContainer = $"TabContainer/Character 3/MarginContainer/ScrollContainer/GridContainer"
@onready var full_screen_viewer3: TextureRect = $"TabContainer/Character 3/MarginContainer/FullScreenViewer"
@onready var Char3: TextureRect = $"TabContainer/Character 3/MarginContainer/FullScreenViewer/TextureRect"
@onready var grid4: GridContainer = $"TabContainer/Character 4/MarginContainer/ScrollContainer/GridContainer"
@onready var full_screen_viewer4: TextureRect = $"TabContainer/Character 4/MarginContainer/FullScreenViewer"
@onready var OtherChar: TextureRect = $"TabContainer/Character 4/MarginContainer/FullScreenViewer/TextureRect"

func _ready() -> void:
	full_screen_viewer1.hide()
	full_screen_viewer2.hide()
	full_screen_viewer3.hide()
	full_screen_viewer4.hide()

	for button in grid1.get_children():
		if button is TextureButton:
			button.pressed.connect(_on_thumbnail_pressed.bind(button.texture_normal))
	full_screen_viewer1.gui_input.connect(_on_viewer_gui_input)
	
	for button in grid2.get_children():
		if button is TextureButton:
			button.pressed.connect(_on_thumbnail_pressed.bind(button.texture_normal))
		full_screen_viewer2.gui_input.connect(_on_viewer_gui_input)
		
	for button in grid3.get_children():
		if button is TextureButton:
			button.pressed.connect(_on_thumbnail_pressed.bind(button.texture_normal))
		full_screen_viewer3.gui_input.connect(_on_viewer_gui_input)
		
	for button in grid4.get_children():
		if button is TextureButton:
			button.pressed.connect(_on_thumbnail_pressed.bind(button.texture_normal))
		full_screen_viewer4.gui_input.connect(_on_viewer_gui_input)
func _on_thumbnail_pressed(tex: Texture2D) -> void:
	if tex == null:
		return
	Yuuka.texture = tex
	full_screen_viewer1.show()
	Char2.texture = tex
	full_screen_viewer2.show()
	Char3.texture = tex
	full_screen_viewer3.show()
	OtherChar.texture = tex
	full_screen_viewer4.show()
func _on_viewer_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		full_screen_viewer1.hide()
		full_screen_viewer2.hide()
		full_screen_viewer3.hide()
		full_screen_viewer4.hide()
