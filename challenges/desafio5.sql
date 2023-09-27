SELECT s.song_name AS 'cancao',
COUNT(p.song_id) AS 'reproducoes'
FROM
	SpotifyClone.songs s
LEFT JOIN
	SpotifyClone.playback p ON s.song_id = p.song_id
GROUP BY
	cancao
ORDER BY
	reproducoes DESC, cancao
LIMIT 2;