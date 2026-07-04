if [ "$#" -ne 1 ]; then
echo 'usage is like this: bash render_image.sh [filename].scad'
echo 'inclide the .scad extension in the filename, if you want to render a "droid.scad", type the whole file name, not just droid'
exit 1
fi
openscad $1 --view=axes,scales -o render.png --colorscheme=Starnight --viewall --imgsize=1000,1000
#ffmpeg -framerate $3 -i frames/frame%05d.png -loop 0 -y animation_result.gif
#ffmpeg -i render.png -y -vcodec libwebp -lossless 1 render.webp
cwebp -lossless render.png -o render.webp
