from models import Playlist as pl
from repository import BaseDAO as bdao
from repository.playlist import PlaylistSQL as plsql


class PlaylistDAO(bdao.BaseDAO):
    def __init__(self):
        super().__init__()
        self._sql = plsql.PlayList

    def get_insert_query(self, pla: pl.Playlist, user_id):
        return plsql.PlayList.insert_playlist(pla._id, pla._name, user_id)

    def query_by_user_id(self, user_id):
        pass

    def add_song_to_play_list(self, playlist_id, song_id):
        return "insert into playlist_has_song values(%s,%s);" % (playlist_id, song_id)
