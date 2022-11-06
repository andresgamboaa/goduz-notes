extends Control

#func _ready():
#	self.add_child(Node.new())

func add_child(node: Node, force_readable_name: bool = false, internal: int = 0):
	print("add_child")
	for i in range(0, 4):
		print(i)
	pass
#	super.add_child(node, force_readable_name, internal)
