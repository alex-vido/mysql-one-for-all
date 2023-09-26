SELECT 
	u.user_name AS 'pessoa_usuaria',
	COUNT(p.song_id) AS 'musicas_ouvidas',
    ROUND(SUM(s.duration_sec / 60), 2) AS 'total_minutos'
FROM
	SpotifyClone.users u
LEFT JOIN
	SpotifyClone.playback p ON u.user_id = p.user_id
LEFT JOIN
	SpotifyClone.songs s ON p.song_id = s.song_id
GROUP BY u.user_name
ORDER BY u.user_name ASC;