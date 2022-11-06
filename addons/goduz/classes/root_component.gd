extends BaseRootComponent
class_name RootComponent

func _init():
	super()
	presets_path = "res://presets/presets.tscn"

func view():
	return\
	control({preset="full"}, [
		App.new()
	])
