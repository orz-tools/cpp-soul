find ../../cpp-soul-source -name "*.psd" | while read line; do
  filename="${line#../../cpp-soul-source/}"
  psdfile="$line"
  pngfile="../${filename%.psd}.png"
  mkdir -p "$(dirname "$pngfile")"
  if ! test -f "$pngfile"; then
    ffmpeg -i "$(realpath "$psdfile")" "$(realpath "$pngfile")" </dev/null
  fi
done