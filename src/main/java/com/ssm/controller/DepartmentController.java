package com.ssm.controller;

import com.ssm.bean.Department;
import com.ssm.bean.Employee;
import com.ssm.bean.JsonMsg;
import com.ssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;



    //获取所有部门的信息
    @RequestMapping("/depts")
    @ResponseBody
    JsonMsg getDepts() {
        List<Department> list = departmentService.getDepts();
        return JsonMsg.success().add("depts",list);
    }
}
