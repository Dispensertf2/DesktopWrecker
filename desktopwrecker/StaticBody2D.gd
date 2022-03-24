extends StaticBody2D



func _ready():
	self.position.y = get_viewport().size.y


func _process(delta):
	self.position.y = get_viewport().size.y
