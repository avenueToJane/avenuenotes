![](https://raw.githubusercontent.com/westlifeyang/image/master/img/1b4f4fd838ca3a7c1d50eac2da21603a.jpg)![](https://snowdreams1006.github.io/snowdreams1006-wechat-public.jpeg)

|  |  |  |  |
| :--- | :--- | :--- | :--- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |


```
 private Map<Long, BadWebBlacklist> getOriginalBlackListFile(String filePath) {
        Map<Long, BadWebBlacklist> badWebBlacklists = new HashMap<>(10240);
        File file = new File(filePath);
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(file);
            List<String> data = IOUtils.readLines(inputStream, StandardCharsets.UTF_8);
            if (!ObjectUtils.isEmpty(data)) {
                for (String datum : data) {
                    String[] split = datum.split(",");
                    BadWebBlacklist badWebBlacklist = new BadWebBlacklist();
                    badWebBlacklist.setBlacklistId(Long.valueOf(split[0]));
                    badWebBlacklist.setDomain(split[1]);
                    badWebBlacklist.setBadType(Integer.valueOf(split[2]));
                    badWebBlacklists.put(badWebBlacklist.getBlacklistId(), badWebBlacklist);
                }
            }
        } catch (IOException e) {
            log.error("get original Black List File error!!! file path: {}", filePath, e.fillInStackTrace());
        } finally {
            try {
                IOUtils.close(inputStream);
            } catch (IOException e) {
                log.error("close inputStream error!!! file path: {}", filePath, e.fillInStackTrace());
            }
        }
        return badWebBlacklists;
    }
```
![](https://img-blog.csdnimg.cn/img_convert/9f77efebd9ede01d1aaa3c7fa4d5b8bb.png)
![](https://gitee.com/avenueToJane/img/raw/master/image/20230215105001.png)

