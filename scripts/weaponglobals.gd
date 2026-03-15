class_name weapon extends Area2D

var damagedealt = 0

func weapon_damage(damage, target):
	var damagedealt = damage * Globals.damage_modifier
	DamageNumbers.Display_DamageNumber(damagedealt, target.global_position.x - 9, target.global_position.y - 15)
	target.lose_health(damagedealt)
