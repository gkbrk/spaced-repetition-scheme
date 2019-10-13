CHICKEN := chicken-csc

SCM_FILES := $(wildcard src/*.scm)
OBJ_FILES := $(patsubst src/%.scm, bin/%.o, $(SCM_FILES))

bin/chickendrill: $(OBJ_FILES)
	$(CHICKEN) -o "$@" $^

bin/%.o: src/%.scm
	@mkdir -p bin
	$(CHICKEN) -c -o "$@" "$<"

run: bin/chickendrill
	./bin/chickendrill
.PHONY: run

clean:
	@rm -rf bin
.PHONY: clean
