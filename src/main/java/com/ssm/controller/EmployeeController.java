package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.bean.Employee;
import com.ssm.bean.JsonMsg;
import com.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    //根据id查询员工信息
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody   //@PathVariable表示从路径中获取参数
    public JsonMsg getEmp(@PathVariable("id") Integer id) {
       Employee employee = employeeService.getEmp(id);
       return JsonMsg.success().add("emp",employee);
    }

    //检查用户名是否可用
    @RequestMapping("/checkuser")
    @ResponseBody
    public JsonMsg checkUser(@RequestParam("empName") String empName) {
        //进行格式用户名格式校验
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
         if(!empName.matches(regx)) {
            return JsonMsg.fail().add("va_msg","用户名必须是6-16位字母数字或者2-5位汉字");
         }
         if(employeeService.checkUser(empName)){
             return JsonMsg.success();
         } else {
             //返回200状态码
             return JsonMsg.fail().add("va_msg","用户名已存在!");
         }
    }


    @RequestMapping("/emps")
    @ResponseBody//自动将返回的数据转换成json
    JsonMsg getEmpsWithJson(@RequestParam(value = "page",defaultValue = "1") Integer page, Model model) {
        PageHelper.startPage(page,5);
        List<Employee> emps = employeeService.getAll();
        //PageInfo封装了所有数据,设置传入连续的分页显示数为5
        PageInfo pageInfo = new PageInfo(emps,5);
        return JsonMsg.success().add("pageInfo",pageInfo);
    }

    //保存员工信息
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg saveEmp(@Valid Employee employee,BindingResult result) {
        System.out.println(employee);
        System.out.println(result.getFieldError());

        if(result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return JsonMsg.fail().add("errorFields", map);
        }else{
            employeeService.saveEmp(employee);
            return JsonMsg.success();
        }
    }

    //更新员工信息
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public JsonMsg saveEmp(Employee employee) {
        employeeService.update(employee);
        return JsonMsg.success();
    }

    //删除员工(批量删除和单个删除）
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public JsonMsg deleteEmp(@PathVariable("ids") String ids) {
        if(ids.contains(",")) {//批量删除
            String idStrs[] = ids.split(",");
            List<Integer> list = new ArrayList<>();
            for(String idStr:idStrs){
                list.add(Integer.parseInt(idStr));
            }
            employeeService.deleteEmps(list);
        }else {//单个删除
            employeeService.deleteEmp(Integer.valueOf(ids));
        }
        return JsonMsg.success();
    }
}
