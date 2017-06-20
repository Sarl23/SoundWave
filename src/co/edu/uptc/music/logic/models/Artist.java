package co.edu.uptc.music.logic.models;

public class Artist {
    private String name;
    private GenreType genre;
    private String img;

    public Artist(String name, GenreType genre, String img) {
        this.name = name;
        this.genre = genre;
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public GenreType getGenre() {
        return genre;
    }

    public String getImg() {
        return img;
    }

    @Override
    public String toString() {
        return "Artist{" +
                "name='" + name + '\'' +
                ", genre='" + genre + '\'' +
                ", img='" + img + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Artist)) return false;
        Artist artist = (Artist) o;
        return getName().equals(artist.getName());
    }

}