# HWC Godot Base Project

This repository is a base for future Handle with Care projects, to allow shared systems to be maintained in one place.

## Elements

This repository includes:
* [x] The HWC Godot version manager script
  * To use managed Godot, call the script at the root of the repository instead of your system Godot installation.
* [x] Tools for producing videos of game behavior for devlogs. These also work as human-friendly regression tests or benchmarks.
  * Create a scene in `videos`, and give it some behavior.
    * Ensure that it calls `get_tree().quit()` once it's done, or the video will never end.
    * Also, call `get_window().unresizable = true` at the start to prevent the video from getting stretched out by the window manager.
  * Call `make videos-out/your-scene-name.mp4` to render the video.
* [ ] Tooling to build and update HWC GameSheet for Godot 4.
* [ ] An installation of Godot Ink? Depends whether we end up using it.