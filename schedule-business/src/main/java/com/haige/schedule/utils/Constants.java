package com.haige.schedule.utils;

public class Constants {

    public static String DEFAULT_PASSWORD = "123456";

    public enum Sex {
        Male("��"), Female("Ů");
        private String title;

        private Sex(String title) {
            this.title = title;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }
    }
}