parameter xxcod

_xxbase = alias()
do case 
	case xxcod = 1
		*xxsonido = mensaje(0)
endcase

*?? &xxsonido

if not empty(_xxbase)
	select &_xxbase
endif
