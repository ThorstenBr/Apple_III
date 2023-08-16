SOURCE := sonataA3.ass
BIN    := bin/SOS.SONATA


all: $(BIN)

clean:
	rm $(BIN)

bin:
	- mkdir bin

$(BIN).o: $(SOURCE) | bin
	ca65 $< -l $(@:.o=.lst) -o $@

$(BIN): $(BIN).o
	ld65 $< -o $@ -C apple3.cfg

