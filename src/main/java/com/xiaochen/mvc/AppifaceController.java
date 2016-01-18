package com.xiaochen.mvc;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ObjectUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xiaochen.service.ApiService;
import com.xiaochen.util.SpringContextUtil;

/**
 * app接口
 * 
 * @author 小陈
 *
 */
@Controller
@RequestMapping("/app")
public class AppifaceController {

    private static final Logger LOGGER = LoggerFactory
            .getLogger(AppifaceController.class);

    /**
     * 一般form表单提交
     * 
     * @param paramMap
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ind", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public Object appInterface(@RequestParam Map<String, Object> paramMap,
            HttpServletRequest request) {
        return io(paramMap, request);
    }

    /**
     * 上传文件接口地址
     * 
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ind", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public Object io(
            @RequestParam Map<String, Object> paramMap,
            HttpServletRequest request,
            @RequestParam(value = "file", required = false) MultipartFile... files) {
        ResponseBodyResult rbr = new ResponseBodyResult();
        try {
            // ip地址
            String ipAddr = request.getRemoteAddr();
            // 获取serviceId
            String serviceId = ObjectUtils.toString(paramMap.get("serviceId"));
            LOGGER.info("!~~~~~~~");
            LOGGER.info("ipAddr:" + ipAddr);
            LOGGER.info("paramMap:" + paramMap);
            LOGGER.info("!~~~~~~");
            Assert.notNull(serviceId, "serviceId不能为空");
            // 添加附件(上传的文件)
            paramMap.put("attachments", files);
            // 获取service
            ApiService apiService = null;
            Object apiBean = SpringContextUtil.getBean(serviceId);
            if (apiBean == null) {
                Assert.isTrue(false, "未找到beanName为【" + serviceId + "】的service");
            }
            if (apiBean instanceof ApiService) {
                apiService = (ApiService) apiBean;
            }
            if (apiService == null) {
                Assert.isTrue(false, "beanName为【" + serviceId
                        + "】的service未继承ApiService");
            }
            // 获取返回值
            Object obj = apiService.execute(paramMap);
            List<Object> result = new ArrayList<Object>();
            if (obj instanceof Collection) {
                @SuppressWarnings("unchecked")
                Collection<Object> collection = (Collection<Object>) obj;
                result.addAll(collection);
            }
            if (obj instanceof Object) {
                result.add(obj);
            }
            rbr.setValue(result);
        } catch (IllegalArgumentException e1) {
            LOGGER.error("接口请求失败", e1);
            rbr.setErrorMsg(e1.getMessage());
        } catch (Exception e) {
            LOGGER.error("接口请求失败", e);
            rbr.setErrorMsg(e.getMessage());
        }
        return rbr;
    }

    /**
     * 结果集
     * 
     * @author xiaochen
     *
     */
    public class ResponseBodyResult {

        // 消息值
        private String message;

        // 状态值
        private int status = 1;

        // 结果集
        private List<?> value;

        public void setErrorMsg(String msg) {
            this.status = 0;
            this.message = msg;
        }

        public void setValue(List<?> val) {
            this.value = val;
        }

        public String getMessage() {
            return message;
        }

        public int getStatus() {
            return status;
        }

        public List<?> getValue() {
            return value;
        }

    }
}
