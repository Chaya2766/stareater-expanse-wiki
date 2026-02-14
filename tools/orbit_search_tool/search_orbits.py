#!/usr/bin/python3
import sys
import argparse

#made by Claude 3.5 Haiku
#instructions
#run the program from command line like this:
#python3 search_orbits.py [data file] [a min] [a max] [e min] [e max] [i min] [i max] [long min] [long max] [node min] [node max] [arg min] [arg max] [anomaly min] [anomaly max]
#it will only return objects for which all parameters fit between the specified min/max values
#example of how I found some objects near 160278 finespun
#python3 search_orbits.py objects.txt 3.0 3.3 0.18 0.22 14 18 230 260 145 175 20 50
#and the data file can be downloaded from AstDyS: https://newton.spacedys.com/astdys/index.php?pc=4
#it is the first file: Numbered asteroids, Orbital elements, one line format, epoch near present time.
#here's a direct link to the file https://newton.spacedys.com/~astdys2/catalogs/allnum.cat

def parse_minor_planets_file(filename):
    """
    Parse the minor planets file and return a list of objects.
    
    Each object is a dictionary containing:
    - name: object name
    - epoch: epoch (MJD)
    - orbital parameters: a, e, i, long. node, arg. peric., mean anomaly
    """
    objects = []
    
    try:
        with open(filename, 'r') as file:
            # Skip header information
            while True:
                line = file.readline().strip()
                if line.startswith('END_OF_HEADER'):
                    break
                if not line or line.startswith('!'):
                    continue
            
            # Parse data lines
            for line in file:
                line = line.strip()
                if not line or line.startswith('!'):
                    continue
                
                # Split the line, handling potential variations in whitespace
                parts = line.split()
                
                # Ensure we have enough parts to parse
                if len(parts) < 8:
                    continue
                
                try:
                    # Parse the object
                    obj = {
                        'name': parts[0].strip("'"),
                        'epoch': float(parts[1]),
                        'a': float(parts[2]),
                        'e': float(parts[3]),
                        'i': float(parts[4]),
                        'long_node': float(parts[5]),
                        'arg_peric': float(parts[6]),
                        'mean_anomaly': float(parts[7])
                    }
                    objects.append(obj)
                except (ValueError, IndexError):
                    # Skip lines that can't be parsed
                    continue
        
        return objects
    
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found.")
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file: {e}")
        sys.exit(1)

def filter_objects(objects, args):
    """
    Filter objects based on specified orbital parameter ranges.
    """
    filtered_objects = []
    
    for obj in objects:
        # Check each parameter against its min/max range
        if (args.a_min <= obj['a'] <= args.a_max and
            args.e_min <= obj['e'] <= args.e_max and
            args.i_min <= obj['i'] <= args.i_max and
            args.long_min <= obj['long_node'] <= args.long_max and
            args.arg_min <= obj['arg_peric'] <= args.arg_max and
            args.anomaly_min <= obj['mean_anomaly'] <= args.anomaly_max):
            filtered_objects.append(obj)
    
    return filtered_objects

def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(description='Search minor planets file by orbital characteristics.')
    
    # Add arguments for each orbital parameter
    parser.add_argument('file', help='Path to the minor planets data file')
    parser.add_argument('a_min', type=float, help='Minimum semi-major axis')
    parser.add_argument('a_max', type=float, help='Maximum semi-major axis')
    parser.add_argument('e_min', type=float, help='Minimum eccentricity')
    parser.add_argument('e_max', type=float, help='Maximum eccentricity')
    parser.add_argument('i_min', type=float, help='Minimum inclination')
    parser.add_argument('i_max', type=float, help='Maximum inclination')
    parser.add_argument('long_min', type=float, help='Minimum longitude of node')
    parser.add_argument('long_max', type=float, help='Maximum longitude of node')
    parser.add_argument('arg_min', type=float, help='Minimum argument of perihelion')
    parser.add_argument('arg_max', type=float, help='Maximum argument of perihelion')
    parser.add_argument('anomaly_min', type=float, help='Minimum mean anomaly')
    parser.add_argument('anomaly_max', type=float, help='Maximum mean anomaly')
    
    # Parse command-line arguments
    args = parser.parse_args()
    
    # Parse the input file
    objects = parse_minor_planets_file(args.file)
    
    # Filter objects
    filtered_objects = filter_objects(objects, args)
    
    # Print results
    if filtered_objects:
        print("Matching Objects:")
        print("Name\t\tSemi-Major Axis\tEccentricity\tInclination\tLong. Node\tArg. Perihelion\tMean Anomaly")
        print("-" * 100)
        for obj in filtered_objects:
            print(f"{obj['name']:10}\t{obj['a']:14.6f}\t{obj['e']:12.6f}\t{obj['i']:12.6f}\t{obj['long_node']:12.6f}\t{obj['arg_peric']:16.6f}\t{obj['mean_anomaly']:12.6f}")
        print(f"\nTotal matching objects: {len(filtered_objects)}")
    else:
        print("No objects found matching the specified criteria.")

if __name__ == '__main__':
    main()

