package com.xiaochen.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public final class SpringContextUtil implements ApplicationContextAware {

    private ApplicationContext context;

    private static SpringContextUtil springContextUtil = null;

    public SpringContextUtil() {
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        SpringContextUtil.getInstance().setContext(applicationContext);
    }

    /**
     * 初始化单例类
     * 
     * @return
     */
    public static SpringContextUtil getInstance() {
        if (springContextUtil == null) {
            synchronized (SpringContextUtil.class) {
                if (springContextUtil == null) {
                    springContextUtil = new SpringContextUtil();
                }
            }
        }
        return springContextUtil;
    }

    private void setContext(final ApplicationContext pContext) {
        this.context = pContext;
    }

    private ApplicationContext getContext() {
        return context;
    }

    /**
     * 获取ApplicationContext
     * 
     * @return
     */
    public static ApplicationContext getCtx() {
        return SpringContextUtil.getInstance().getContext();
    }

    /**
     * 根据类名获取bean
     * 
     * @param beanType
     * @return
     */
    public static <T> T getBean(Class<T> beanType) {
        T t = getCtx().getBean(beanType);
        return t;
    }

    /**
     * 根据beanId获取bean
     * 
     * @param beanId
     * @return
     */
    @SuppressWarnings("unchecked")
    public static <T> T getBean(String beanId) {
        T t = (T) getCtx().getBean(beanId);
        return t;
    }
}
