package com.ssm.service;

import com.ssm.bean.Employee;
import com.ssm.bean.EmployeeExample;
import com.ssm.dao.EmployeeMapper;
import org.mybatis.generator.codegen.ibatis2.model.ExampleGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    //查询所有员工和其部门信息
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    //添加员工信息
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    //检验用户名是否存在
    public boolean checkUser(String empName) {
        //创建查询条件
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria= employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        return employeeMapper.countByExample(employeeExample) == 0;
    }

    //根据id查询员工信息
    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    //更新员工信息
    public void update(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    //根据Id删除员工信息
    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    //批量删除
    public void deleteEmps(List<Integer> ids) {
        System.out.println(ids);
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(employeeExample);
    }
}
