-- Schema: CREATE TABLE "gigasecond" ("moment" TEXT, "result" TEXT);
-- Task: update the gigasecond table and set the result based on the moment.
UPDATE gigasecond
SET result = date(moment, '+1000000000 seconds') || 'T' || time(moment, '+1000000000 seconds');