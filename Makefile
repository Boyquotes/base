videos = $(shell ls videos/*.tscn | sed s/^videos/videos-out/ | sed s/.tscn$$/.mp4/)

all: videos

videos: $(videos)

# Videos can be affected by any code change, so re-render them very eagerly.
videos-out/%.mp4: videos/%.tscn
	mkdir -p $(shell dirname $@)/$(shell basename $@ .mp4)
	./godot ./$< --write-movie $(shell dirname $@)/$(shell basename $@ .mp4)/image.png --fixed-fps 60 --disable-vsync
	rm ./$(shell dirname $@)/$(shell basename $@ .mp4)/image00000000.png
	ffmpeg -y -framerate 60 -i ./$(shell dirname $@)/$(shell basename $@ .mp4)/image%08d.png $@
	sleep 1s && touch $< & disown
