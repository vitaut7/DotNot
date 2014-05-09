_D = main.d
_D += $(wildcard System/*.[d])
_D += $(wildcard System/_Enum/*.[d])
_D += $(wildcard System/_Class/*.[d])
_D += $(wildcard System/_Struct/*.[d])
_D += $(wildcard System/_Delegate/*.[d])
_D += $(wildcard System/_Interface/*.[d])

DFLAGS = -g -unittest -debug -ofFramework.exe $(_D)

all:
	@echo Compiling...
	@dmd $(DFLAGS)
	@echo O.K.

run:
	@rdmd $(DFLAGS)
	@echo Debuging...