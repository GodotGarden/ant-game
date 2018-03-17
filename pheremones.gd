extends Line2D

var point
var target

export(NodePath) var targetPath

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	target = get_node(targetPath)

func _process(delta):
	# Make sure pheremone trail is properly aligned to world and ant
	global_position = Vector2(0,0)
	global_rotation = 0

func _on_evaporation_timeout():
	print("total points: ", get_point_count())
	# Remove oldest pheremone point
	remove_point(0)


func _on_secretion_timeout():
	# get point for current position of target
	point = target.position
	
	# add new point to list
	add_point(point)
