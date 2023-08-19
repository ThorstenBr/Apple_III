DISK   := bin/AppleIII_Stuff.po

TOOLS  := ../tools

# Build Utilities
AppleCommander := java -jar $(TOOLS)/AppleCommander/AppleCommander-ac-1.8.0.jar

all:
	make -C Sonata
	make -C Horses

disk: $(DISK)

$(DISK): all Makefile
	$(AppleCommander) -pro140 $@_ A3STUFF
	cat Sonata/bin/SOS.SONATA | $(AppleCommander) -p $@_ SOS.SONATA SOS 0x000
	cat Horses/bin/SOS.HORSES | $(AppleCommander) -p $@_ SOS.HORSES SOS 0x000
	mv $@_ $@

ftp: $(DISK)
	ftp -u dan@$(IP):$(VOLUME) $(DISK)

