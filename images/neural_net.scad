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
                translate(a_offset){circle(synapse_size);}
                translate(b_offset){circle(synapse_size);}
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
        translate(a_offset){circle(neuron_size);}
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
        translate(b_offset){circle(neuron_size);}
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

multilayer([128,128,128,128,128,2],sep_layers=1000,neuron_size=20,synapse_size=1,sep_neurons=50);

//use openscad neural_net.scad -o neural_net.png --imgsize=1000,1000 --colorscheme=Starnight --viewall --autocenter --projection=o --camera=0,0,0,0,0,0,0