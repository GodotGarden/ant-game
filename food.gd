extends Area2D

signal eaten

func _on_food_morsel_area_entered(area):
	if area.get_name() == "ant":
		emit_signal("eaten")
		queue_free()
