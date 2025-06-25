SELECT ROUND(COUNT(*)/(SELECT COUNT(DISTINCT player_id) from Activity),2) AS fraction
FROM activity
where (player_id, event_date) in 
(SELECT player_id, DATE_ADD(min(event_date), INTERVAL 1 DAY) as event_date
from Activity 
group by player_id)