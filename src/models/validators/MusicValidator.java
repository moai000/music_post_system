package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Music;

public class MusicValidator {
    public static List<String> validate(Music m) {
        List<String> errors = new ArrayList<String>();

        String song_error = _validateSong(m.getSong());
        if(!song_error.equals("")) {
            errors.add(song_error);
        }

        String singer_error = _validateSinger(m.getSinger());
        if(!singer_error.equals("")) {
            errors.add(singer_error);
        }

        String genre_error = _validateGenre(m.getGenre());
        if(!genre_error.equals("")) {
            errors.add(genre_error);
        }


        return errors;
    }

    private static String _validateSong(String song) {
        if(song == null || song.equals("")) {
            return "曲名を入力してください。";
            }

        return "";
    }

    private static String _validateSinger(String singer) {
        if(singer == null || singer.equals("")) {
            return "歌手名を入力してください。";
            }

        return "";
    }

    private static String _validateGenre(String genre) {
        if(genre == null || genre.equals("")) {
            return "音楽のジャンルを選択してください。";
            }

        return "";
    }

}

