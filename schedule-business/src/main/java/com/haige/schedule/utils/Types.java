package com.haige.schedule.utils;

public class Types {

    public enum Sex {
        Male("男"), Female("女");
        private String realName;

        private Sex(String realName) {
            this.realName = realName;
        }

        public String getRealName() {
            return realName;
        }

        public void setRealName(String realName) {
            this.realName = realName;
        }
    }
}
