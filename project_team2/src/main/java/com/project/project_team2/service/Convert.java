package com.project.project_team2.service;

import java.sql.Timestamp;
import java.time.*;
import java.time.format.*;
import java.util.*;
import org.json.simple.*;
import org.json.simple.parser.*;

public class Convert {

    public static DateTimeFormatter DATE_TIME_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    public static LocalDateTime convert(Timestamp timestamp) {
        if (timestamp != null) {
            return timestamp.toLocalDateTime();
        }

        return null;
    }

    public static String convert(LocalDateTime datetime) {
        if (datetime != null) {
            return datetime.format(DATE_TIME_FORMAT);
        }

        return null;
    }

    public static List<String> toList(String json) {
        List<String> list = new ArrayList<>();

        try {
            JSONArray arr = (JSONArray) new JSONParser().parse(json);
            for (Object img : arr) {
                list.add((String) img);
            }
        } catch (ParseException ex) {
            System.err.println(ex.getMessage());
        }

        return list;
    }

    public static String toJson(List<String> list) {
        JSONArray json = new JSONArray();

        for (String img : list) {
            json.add(img);
        }

        return json.toJSONString();
    }

}
