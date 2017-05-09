-- Find all vendors that serve a specific drink (2013 Fanfare)
SELECT 
	d.drink_name,
    p.place_name,
    p.state
FROM places p
JOIN places_drinks pd
	ON p.place_id = pd.place_id
JOIN drinks d
	ON pd.drink_id = d.drink_id
WHERE d.drink_name = '2013 Fanfare';


-- Count the number of beers a specific bar (Jailbreak Brewing Company) has on tap
SELECT
	COUNT(pd.drink_id) AS numb_of_beers_on_tap,
    st.serve_type_dscp,
    p.place_name
FROM places p
JOIN places_drinks pd
	USING(place_id)
JOIN serve_types st
	ON pd.serve_type = st.serve_type_id
WHERE serve_type_id = 2
GROUP BY p.place_id, st.serve_type_dscp
HAVING p.place_name = 'Jailbreak Brewing Company';