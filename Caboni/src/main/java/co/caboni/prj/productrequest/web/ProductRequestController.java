package co.caboni.prj.productrequest.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductRequestController {

	@RequestMapping("/productrequest.do")
	public String productrequest() {
		return "sales/productrequest";
		
	}
}
