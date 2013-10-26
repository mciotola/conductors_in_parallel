# Simulation Banner
puts "\n\n"
puts "###############################################################################"
puts "#                                                                             #"
puts "# CONDUCTORS IN PARALLEL version 01.06                                        #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Copyright 2011-13 by Mark Ciotola; available for use under GNU license      #"
puts "# Last revised on 25 October 2013                                             #" 
puts "# Website: http://www.heatsuite.com                                           #"
puts "# Source site: https://github.com/mciotola/conductors_in_parallel             #"
puts "#_____________________________________________________________________________#"
puts "#                                                                             #"
puts "# Description:                                                                #"
puts "# This simulation calculates the flow of heat energy across a thermal.        #"
puts "# conductor that connects a warmer object to a cooler object--2 paths.        #"
puts "#                                                                             #"
puts "###############################################################################"
puts "\n\n"

###############################################################################
#                                                                             #
# Developed with Ruby 1.9.2                                                   #
# Takes the following parameters: temperature of reservoirs                   #
#                                                                             #
###############################################################################


  puts "======================== Background ========================\n\n"
  
  puts " Fourier's Law of Conduction describes the flow of heat     "
  puts " energy through a material across a temperature difference. "
  puts "\n"
  puts " dQ/dt = (k A ) (d T / d L) \n"  
  puts " k = thermal conductivity of material \n"  
  puts "\n\n"
  
# Include the Math library
  include Math  
  
  
# Initialize simulation parameters

  warmertemp = 50.0 # in C; decimal point added to tell Ruby to allow floating point calculations
  coolertemp = 30.0 # C
  # we are assuming a very large heat capacity for both reservoirs
  
  length = 1.0 # in this simulation, must be the same for both paths for ease in experimentation
  
  material1 = 'copper' # choose from iron, copper, wood
  area1 = 1.0
  material2 = 'iron'   # choose from iron, copper, wood
  area2 = 1.0

  if material1 == 'iron'
	thermalconductivity1 = 80.0
  elsif material1 == 'copper'
    thermalconductivity1 = 400.0
  elsif material1 == 'wood'
    thermalconductivity1 = 0.08
  end
  
  if material2 == 'iron'
	thermalconductivity2 = 80.0
  elsif material2 == 'copper'
    thermalconductivity2 = 400.0
  elsif material2 == 'wood'
    thermalconductivity2 = 0.08
  end
  
  # Can above be arranged more dry?
  
  
# Display the parameters 

  puts "======================== Parameters ========================\n\n"

  puts sprintf "  Warmer temp (in C): \t\t %7.3f " , warmertemp.to_s
  puts sprintf "  Cooler temp (in C): \t\t %7.3f " , coolertemp.to_s
  puts sprintf "  Length (in m): \t\t %7.3f " , length.to_s

  puts sprintf "  Material 1: \t\t\t %7s " , material1
  puts sprintf "  Thermal conductivity 1: \t %7.3f " , thermalconductivity1.to_s
  puts sprintf "  Area 1 (in m^2): \t\t %7.3f " , area1.to_s
  
  puts sprintf "  Material 2: \t\t\t %7s " , material2
  puts sprintf "  Thermal conductivity 2: \t %7.3f " , thermalconductivity2.to_s
  puts sprintf "  Area 2 (in m^2): \t\t %7.3f " , area2.to_s

  puts "\n\n"  

# Run the simulation 
  # S = Q/T so S1 = Q1/T1

  tempdiff = warmertemp - coolertemp  # is the same for both paths
  
  heatenergyflow1 = ( (area1 * thermalconductivity1) / length) * tempdiff
  entropyproduced1 = (heatenergyflow1/coolertemp)  -  (heatenergyflow1/warmertemp)

  
  heatenergyflow2 = ( (area2 * thermalconductivity2) / length) * tempdiff
  entropyproduced2 = (heatenergyflow2/coolertemp)  -  (heatenergyflow2/warmertemp)  

  totalheatflow = heatenergyflow1 + heatenergyflow2
  heatflowpercent1 =  (heatenergyflow1/totalheatflow) * 100
  heatflowpercent2 =  (heatenergyflow2/totalheatflow) * 100
  totalentropyproduced = entropyproduced1 + entropyproduced2    
 


