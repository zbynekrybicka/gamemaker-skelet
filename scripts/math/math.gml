/**
 * a_math_inc 1.0.0
 *
 * Vrací inkrementovanou hodnotu, pokud odpovídá limitům. Pokud výsledná hodnota překračuje hodnotu max, vrátí hodnotu min.
 */
function math_inc(_value, _max = 0, _min = 0) 
{
	if (_max != 0 && _value == _max) {
		return _value = _min
	} else {
		return _value + 1
	}
}