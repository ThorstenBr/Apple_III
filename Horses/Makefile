SOURCE := horses.ass
NAME   := SOS.HORSES
BIN    := bin/$(NAME)
DISK   := bin/$(NAME).po

TOOLS  := ../../tools

# Build Utilities
AppleCommander := java -jar $(TOOLS)/AppleCommander/AppleCommander-ac-1.8.0.jar

# DANII card IP settings
IP     := 192.168.178.65
VOLUME := /SD2/VOL0C.PO

all: $(BIN) $(DISK)

clean:
	rm $(BIN) $(DISK) $(DISK:.dsk=.po)

bin:
	- mkdir bin

$(BIN).o: $(SOURCE) | bin
	ca65 $< -l $(@:.o=.lst) -o $@

$(BIN): $(BIN).o
	ld65 $< -o $@ -C apple3.cfg

$(DISK): $(BIN) Makefile
	$(AppleCommander) -pro140 $@_ $(NAME)
	cat $< | $(AppleCommander) -p $@_ $(NAME) SOS 0x000
	mv $@_ $@

ftp: $(DISK)
	ftp -u dan@$(IP):$(VOLUME) $(DISK)

