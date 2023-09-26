SELECT u.user_name AS 'pessoa_usuaria',
IF(MAX(p.playback_date) >= '2021-01-01', 'Ativa', 'Inativa') 
AS  'status_pessoa_usuaria'
FROM
	SpotifyClone.users u
LEFT JOIN
	SpotifyClone.playback p ON u.user_id = p.user_id
GROUP BY
	u.user_name
ORDER BY
	user_name;