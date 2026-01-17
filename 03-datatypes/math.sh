# (( )) — Arithmetic Context

a=10
b=20
((sum = a + b))
# echo "$a + $b = $sum"

# direct result
echo "$a * $b = $((Multiplication = a * b))"

# Increment & Decrement

((i++))
((i--))
((++i))

# Floating point

echo "5.3 + 7.8" | bc

# Floating point with scale

echo "10/3" | bc # without scale 3

echo "scale=2; 10/3" | bc # with scale 3.33

# Multiple operation

echo "3.9 + 5.3 * 2.6" | bc

# Square root (requires -l flag for math library)
echo "sqrt(16)" | bc -l                  # Output: 4.0000000000

# Trigonometric functions (in radians)
echo "s(3.14159/2)" | bc -l              # Sine of 90 degrees
echo "c(0)" | bc -l                      # Cosine of 0

# Natural logarithm
echo "l(2.71828)" | bc -l                # ln(e) ≈ 1.000000

# Exponentiation
echo "e(1)" | bc -l                      # e^1 ≈ 2.71828182846


# Using variables in calculations
x=5.75
y=2.25
echo "$x + $y" | bc                      # Output: 8.00
result=$(echo "$x * $y" | bc)
echo $result                             # Output: 12.9375