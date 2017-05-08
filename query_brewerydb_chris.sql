SELECT 
	place_name,
    drink_name
FROM
	places p
    JOIN places_drinks pd
		USING(place_id)
	JOIN drinks d
		USING(drink_id)
WHERE drink_name = 'Feed the Monkey';



SELECT
	place_name
FROM
	places
	JOIN places_drinks
		USING(place_id)
	JOIN drinks
		USING(drink_id)
	JOIN drink_stats
		USING(drink_id)