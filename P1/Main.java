import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // Get input from the user
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter single digit numbers separated by commas: ");
        String userInput = scanner.nextLine();

        // Extract single digit numbers into dynamic array
        ArrayList<Integer> numbers = new ArrayList<>();
        for (int i = 0; i < userInput.length(); i++) {
            char c = userInput.charAt(i);
            if (c != ',') {
                numbers.add(Character.getNumericValue(c));
            }
        }
        
        // Print the list of numbers
        System.out.print("Your numbers are: [");
        for (int i = 0; i < numbers.size(); i++) {
            System.out.print(numbers.get(i));
            if (i < numbers.size() - 1) {
                System.out.print(", ");
            }
        }
        System.out.println("]");

        // Find the minimum and average manually
        int minVal = numbers.get(0);
        double totalSum = 0;
        for (int num : numbers) {
            if (num < minVal) {
                minVal = num;
            }
            totalSum += num;
        }
        double avg = totalSum / numbers.size();

        // Output the minimum and average
        System.out.println("Minimum number is: " + minVal);
        System.out.println("Average is: " + avg);
    }
}