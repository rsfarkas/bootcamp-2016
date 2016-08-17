//importing libraries
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;  
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.providers.Google;

//instantiates the map
UnfoldingMap map;

//creates variable nyc location 
Location nycLocation = new Location(40.763726, -73.972637);

//creates arrays of rape/robbery locations
ArrayList<Location> rapeLocations = new ArrayList<Location>();
ArrayList<Location> robberyLocations = new ArrayList<Location>();

//creates variables set to -1. Set to -1 in order to include 0 from the array.
int rapeLocationIndex = -1;
int robberyLocationIndex = -1;

//instantiates  table
Table table;


void setup() {
  table = loadTable("crimes.csv", "header");

  //prints total rows of table in the console. useful to make sure code is working. 
  println(table.getRowCount() + " total rows in table"); 
  
  //iterates through the table. first the lat and long are stored in local variables.
 // then, crime field is parsed and seperates rapes from robberies and adds them to their r
 //respective arrays. each incident becames a Location.
  for (TableRow row : table.rows ()) {
    float lat = row.getFloat("lat");
    float lng = row.getFloat("lng"); 
    if (row.getString("crime").equals("RAPE")) {
      rapeLocations.add(new Location(lat, lng));
    } else if (row.getString("crime").equals("ROBBERY")) {
      robberyLocations.add(new Location(lat, lng));
    }
  }

  //map setup
  size(800, 600);
  map = new UnfoldingMap(this, new Google.GoogleMapProvider());
  MapUtils.createDefaultEventDispatcher(this, map);
  map.zoomAndPanTo(11, nycLocation);
  map.setZoomRange(11, 15);
  map.setPanningRestriction(nycLocation, 10);
}

void draw() { 
  map.draw();

  // Draw Robberies
  if (frameCount % .5 == 0) {
    // Increase only if more data exists
    if (robberyLocationIndex < robberyLocations.size() - 1) {
      robberyLocationIndex++;
    }
  }

  // Show all currently visible locations (i.e. 0 - index)
  for (int i = 0; i <= robberyLocationIndex; i++) {
    Location location = robberyLocations.get(i);
    ScreenPosition pos = map.getScreenPosition(location);
    stroke(0, 0, 255);
    strokeWeight(2);
    fill(255);
    ellipse(pos.x, pos.y, 8, 8);
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, .5, .5);
    //println(locationIndex);
  }


  // Draw RAPES
  // Simple animation: Every 60 frames show next location 
  if (frameCount % .5 == 0) {
    // Increase only if more data exists
    if (rapeLocationIndex < rapeLocations.size() - 1) {
      rapeLocationIndex++;
    }
  }

  // Show all currently visible locations (i.e. 0 - index)
  for (int i = 0; i <= rapeLocationIndex; i++) {
    //stores [i]th location of robberyLocations Array in local variabale location
    Location location = rapeLocations.get(i);
    //setting local variable pos to get screen position of the location
    ScreenPosition pos = map.getScreenPosition(location);
    //draws marker
    stroke(255, 0, 0);
    strokeWeight(2);
    fill(255);
    ellipse(pos.x, pos.y, 10, 10);
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 2, 2);
  }
}

//how to display markets individually, array lists
//http://stackoverflow.com/questions/31396085/how-to-display-markers-one-by-one-on-processing-maps

//data set 
//https://data.cityofnewyork.us/Public-Safety/NYPD-7-Major-Felony-Incidents/hyij-8hr7


//how to read data from file
//https://processing.org/reference/loadTable_.html

//How to use unfolding maps 
//http://unfoldingmaps.org/
