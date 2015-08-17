package com.haige.schedule.utils;

import com.mysql.jdbc.StringUtils;
import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.converter.Converter;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class StringToDateConverter implements Converter<String, Date> {

    @Override
    public Date convert(String strDate) {
        if (!StringUtils.isNullOrEmpty(strDate)) {
            try {
                if (strDate.length() <= 5) {
                    DateFormat df = new SimpleDateFormat("HH:mm");
                    return new java.sql.Date(df.parse(strDate).getTime());
                }
                if (strDate.length() <= 8) {
                    DateFormat df = new SimpleDateFormat("HH:mm:ss");
                    return new java.sql.Date(df.parse(strDate).getTime());
                } else if (strDate.length() <= 10 && strDate.length() > 8) {
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    return new java.sql.Date(df.parse(strDate).getTime());
                } else if (strDate.length() <= 16 && strDate.length() > 10) {
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    return new java.sql.Date(df.parse(strDate).getTime());
                } else if (strDate.length() <= 19 && strDate.length() > 16) {
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    return new java.sql.Date(df.parse(strDate).getTime());
                } else {
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    return new java.sql.Date(df.parse(strDate).getTime());
                }
            } catch (ParseException pe) {
                pe.printStackTrace();
                throw new IllegalArgumentException(String.format("日期字符串解析转换失败-[%s]", strDate));
            } catch (ConversionFailedException ce) {
                ce.printStackTrace();
                throw new IllegalArgumentException(String.format("日期到字符串类型转换失败-[%s]", strDate));
            } catch (Exception e) {
                e.printStackTrace();
                throw new IllegalArgumentException(String.format("日期到字符串转换失败-[%s]", strDate));
            }

        }
        return null;
    }
}
