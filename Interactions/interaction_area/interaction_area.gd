extends Area2D

class_name InteractionArea


var interact: Callable = func():
	pass



func _on_body_entered(body: Node2D) -> void:
	InteractionManager.register_area(self)



func _on_body_exited(body: Node2D) -> void:
	InteractionManager.unregister_area(self)
