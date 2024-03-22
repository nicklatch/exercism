-- Schema: CREATE TABLE "difference-of-squares" ("number" INT", property" TEXT, "result" INT);
-- Task: update the difference-of-squares table and set the result based on the number and property fields.
UPDATE "difference-of-squares"
SET result = ((1 + number) * number >> 1) * ((1 + number) * number >> 1)
WHERE property = "squareOfSum";

UPDATE "difference-of-squares"
SET result = number * (1 + number) * ((number << 1) + 1) / 6
WHERE property = "sumOfSquares";

UPDATE "difference-of-squares"
SET result = number * (number + 1) * (3 * number + 2) * (number - 1) / 12
WHERE property = "differenceOfSquares";

