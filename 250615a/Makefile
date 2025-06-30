FRAMES := 60
# ZEROS = number of digits in FRAMES
ZEROS := 2
CYCLIC := true
# WIDTH := 1920
# HEIGHT := 1080
WIDTH := 960
HEIGHT := 540
VERBOSE := false
CONSOLE := false
ANTIALIAS := true
# QUALITY 0-11. 9 is default. 
QUALITY := 9
THREADS := 6
FPS := 30

# image or video
default: image

################
# Single frame
################
image: out/out.png
	@eog -f ./out/out.png 2&> /dev/null

out/out.png: main.pov
	@echo "building image..."
	@rm -rf out
	@mkdir -p out
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
	@mpv -loop --fs ./out/out.mp4 2&> /dev/null

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

out/frames: main.pov 
	@echo "generating frames..."
	@rm -rf out
	@mkdir -p out/frames
	@povray \
		main.pov \
		Antialias=$(ANTIALIAS) \
		Display=false \
		+W$(WIDTH) +H$(HEIGHT) \
		Final_Frame=$(FRAMES) \
		Cyclic_Animation=$(CYCLIC) \
		Verbose=$(VERBOSE) \
		All_Console=$(CONSOLE) \
		Work_Threads=$(THREADS) \
		Quality=$(QUALITY) \
		Output_File_Name=./out/frames/frame_.png

################
# Other
################
clean:
	@echo "cleaning..."
	@rm -rf out

render:
	@echo "generating frames..."
	@mkdir -p out/frames
	@povray \
		main.pov \
		Antialias=$(ANTIALIAS) \
		Display=false \
		+W$(WIDTH) +H$(HEIGHT) \
		Final_Frame=$(FRAMES) \
		Cyclic_Animation=$(CYCLIC) \
		Verbose=$(VERBOSE) \
		All_Console=$(CONSOLE) \
		Work_Threads=$(THREADS) \
		Quality=$(QUALITY) \
		Subset_Start_Frame=601 \
		Subset_End_Frame=720 \
		Output_File_Name=./out/frames/frame_.png

ffmpeg:
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

cat:
	ffmpeg -f concat -safe 0 -i cat.txt -c copy final.mp4

reverse:
	ffmpeg -i s2_1920.mp4 -vf reverse s4_1920.mp4
