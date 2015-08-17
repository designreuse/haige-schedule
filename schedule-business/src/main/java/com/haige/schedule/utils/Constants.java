package com.haige.schedule.utils;

/**
 * @author lzheng
 * @version 1.0
 *          ${tags}
 */
public class Constants {

    public static final String CACHE_PAPER_QUES_ID = "paper_questions";
    public static final String[] EXAM_RECORD_COLUMNS = {"序号", "名称", "时间", "班 级", "学 号", "姓 名", "成 绩"};
    public static final String[] NOT_PARTICIPATE_COLUMNS = {"序号", "名称", "学 院", "专 业", "班 级", "学 号", "姓 名"};
    public static String DEFAULT_PASSWORD = "123456";

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