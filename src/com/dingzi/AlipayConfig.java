package com.dingzi;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000120610147";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQDnqd6rTmOwGIgsnLSNbHSL13y6X+JbmNW6rEl+ZPAakEBhf+6Tdj4OfM/+JAe3zzg1aRQZPkNsXXyjmnfYQRFHygUk7Twao+TRw/Uq79L7UYrIGuEkTR0KWnfsaUMmLYsrFMOi/GF/hM6rFOWfMzZOVd3drdn7ZVpHpa+i9JKHKMysDxh1o4RisUPS+A4zGMzwoXpXCLwSZ7wouTPnIFDuEtOp2l3ap4d3ZvbzzvMFIv8C4OzS0ULlW6FwF4tO9U8FxFPY6GzlOxJ7LeSnyQpvhMcoJHoIT8TzvsJRY0DkiQrrMfRxL7MlWi1XpvAHkRPHiFxHPyJZzwbkYQR1Cz8PAgMBAAECggEBAI6cK88Y+pU1BN8xuJQ256gOh2HUFOx+MVQxKyz7xjMUCg37S0rLx3fzrbatR3MHxXpbrVu80JStGEU+mfguVgzzeCc7Q3zC1+Gp2AsOh7ref6ifo2lNb0soVhra0dN2xe1HYwe6heqSPwdiXdibFhszENmeZEo2IlVo0a5nEKzSbMQio22EaFjzaguoW06x6XPCq7IwwKk7It0ay25RXlmvjzK1/h2rwgVTf+13KjeGvBcp6gd5FvDls61scqYxFg3QzWeZTwOpObn+RqKz+5+cEbSBFCpJ2gXrvze+lknfAlCx+4s2tArny4I3ldobutX16kC2G8Woi8XHnJ6MmMECgYEA/yf7SPSM1LPxWe1WEpiiltYU0Ij3nyHEm2mWosT5abCoYteekmtGC2uNNEO2C39VQwyw9hrLPdmkVkKgeuaRfYVzZfchW3mlmxCY+NstWH9+N7Z0yXevyQ8wgQ+ZLImGnJCVM1jbXuWxnErXo4HwonfBprKy4QgFBM0NcvkmksUCgYEA6G3/wwP1MilRyewDgYX4kicP1ucdoi5xZ49hqZglgMeoatEVdokOIgktB6tUzqgqGcksQB0s3SISvYcczmYH9drVp7ltyLIKvx/ooEHN6SU6R6k0LZLsAA6NGwKNVAKLxTZKCKN1LYGGabITbEoFOjj6iZO7vcR8r7Zyxcgu18MCgYEAsUI8XzWNdONBg4DPMAIbygAV272bkVCrPnB/NrryrosMoAY9Ymjl818XbLyxhpFCUV9KvN5mXaSKd2a4CEmPv4zrW2XxJZSACRbhvti9SuLfc6LsxV3BoENOJgsJFZjBDJmhHVfYpreZyQNxhWTrIGNkBAPXI2An5GrzsfEG7CUCgYEAyfRJ9rjJo/wjBL/9i91MTjGCocfPB8wy3TjIMwPwEiVpQObLL2OG1CwE5FUKK0YSzrTtrgero7inb+amMPCWmhi67DFCItAQZmDjT9vdfmbKbNmobLDsPmBmWsGs6wILUCAL09WzSwbwM4Z3OfBW+m/nwQKMbib77/EnaJK3oOECgYEAkrICoij81hEn7cfz7lqRsI69/u9hciGPX3VAb120E1jZlVIC93siEyPix8qrX9WmpMkxl7De6iME+TT9HJbgm0Ew1a68tu69lxW6XPLb/mN2QYxM5/djPJ/V9x4UAy9rAihVMzVzbnZuR0OoC+85AXbxMBhRWXebOv2Q6Nx2D4U=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzncND1/XgKc2FVH1XFlMlJBYhof0xoLI+JQklhxEyTlJ8iZpEB3CmcxlOgUVJ98KlqLZRg45zRsPayZm/sCJfHD//aqODcNFMkzpiw5Z6YT1q1FYZzBfRUrNKF9TIyYDPAljkvHxU3W9Ib9o5aRcluPa0QcQVNpbTB4SASRbMOCfiaTRPyrtCP0ypLGlKQTPkLh2lMjFMBIQaQLHGkH1eqXAoJt4di3Wd4DpHTjqx2cx4lJUme1ntZ0xKYyEkihQcQaEZ+/S5euqUkGzM+BrExnNsSCJqkZFM/LORnH5XuziaVun8eIaubyxO6qcli8TpJIB9b+5H4vwlgJsRAsl/QIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://127.0.0.1:8080/Mall/addorderServlet";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/Mall/addorderServlet";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 沙箱支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

