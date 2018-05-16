package com.ssm.test;

import com.ssm.bean.Department;
import com.ssm.bean.Employee;
import com.ssm.dao.DepartmentMapper;
import com.ssm.dao.EmployeeMapper;
import javafx.application.Application;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.UUID;

import static java.lang.Class.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    SqlSession sqlSession;
    @Test
    public void testCRUD() {
//        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//        DepartmentMapper dm = ac.getBean(DepartmentMapper.class);
//        System.out.println(departmentMapper);
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

        EmployeeMapper em = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0;i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0,5)+i;
            em.insertSelective(new Employee(null,uid,"M",uid+"@xrj.com",1));
        }

    }

}
