FRAMES := 360
# ZEROS  :=  number of digits in FRAMES
ZEROS := 3
CYCLIC := true
WIDTH := 800
HEIGHT := 800
VERBOSE := false
CONSOLE := true
ANTIALIAS := true
QUALITY := 9
THREADS := 6
FPS := 30
LIB_PATH := /home/keith/Code/blpov

# image or video
default: video

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
		Library_Path=$(LIB_PATH) \
		Output_File_Name=./out/frames/frame_.png

################
# Other
################
clean:
	@echo "cleaning..."
	@rm -rf out

subset:
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
		Subset_Start_Frame=1 \
		Subset_End_Frame=10 \
		Library_Path=$(LIB_PATH) \
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
		./out_01.mp4

cat:
	# update with actual file names
	@echo "file ./out_01.mp4" > cat.txt
	@echo "file ./out_02.mp4" >> cat.txt
	@echo "file ./out_03.mp4" >> cat.txt
	@ffmpeg -y -f concat -safe 0 -i cat.txt -c copy final.mp4
	@mpv --fs --loop final.mp4

preview:
	@mpv mf://out/frames/*png -mf-fps 30 --loop 2&> /dev/null
