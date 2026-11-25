extends Node

#Save Load | Reset (for temp purposes)
const save_file_name: String = "save.json"
const default_dictionary: Dictionary = {"test": 0, "time elapsed": 0.0}

func save_game (data: Dictionary) -> void:
	var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.WRITE)
	if save_file == null:
		push_error("Error opening file")
	var string_data: String = JSON.stringify(data)
	save_file.store_line(string_data)
	save_file.close()
		
func load_game() -> Dictionary:
	if FileAccess.file_exists(save_file_name):
		var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.READ)
		var json = JSON.new()
		
		var string_data: String = save_file.get_line()
		json.parse(string_data)
		var data: Dictionary = json.get_data()
		save_file.close()
		return data
	return default_dictionary

func reset_save() -> void:
	save_game(default_dictionary)
