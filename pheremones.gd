extends Line2D

var target

export(NodePath) var target_path

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	target = get_node(target_path)

func _process(delta):
	# Make sure pheremone trail is properly aligned to world and ant
	global_position = Vector2(0,0)
	global_rotation = 0

func _on_evaporation_timeout():
	print('remove point')
	# Remove oldest pheremone point
	remove_point(0)


func _on_secretion_timeout():
	# Get point for current position of target
	var current_position = target.position
	
	# Get count of pheremone points
	var pheremone_point_count = get_point_count()
	
	if (pheremone_point_count < 2):	
		# Not enough pheremones, secrete some
		add_point(current_position)
	else:
		# Get index for previous pheremone point (subtract one since array is zero indexed)	
		var previous_pheremone_position = get_point_position(pheremone_point_count - 1)
		
		# Get travel distance from previous pheremone point to current position
		var travel_distance = previous_pheremone_position.distance_to(current_position)
		
		# Make sure ant has traveled some distance before adding pheremone point
		if (travel_distance > 10):
			# Add new point to list
			add_point(current_position)
