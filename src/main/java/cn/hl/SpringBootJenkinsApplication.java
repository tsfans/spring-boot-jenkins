package cn.hl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//@SpringBootApplication
//public class SpringBootJenkinsApplication {
//
//	public static void main(String[] args) {
//		SpringApplication.run(SpringBootJenkinsApplication.class, args);
//	}
//}
@SpringBootApplication
public class SpringBootJenkinsApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SpringBootJenkinsApplication.class);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(SpringBootJenkinsApplication.class, args);
    }

}
