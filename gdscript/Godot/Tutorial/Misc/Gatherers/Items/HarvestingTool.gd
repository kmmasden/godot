extends EquipableItem

class_name HarvestingTool

@export var min_amount : int = 1
@export var max_amount : int = 1
@export var affected_types : Array[ResourceNodeType]

func interact_with_body(body):
	if (body is ResourceNode):
		for type in affected_types:
			if (body.node_types.has(type)):
				print_debug("Match found: " + type.display_name + " on " + body.name)
				body.harvest(randi_range(min_amount, max_amount))
