#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main() {
    // Get input from the user
    cout << "Enter single digit numbers separated by commas: ";
    string userInput;
    getline(cin, userInput);

    // Extract single digit numbers into dynamic array
    vector<int> numbers;
    for (size_t i = 0; i < userInput.length(); i++) {
        char c = userInput[i];
        if (c != ',') {
            numbers.push_back(c - '0');
        }
    }

    // Print the list of numbers
    cout << "Your numbers are: [";
    for (size_t i = 0; i < numbers.size(); i++) {
        cout << numbers[i];
        if (i < numbers.size() - 1) {
            cout << ", ";
        }
    }
    cout << "]" << endl;

    // Find the minimum and average manually
    int minVal = numbers[0];
    double totalSum = 0;
    for (int num : numbers) {
        if (num < minVal) {
            minVal = num;
        }
        totalSum += num;
    }
    double avg = totalSum / numbers.size();

    // Output the minimum and average
    cout << "Minimum number is: " << minVal << endl;
    cout << "Average is: " << avg << endl;

    return 0;
}