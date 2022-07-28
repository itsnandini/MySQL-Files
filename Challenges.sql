/* these are the columns we want to output */
SELECT h.hacker_id, 
       h.name, 
       COUNT(c.challenge_id) AS c_count
       
/* this is the join we want to output them from */
FROM Hackers h
JOIN Challenges c ON c.hacker_id = h.hacker_id

/* after they have been grouped by hacker */
GROUP BY h.hacker_id, h.name

/* but we want to be selective about which hackers we output */
/* having is required (instead of where) for filtering on groups */
HAVING c_count = 

    /* output anyone with a count that is equal to... */
    (SELECT COUNT(c2.challenge_id) AS c_max
            /* the max count that anyone has */
     FROM challenges as c2 
     GROUP BY c2.hacker_id 
     ORDER BY c_max DESC limit 1)
     
/* or anyone who's count is in... */
OR c_count IN 
    /* the set of counts... */
    (SELECT DISTINCT c_compare AS c_unique
     FROM (SELECT h2.hacker_id, 
                  h2.name, 
                  COUNT(challenge_id) AS c_compare
           FROM Hackers h2
           JOIN Challenges c ON c.hacker_id = h2.hacker_id
           GROUP BY h2.hacker_id, h2.name) counts
     GROUP BY c_compare
     HAVING COUNT(c_compare) = 1)
ORDER BY c_count DESC, h.hacker_id;
