using System;
using System.Collections.Generic;

class MainClass {
    static void Main(string[] args) {
        // Get input from the user
        Console.Write("Enter single digit numbers separated by commas: ");
        string userInput = Console.ReadLine();

        // Extract single digit numbers into dynamic array
        List<int> numbers = new List<int>();
        for (int i = 0; i < userInput.Length; i++) {
            char c = userInput[i];
            if (c != ',') {
                numbers.Add(c - '0');
            }
        }

        // Print the list of numbers
        Console.Write("Your numbers are: [");
        for (int i = 0; i < numbers.Count; i++) {
            Console.Write(numbers[i]);
            if (i < numbers.Count - 1) {
                Console.Write(", ");
            }
        }
        Console.WriteLine("]");

        // Find the minimum and average manually
        int minVal = numbers[0];
        double totalSum = 0;
        for (int i = 0; i < numbers.Count; i++) {
            int num = numbers[i];
            if (num < minVal) {
                minVal = num;
            }
            totalSum += num;
        }
        double avg = totalSum / numbers.Count;

        // Output the minimum and average
        Console.WriteLine("Minimum number is: " + minVal);
        Console.WriteLine("Average is: " + avg);
    }
}