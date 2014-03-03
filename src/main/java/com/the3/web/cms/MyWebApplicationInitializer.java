//package com.the3.web.cms;
//
//import javax.servlet.ServletContext;
//
//import org.springframework.web.WebApplicationInitializer;
//import org.springframework.web.servlet.DispatcherServlet;
//
//public class MyWebApplicationInitializer implements WebApplicationInitializer {
//
//    @Override
//    public void onStartup(ServletContext container) {
//        ServletRegistration.Dynamic registration = container.addServlet("dispatcher", new DispatcherServlet());
//        registration.setLoadOnStartup(1);
//        registration.addMapping("/example/*");
//    }
//
//}
