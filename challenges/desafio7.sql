SELECT ar.artist_name AS 'artista',
al.album_name AS 'album',
COUNT(f.user_id) AS 'pessoas_seguidoras'
FROM 
	SpotifyClone.artist ar
JOIN
	SpotifyClone.albums al ON ar.artist_id = al.artist_id
JOIN
	SpotifyClone.following f ON ar.artist_id = f.artist_id
GROUP BY
	artista, album
ORDER BY
	pessoas_seguidoras DESC, artista, album;
