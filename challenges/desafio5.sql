SELECT s.song_name AS 'cancao',
COUNT(p.song_id) AS 'reproducoes'
FROM
	SpotifyClone.songs s
LEFT JOIN
	SpotifyClone.playback p ON s.song_id = p.song_id
GROUP BY
	s.song_name
ORDER BY
	reproducoes DESC
LIMIT 2;