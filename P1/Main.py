def main():
    # Get input from the user
    user_input = input("Enter single digit numbers separated by commas: ")

    # Extract single digit numbers into dynamic array
    numbers = []
    for i in range(0, len(user_input)):
        char = user_input[i]
        if char != ',':
            numbers.append(int(char))

    # Print the list of numbers
    print("Your numbers are:", numbers)

    # Find the minimum and average manually
    min_val = numbers[0]
    total_sum = 0
    for num in numbers:
        if num < min_val:
            min_val = num
        else:
            total_sum += num
    avg = total_sum / len(numbers)

    # Output the minimum and average
    print("Minimum number is:", min_val)
    print("Average is:", avg)

if __name__ == "__main__":
    main()