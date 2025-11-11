neuron_color=[1,0,0];
synapse_color=[0.5,0.5,1];

module bilayer(num_first, num_second,draw_first=true,sep_neurons=5,sep_layers=20,neuron_size=2,synapse_size=0.25){
    
    //connections first so that neurons are drawn over them rather than under
    for(a = [1:1:num_first]){
        a_offset = [
            0,
            (a * sep_neurons)+((-1-num_first) * sep_neurons/2),
            0
        ];
        for(b = [1:1:num_second]){
            b_offset = [
                sep_layers,
                (b * sep_neurons)+((-1-num_second) * sep_neurons/2),
                0
            ];
            color(synapse_color){
            hull(){
                translate(a_offset){sphere(synapse_size);}
                translate(b_offset){sphere(synapse_size);}
            }
            }
        }
    }
    
    if(draw_first){
    for(a = [1:1:num_first]){
        a_offset = [
            0,
            (a * sep_neurons)+((-1-num_first) * sep_neurons/2),
            0
        ];
        color(neuron_color){
        translate(a_offset){sphere(neuron_size);}
        }
    }
    }
    for(b = [1:1:num_second]){
        b_offset = [
            sep_layers,
            (b * sep_neurons)+((-1-num_second) * sep_neurons/2),
            0
        ];
        color(neuron_color){
        translate(b_offset){sphere(neuron_size);}
        }
    }
    
    
    
}

module multilayer(layers=[5,5,3],sep_neurons=5,sep_layers=20,neuron_size=2,synapse_size=0.25){
    num_layers = len(layers);
    for(i = [num_layers-1:-1:2]){
        layer_offset = (i-1)*sep_layers;
        translate([layer_offset,0,0]){
            bilayer(layers[i-1],layers[i],false,sep_neurons,sep_layers,neuron_size,synapse_size);
        }
    }
    bilayer(layers[0],layers[1],true,sep_neurons,sep_layers,neuron_size,synapse_size);
}

module aneuron(history=8,instreams=5,layers=[5,5,3],sep_neurons=5,sep_layers=20,neuron_size=2,synapse_size=0.25){
    num_layers = len(layers);
    for(i = [num_layers-1:-1:1]){
        layer_offset = (i-1)*sep_layers;
        translate([layer_offset,0,0]){
            bilayer(layers[i-1],layers[i],false,sep_neurons,sep_layers,neuron_size,synapse_size);
        }
    }
    //draw neurons
    for(h = [1:1:history]){
        for(s = [1:1:instreams]){
        stream_offset = [
            -sep_layers,
            (s * sep_neurons)+((-1-instreams) * sep_neurons/2),
            (h * sep_neurons)+((-1-history) * sep_neurons/2)
        ];
        translate(stream_offset){rotate([90,0,0]){
            color(neuron_color){sphere(neuron_size);}
        }}
    }}
    for(i = [1:1:layers[0]]){
        input_offset = [
            0,
            (i * sep_neurons)+((-1-layers[0]) * sep_neurons/2),
            0
        ];
        translate(input_offset){
            color(neuron_color){sphere(neuron_size);}
        }
    }
    //draw connections between neurons
    for(i = [1:1:layers[0]]){
        input_offset = [
            0,
            (i * sep_neurons)+((-1-layers[0]) * sep_neurons/2),
            0
        ];
        for(h = [1:1:history]){
            for(s = [1:1:instreams]){
            stream_offset = [
                -sep_layers,
                (s * sep_neurons)+((-1-instreams) * sep_neurons/2),
                (h * sep_neurons)+((-1-history) * sep_neurons/2)
            ];
            color(synapse_color){hull(){
            translate(stream_offset){sphere(synapse_size);}
            translate(input_offset){sphere(synapse_size);}
            }
            }
        }}
    }
    
}

aneuron(4,8,[4,4,4,2],sep_layers=100,neuron_size=20,synapse_size=1,sep_neurons=50);

//aneuron(205,200,[128,128,128,128,128,128,128,2],sep_layers=1000,neuron_size=20,synapse_size=1,sep_neurons=50);
//small example real neuron with the full body size and history length but only 200 synapses - WARNING this requires at least 62GB of memory to render, and produces a CSG tree with 5388458 elements so you have to increase the limit (--csglimit=6000000) or rendering will fail. For me the rendering time was 4 hours and 32 minutes

//aneuron(205,7000,[28,128,128,128,128,128,128,2],sep_layers=1000,neuron_size=20,synapse_size=1,sep_neurons=50);
//full felicity neuron, WARNING I recommend you don't uncomment this, you might need a supercomputer to render this and your OpenSCAD will probably freeze if you accidentally start rendering it. But also, even if you did render it, the input stream block is so massive that you can barely see the main body of the neuron and can pretty much not see the individual artifficial neurons in the net at any reasonable resolution

//use openscad mimic_neuron.scad -o mimic_neuron.png --imgsize=1000,1000 --colorscheme=Starnight --viewall --autocenter --projection=o
// for documents --colorscheme=Nature may be better since it has white background