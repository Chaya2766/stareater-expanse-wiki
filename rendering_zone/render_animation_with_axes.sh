if [ "$#" -ne 3 ]; then
echo 'usage is like this: bash render_scene.sh [filename].scad [number of frames] [framerate]'
echo 'inclide the .scad extension in the filename, if you want to render a "droid.scad", type the whole file name, not just droid'
exit 1
fi
rm frames/*
openscad $1 --view=axes,scales -o frames/frame.png --colorscheme=Starnight --imgsize=1000,1000 --animate=$2
#ffmpeg -framerate $3 -i frames/frame%05d.png -loop 0 -y animation_result.gif
#ffmpeg -framerate $3 -i frames/frame%05d.png -loop 0 -y -vcodec libwebp animation_result.webp

#ffmpeg -framerate $3 -i frames/frame%05d.png -loop 0 -y animation_result.gif
#gif2webp animation_result.gif -o animation_result.webp

framerate=$(( 1000 / $3 ))
img2webp -min_size -loop 0 -d $framerate frames/frame*.png -o animation_result.webp
