Contains the web interfaces for the [Flutter MapLibre GL plugin](https://github.com/maplibre/flutter-maplibre-gl).

## Web attribution behavior

This fork uses a compact attribution control that starts collapsed at every map
width. The visible information button opens and closes the original linked source
credits. Source loading, resizing and unrelated widget updates retain that state;
moving the control to another corner retains the user's expansion choice too.

The app remains responsible for meeting its map data and style attribution
requirements. This presentation change does not remove source credits or grant an
attribution exemption.
