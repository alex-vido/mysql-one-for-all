SELECT COUNT(p.song_id) AS 'musicas_no_historico'
FROM 
	SpotifyClone.playback p
JOIN
	SpotifyClone.users u ON p.user_id = u.user_id
WHERE 
	u.user_name = 'Barbara Liskov';