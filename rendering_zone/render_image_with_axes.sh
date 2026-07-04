if [ "$#" -ne 1 ]; then
echo 'usage is like this: bash render_image.sh [filename].scad'
echo 'inclide the .scad extension in the filename, if you want to render a "droid.scad", type the whole file name, not just droid'
echo 'you also need to have both openscad and webp installed, if not then run "sudo apt install webp openscad"'
exit 1
fi
openscad $1 --view=axes,scales -o render.png --colorscheme=Starnight --viewall --imgsize=1000,1000
#ffmpeg -framerate $3 -i frames/frame%05d.png -loop 0 -y animation_result.gif
#ffmpeg -i render.png -pix_fmt rgba -y -vcodec libwebp -lossless 1 -preset picture -compression_level 6 render.webp
cwebp -lossless render.png -o render.webp
