import java.util.Arrays;

public class ArrayLab {
    public static void main(String[] args) {
        //Declare an array called names
        String[] names = {"Kirk","Robert","James","Lars"};

        //Declare an array called instrument and populate it
        String[] instrument = new String[4];

        //Populate the instrument array
        instrument[0] = "guitar";
        instrument[1] = "bass guitar";
        instrument[2] = "lead guitar";
        instrument[3] = "drums";

        //Use a for loop to display the contents of the arrays to the user
        for(int i = 0; i<=3; i++) {
            System.out.println(names[i] + " plays " + instrument[i] + ". ");
        }//end for loop

        //Use a for each loop to iterate through the elements in the array
        for(String name : names) {
            System.out.println("Band member's name: " + name);
        }//end for loop

        //Call printArray method to print out the instruments
        printArray(instrument);

        //Call the sortArray method to get a sorted list of songs
        String[] songs = sortArray();

        //Print the sorted array
        System.out.print(Arrays.toString(songs));
    }//end main

    //Method for sorting an array
    public static String[] sortArray() {
        //Define an array with a type of String
        String[] songs = {"The Unforgiven", "Ride the Lightning", "Master of Puppets"};
        //Sort the string array in alphabetical order
        Arrays.sort(songs);

        //Return the sorted array
        return songs;
    }//end sortArray method
    //Method for printing an array
    public static void printArray(String[] array) {
        //Use a for loop to iterate over the items in the array
        for(int i = 0; i < array.length; i++){
            //Print out the element from the array
            System.out.println(array[i] + "\n");
        }//end for loop
    }//end printArray method
}//end class
