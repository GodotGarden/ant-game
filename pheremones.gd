extends Line2D

var point
var target
var startingPosition
export(NodePath) var targetPath

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	target = get_node(targetPath)

	startingPosition = target.position

func _process(delta):
	#global_position = Vector2(startingPosition)
	global_rotation = 0
	point = target.position
	
	add_point(point)
