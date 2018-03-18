extends Area2D

# How much food the ant stomach can hold
var stomach_size = 10

# Units of food in ant stomach
var stomach_contents

# Reference to stomach contents UI widget
var stomach_contents_label

export(NodePath) var stomach_contents_label_path

func _ready():
	# Start with a bit of food in the belly
	stomach_contents = 3
	
	# Get stomach content label
	stomach_contents_label = get_node(stomach_contents_label_path)
	
	# Update stomach contents label with current level
	stomach_contents_label.set_text(str(self.stomach_contents))


func _on_digestion_timeout():
	# Digest a little bit of food
	self.stomach_contents -= 0.01
	
	# Update stomach contents label with current level
	stomach_contents_label.set_text(str(self.stomach_contents))


func _on_food_morsel_eaten():
	# Ingest food
	self.stomach_contents += 1
