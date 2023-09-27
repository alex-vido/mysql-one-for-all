SELECT ar.artist_name AS 'artista',
al.album_name AS 'album'
FROM 
	SpotifyClone.artist ar
JOIN
	SpotifyClone.albums al ON ar.artist_id = al.artist_id
WHERE 
	ar.artist_name = 'Elis Regina'
ORDER BY
	artista;