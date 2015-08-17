package com.haige.schedule.utils;

import com.mysql.jdbc.StringUtils;
import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.converter.Converter;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class StringToTimeConverter implements Converter<String, Time> {

    @Override
    public Time convert(String strTime) {
        if (!StringUtils.isNullOrEmpty(strTime)) {
            try {
                if (strTime.length() <= 5) {
                    DateFormat df = new SimpleDateFormat("HH:mm");
                    return new java.sql.Time(df.parse(strTime).getTime());
                }
                if (strTime.length() <= 8) {
                    DateFormat df = new SimpleDateFormat("HH:mm:ss");
                    return new java.sql.Time(df.parse(strTime).getTime());
                } else {
                    DateFormat df = new SimpleDateFormat("HH:mm:ss");
                    return new java.sql.Time(df.parse(strTime).getTime());
                }
            } catch (ParseException pe) {
                pe.printStackTrace();
                throw new IllegalArgumentException(String.format("时间字符串解析转换失败-[%s]", strTime));
            } catch (ConversionFailedException ce) {
                ce.printStackTrace();
                throw new IllegalArgumentException(String.format("时间到字符串类型转换失败-[%s]", strTime));
            } catch (Exception e) {
                e.printStackTrace();
                throw new IllegalArgumentException(String.format("时间到字符串转换失败-[%s]", strTime));
            }

        }
        return null;
    }
}
