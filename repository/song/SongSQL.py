from repository import BaseSQL as bq


class SongSQL(bq.BaseSQL):
    def table_name(self) -> str:
        return "song"

    def insert_song(self, name: str, track: int, length: int, path: str, genre_id: int,
                    album_id: int) -> str:
        return "insert into %s (name_%s:, track_%s, length_%s, path_%s, genre_id_%s, album_id_%s)" \
               "values(%s, %s, %s, %s, %s, %s);" % (
                   self.table_name, self.table_name, self.table_name, self.table_name,
                   self.table_name, self.table_name, self.table_name, name, track, length, path,
                   genre_id, album_id)