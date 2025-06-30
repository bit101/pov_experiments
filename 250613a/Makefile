FRAMES=360
# ZEROS = number of digits in FRAMES
ZEROS=3
CYCLIC=true
WIDTH=1000
HEIGHT=1000
VERBOSE=false
CONSOLE=false
ANTIALIAS=true
FPS=30

# image or video
default: video

################
# Single frame
################
image: out/out.png
	@eog ./out/out.png 2&> /dev/null

out/out.png: main.pov generated.inc
	@echo "building image..."
	@povray \
		main.pov \
		Antialias=$(ANTIALIAS) \
		Display=false \
		Verbose=$(VERBOSE) \
		All_Console=$(CONSOLE) \
		+W$(WIDTH) +H$(HEIGHT) \
		Output_File_Name=./out/out.png

################
# Animation
################
video: out/out.mp4
	@mpv -loop ./out/out.mp4 2&> /dev/null

out/out.mp4: out/frames
	@echo "generating video..."
	@ffmpeg \
		-y \
		-framerate $(FPS) \
		-i ./out/frames/frame_%0$(ZEROS)d.png \
		-s:v $(WIDTH)x$(HEIGHT) \
		-c:v libx264 \
		-profile:v high \
		-crf 20 \
		-pix_fmt yuv420p \
		./out/out.mp4

out/frames: main.pov generated.inc
	@echo "generating frames..."
	@povray \
		main.pov \
		Antialias=$(ANTIALIAS) \
		Display=false \
		+W$(WIDTH) +H$(HEIGHT) \
		Final_Frame=$(FRAMES) \
		Cyclic_Animation=$(CYCLIC) \
		Verbose=$(VERBOSE) \
		All_Console=$(CONSOLE) \
		Output_File_Name=./out/frames/frame_.png

################
# Other
################
clean:
	@echo "cleaning..."
	@rm generated.inc
	@rm -rf out/frames
	@mkdir -p out/frames

generated.inc: main.go
	@echo "generating include..."
	@go run main.go
