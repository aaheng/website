package cn.website.service;


import org.apache.commons.lang3.CharUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

@Service
public class SensitiveService implements InitializingBean {
    private static final Logger logger = LoggerFactory.getLogger(SensitiveService.class);
    //这个方法代表属性初始化完成后所进行的操作,这里我们要进行敏感词文本的读取
    public void afterPropertiesSet() throws Exception {
        rootNode = new TrieNode();
        try {
            String fileName = "E:\\code\\my\\website\\website-page\\website-page-web\\src\\main\\resources\\SensitiveWords.txt";
            BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(new FileInputStream(fileName),"UTF-8"));
            String lineTxt;
            while ((lineTxt = bufferedReader.readLine()) != null) {
                lineTxt = lineTxt.trim();
                addWords(lineTxt);
            }
            bufferedReader.close();
        } catch (Exception e) {
            logger.error("读取敏感词文件失败" + e.getMessage());
        }
    }

    private class TrieNode {
        /**
         * true 关键词的终结 ； false 继续
         */
        private boolean end = false;

        /**
         * key下一个字符，value是对应的节点
         */
        private Map<Character, TrieNode> subNodes = new HashMap<Character, TrieNode>();

        /**
         * 向指定位置添加节点树
         */
        void addSubNode(Character key, TrieNode node) {
            subNodes.put(key, node);
        }

        /**
         * 获取下个节点
         */
        TrieNode getSubNode(Character key) {
            return subNodes.get(key);
        }

        boolean isKeywordEnd() {
            return end;
        }

        void setKeywordEnd(boolean end) {
            this.end = end;
        }

        public int getSubNodeCount() {
            return subNodes.size();
        }
    }

    //设置根节点
    private TrieNode rootNode = new TrieNode();

    //读一行文本
    public void addWords(String lineTxt) {
        //设置当前节点所在的位置,开始默认为根节点
        TrieNode tempNode = rootNode;
        //对这一行文本进行遍历
        for (int i = 0; i < lineTxt.length(); i++) {
            //取出每一个字符,和根节点下面的子节点进行比对
            Character c = lineTxt.charAt(i);
            //过滤空格
            if (isSymbol(c)){
                continue;
            }
            //到子节点中去比对
            TrieNode node = tempNode.getSubNode(c);
            if (node == null) {
                //说明这个前缀树中还没有这个节点,那么需要将这个节点添加进去
                node = new TrieNode();
                tempNode.addSubNode(c, node);
            }
            //此时的当前节点应该是新增加的节点,或者是根据c获取到的节点
            tempNode = node;
            if (i == lineTxt.length() - 1) {
                tempNode.setKeywordEnd(true);
            }
        }
    }
    /**
     * 判断是否是一个符号
     */
    private boolean isSymbol(char c) {
        int ic = (int) c;
        // 0x2E80-0x9FFF 东亚文字范围
        return !CharUtils.isAsciiAlphanumeric(c) && (ic < 0x2E80 || ic > 0x9FFF);
    }

    //过滤关键字
    public String filterWords(String words) {
        if (StringUtils.isBlank(words)) {
            return words;
        }
        String replacement = "***";
        StringBuilder result = new StringBuilder();

        TrieNode tempNode = rootNode;
        int begin = 0; // 回滚数
        int position = 0; // 当前比较的位置

        while (position < words.length()) {
            char c = words.charAt(position);
            // 空格直接跳过
            if (isSymbol(c)) {
                if (tempNode == rootNode) {
                    result.append(c);
                    ++begin;
                }
                ++position;
                continue;
            }

            tempNode = tempNode.getSubNode(c);

            // 当前位置的匹配结束
            if (tempNode == null) {
                // 以begin开始的字符串不存在敏感词
                result.append(words.charAt(begin));
                // 跳到下一个字符开始测试
                position = begin + 1;
                begin = position;
                // 回到树初始节点
                tempNode = rootNode;
            } else if (tempNode.isKeywordEnd()) {
                // 发现敏感词， 从begin到position的位置用replacement替换掉
                result.append(replacement);
                position = position + 1;
                begin = position;
                tempNode = rootNode;
            } else {
                ++position;
            }
        }

        result.append(words.substring(begin));

        return result.toString();
    }


    public static void main(String[] args) {
        SensitiveService service = new SensitiveService();
        service.addWords("色情");
        service.addWords("赌博");
        System.out.println(service.filterWords("hello  色 情"));
    }


}
