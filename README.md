# Firefighter-Loadout-Configurator
Allows user to configure various common firefighter gear loadouts to determine if weight burden is safe.

![loadout](https://user-images.githubusercontent.com/3127698/143526782-52c6da9e-9e7b-42aa-8d37-d050abdd8217.gif)

**I/O SUMMARY:**
The program collects the user's weight with unit preference,
and choice of job and extra optional tools. In return, descriptions 
of the role in addition to visual breakdowns and total weight output are
displayed. Many different combinations, or 'loadouts' can be made.

**INPUT:**
- Weight
- Units (Lbs/Kgs)
- Role (Four choices)
- Extras (Five choices)

**OUTPUT:**
- Converted weight
- Total Weight (Both Lbs/Kgs)
- Pie chart with weight distribution
- Health recommendation (Safe/Too Heavy)

**EXECUTION:**
The program works by first collecting the user's weight and unit.
Once the user has confirmed their weight, they are able to select between
various firefighting positions, and finally, chose any extra equipment
that may be needed. Once weight, role, and extras are selected, the 
program calculates the total weight of the firefighter, renders a pie 
chart illustrating the weight breakdown, and offers a rudimentary safety
suggestion based upon the amount of weight being carried.
