extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control.add_child(Node.new())
	print("control.add_child called")
