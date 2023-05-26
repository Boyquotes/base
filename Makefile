videos = $(shell ls videos/*.tscn | sed s/^videos/videos-out/ | sed s/.tscn$$/.avi/)

all: videos

videos: $(videos)

# Videos can be affected by any code change, so re-render them very eagerly.
videos-out/%.avi: videos/%.tscn
	mkdir -p videos-out
	./godot ./$< --write-movie ./$@ --fixed-fps 60 --disable-vsync
	sleep 1s && touch $< & disown
