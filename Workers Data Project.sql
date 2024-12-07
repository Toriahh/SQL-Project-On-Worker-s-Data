SELECT * FROM WORKER_DATA

-- ASSIGMENTS USING WORKERS DATA --

-- What is the average age of the educational status
SELECT education, AVG(age) AS average_age FROM WORKER_DATA
GROUP BY education
ORDER BY average_age

-- Group each of the races by count 
SELECT race, COUNT(race) AS Total_race FROM WORKER_DATA
GROUP BY race
ORDER BY Total_race


-- Is it true that the Black race has the highest capital loss? If not, Find out who does
SELECT race, SUM(capital_loss) AS total_capital_loss from WORKER_DATA
GROUP BY race
ORDER BY total_capital_loss DESC


-- NeoColonialism is known if Blacks works less hours than whites. Show if there is neocolonialism.
SELECT race, SUM(hours_per_week) AS total_hours_per_week FROM WORKER_DATA
WHERE race = 'White' or race = 'Black'
GROUP BY race
ORDER BY total_hours_per_week 


-- Show what gender work the most hours amongst the Black
SELECT gender, SUM(hours_per_week) AS total_hours_per_week, race FROM WORKER_DATA
WHERE race= 'Black'
GROUP BY gender, race
ORDER BY total_hours_per_week DESC


-- Show what occupation works the most hours among the whites 
SELECT TOP(3) occupation, race, SUM(hours_per_week) as total_hours FROM WORKER_DATA
WHERE race = 'White'
GROUP BY occupation, race
ORDER BY total_hours DESC


-- In the US, does the white work more than the Blacks ? Show with a table 
SELECT race, native_country, SUM(hours_per_week) AS Total_hours FROM WORKER_DATA
WHERE native_country = 'United-States'
GROUP BY race, native_country
ORDER BY Total_hours 


-- In Japan, does females earn more capital gains than males ?
SELECT native_country, gender, SUM(capital_gain) AS total_capital_gain FROM WORKER_DATA
WHERE native_country ='Japan'
GROUP BY gender, native_country
ORDER BY total_capital_gain DESC


-- The Income is distributed as Above 50k = 1, and BELOW 50k = 0. Find out what country has most of its female citizen earning above 50k
SELECT TOP(1) native_country, COUNT(gender) AS female_citizen_earning_above_50k FROM WORKER_DATA
WHERE gender = 'Female' AND income_50K = 1
GROUP BY native_country
ORDER BY female_citizen_earning_above_50k DESC


-- In the US, what marital_status type earns the most capital gain ?
SELECT TOP(1) marital_status, SUM(capital_gain) as USA_Total_capital_gain FROM WORKER_DATA
WHERE native_country = 'United-States'
GROUP BY marital_status
ORDER BY USA_Total_capital_gain DESC

-- In Japan, what Occupation type earns the most capital gain ?
SELECT TOP(1) occupation, SUM(capital_gain) as Japan_Total_capital_gain FROM WORKER_DATA
WHERE native_country = 'Japan'
GROUP BY occupation
ORDER BY Japan_Total_capital_gain DESC







