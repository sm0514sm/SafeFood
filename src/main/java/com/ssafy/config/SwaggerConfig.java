package com.ssafy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2			//스웨거 환경 설정
public class SwaggerConfig {
	@Bean
	public Docket api() {
		return new Docket(DocumentationType.SWAGGER_2)
				.groupName("LKK")	//서비스할 project이름이나 Domain이름 
				.apiInfo(info())	//스웨거 화면에 표시할 설명 정보 
				.select()
				//rest 서비스할 Controller가 있는 package 지정
				.apis(RequestHandlerSelectors.basePackage("com.ssafy.controller"))
				//PathSelectors.any()	//어떤 path든 스웨거를 모두 만든다. 
				//PathSelectors.ant(pattern)	//지정한 pattern들만 스웨거를 만든다. 
				.paths(PathSelectors.ant("/rest/**"))
				.build();
	}

	private ApiInfo info() {
		return new ApiInfoBuilder().title("Phone ManagementAPI")
				.description("음식 관리를 위한 <b>CRUD</b>")
				.license("이상민의 허락을 맡아야 합니다.")
				.version("1.0.1")
				.build();
			
	}
	
	
}
