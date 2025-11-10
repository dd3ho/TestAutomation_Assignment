def simpleCipher(encrypted, i):
    result = ''
    for ch in encrypted:
        # Step 1: Subtract the ASCII value of 'A' (65) to make the range 0–25.
        # Example: 'V' → ord('V') = 86, ord('A') = 65
        # 86 - 65 = 21  → 'V' is at position 21 in the alphabet.

        # Step 2: Move backward by i positions.
        # index = 21 - 2 = 19

        # Step 3: Use % 26 to wrap around if the value goes below 0 or above 25.
        # (19 % 26) = 19 (still within range)
        # Example: if ch = 'A' → (0 - 2) % 26 = (-2) % 26 = 24 → corresponds to 'Y'

        # Step 4: Add ord('A') back to convert the number into an ASCII code.
        # chr(19 + 65) = chr(84) = 'T'

        result += chr((ord(ch) - ord('A') - i) % 26 + ord('A'))
    return result

print(simpleCipher("VTAOG", 2))
