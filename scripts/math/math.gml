/**
 * a_math_inc 1.0.1
 *
 * Vrací inkrementovanou hodnotu, pokud odpovídá limitům. Pokud výsledná hodnota překračuje hodnotu max, vrátí hodnotu min.
 */
function math_inc(_value, _max = 0, _min = 0) 
{
	if (_value >= _max) {
		return _value = _min
	} else {
		return _value + 1
	}
}


/**
 * a_math_dec 1.0.0
 *
 * Vrací dekrementovanou hodnotu, pokud odpovídá limitům. Pokud výsledná hodnota překračuje hodnotu min, vrátí hodnotu max.
 */
function math_dec(_value, _min = 0, _max = 0) {
	if (_value <= _min) {
		return _max
	} else {
		return _value - 1
	}
}


/**
 * a_math_distance 1.0.0
 *
 * Vrací vzdálenost instance od určeného cíle
 */
function math_distance(_target) {
	return point_distance(x, y, _target.x, _target.y)
}