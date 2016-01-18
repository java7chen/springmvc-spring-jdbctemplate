package com.xiaochen;

import java.io.IOException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.net.ssl.SSLContext;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.ObjectUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.ByteArrayBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.ssl.SSLContextBuilder;
import org.apache.http.ssl.TrustStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * app接口测试
 * 
 * @author 小陈
 *
 */
public class AppIfaceTest {

    private static CloseableHttpClient httpClient = null;

    private static String url = "http://localhost:8080/app/ind";

    public static CloseableHttpClient createSSLInsecureClient() {
        try {
            SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(
                    null, new TrustStrategy() {

                        // 信任所有
                        public boolean isTrusted(X509Certificate[] chain,
                                String authType) throws CertificateException {
                            return true;
                        }
                    }).build();
            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
                    sslContext);
            return HttpClients.custom().setSSLSocketFactory(sslsf).build();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return HttpClients.createDefault();
    }

    public static void main(String[] args) {
        httpClient = createSSLInsecureClient();
        getUser();
    }

    public static void getUser() {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("serviceId", "user$$getUserInfo$$V01");
        try {
            Map<String, Object> resMap = test1(paramMap);
            System.out.println(resMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 测试公共方法
     * 
     * @param paramMap
     * @param attachment
     * @return
     * @throws IOException
     * @throws ClientProtocolException
     */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> test1(Map<String, Object> paramMap,
            byte[]... files) throws ClientProtocolException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        HttpPost post = new HttpPost(url);
        MultipartEntityBuilder builder = MultipartEntityBuilder.create();
        Iterator<String> it = paramMap.keySet().iterator();
        while (it.hasNext()) {
            String key = it.next();
            StringBody body = new StringBody(ObjectUtils.toString(paramMap
                    .get(key)), ContentType.APPLICATION_JSON);
            builder.addPart(key, body);
        }
        if (files != null) {
            for (byte[] file : files) {
                builder.addPart("file", new ByteArrayBody(file, "data"));
            }
        }
        HttpEntity entity = builder.build();
        post.setEntity(entity);
        CloseableHttpResponse response = httpClient.execute(post);
        String content = IOUtils.toString(response.getEntity().getContent(),
                "UTF-8");
        System.out.println(content);
        Map<String, Object> resMap = objectMapper.readValue(content, Map.class);
        return resMap;
    }
}