# Display the output 

  puts "========================== Output ==========================\n\n"

  puts sprintf "  Temp diff (in degrees C): \t %10.3f " , tempdiff.to_s	
  puts "\n\n"  
      
  puts "  PATH #1"
  #puts sprintf "  Thermal Conductivity of %s %s %4.3f", material1, "is", thermalconductivity1	 
  puts sprintf "  Heat energy flow (in J/s): \t %10.3f " , heatenergyflow1.to_s
  puts sprintf "  Heat flow %% (in J/s/K): \t %4.3f " , heatflowpercent1
  puts sprintf "  Entropy produced (in J/K/s): \t %10.3f " , entropyproduced1.to_s
  puts "\n\n"  
  
  puts "  PATH #2"
  # puts sprintf "  Thermal Conductivity of %s %s %4.3f", material2, "is", thermalconductivity2	
  puts sprintf "  Heat energy flow (in J/s): \t %10.3f " , heatenergyflow2.to_s
  puts sprintf "  Heat flow %% (in J/s/K): \t %4.3f " , heatflowpercent2
  puts sprintf "  Entropy produced (in J/K/s): \t %10.3f " , entropyproduced2.to_s
  puts "\n\n"
  
  puts "  TOTAL ENTROPY PRODUCTION RATE"
  # puts sprintf "  Thermal Conductivity of %s %s %4.3f", material2, "is", thermalconductivity2	
  #puts sprintf "  Heat energy flow (in J/s): \t %10.3f " , heatenergyflow2.to_s
  puts sprintf "  Total Entropy produced (in J/K/s): \t %10.3f " , totalentropyproduced.to_s
	
  puts "\n\n"

  puts "========================= Units Key =========================\n\n"
  puts "  Abbreviation \t\t\t Unit"
  puts "  C \t\t\t\t degrees Celsius, a unit of temperature"
  puts "  J \t\t\t\t Joules, a unit of energy"
  puts "  m \t\t\t\t meters, a unit of length"
  puts "\n\n"

  puts "========================= Reference =========================\n\n"
  puts "Daniel V. Schroeder, 2000, \"An Introduction to Thermal Physics.\""
  puts "\n\n"


# Table of thermal conductivities (watts/meter/kelvin)
# Material	Thermal Conductivity
# air				  0.026
# wood				  0.08
# water				  0.6
# iron				 80
# copper			400


########################### UNUSED CODE THAT MIGHT BE NEEDED LATER ###############################

#      engine.efficiency = exp( - 6 * ((bubble.period - 1)/periods.to_f ) )

# Need a way to allow people to change percentages, or have range or array of percentages?


m1 = material1.to_s
m2 = material2.to_s
hf1 = heatenergyflow1.to_s

puts "========================== Sketch ===========================\n\n"
  
puts "    +---------------------------------------------------+"
puts "    |                                                   |"
puts "    |                 Warmer Reservoir                  |"
puts "    |                                                   |"
puts "    +---------------------------------------------------+"
puts "            |    |                       |    |          "
puts "     Path   |    |                 Path  |    |          "
puts "     #1     |    |                 #2    |    |          "
puts "            |    |                       |    |          "
puts "     Heat   |    |                       |    |          "
puts "     Flow   |    |                       |    |          "
puts sprintf "    %6.0f %s ", hf1, " |    |                       |    |          "
puts "            |    |                       |    |          "
puts "            |    |                       |    |          "
puts "            |    |                       |    |          "
puts "    +---------------------------------------------------+"
puts "    |                                                   |"
puts "    |                 Cooler Reservoir                  |"
puts "    |                                                   |"
puts "    +---------------------------------------------------+"
puts "\n\n"


