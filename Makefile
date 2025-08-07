MOD_DIR := $(shell pwd)/homework-jones
KRISTAL_DIR := 3rd/Kristal
SYMLINK := $(KRISTAL_DIR)/mods/homework-jones

# Create symlink in Krystal mods folder
$(SYMLINK):
	@echo "Creating symlink to $(MOD_DIR)"
	ln -s $(MOD_DIR) $(SYMLINK)

# Run Kristal
.PHONY: run
run: $(SYMLINK)
	@echo "Running Krystal..."
	love $(KRISTAL_DIR) --mod homework_jones
