extends Line2D

var point
var target

export(NodePath) var targetPath

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	target = get_node(targetPath)

func _process(delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	
	# get point for current position of target
	point = target.position
	
	# add new point to list
	add_point(point)
