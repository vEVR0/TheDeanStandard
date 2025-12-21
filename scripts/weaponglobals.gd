extends Area2D
class_name weapon

var damagedealt = 0

func weapon_damage(damage, target):
	var damagedealt = damage * Globals.damagemodifier
	DamageNumbers.Display_DamageNumber(damagedealt, target.global_position.x - 9, target.global_position.y - 15)
	target.lose_health(damagedealt)
