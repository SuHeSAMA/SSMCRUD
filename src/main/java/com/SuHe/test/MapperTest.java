package com.SuHe.test;

import com.SuHe.bean.Department;
import com.SuHe.bean.Employee;
import com.SuHe.dao.DepartmentMapper;
import com.SuHe.dao.EmployeeMapper;
import com.sun.org.apache.xpath.internal.SourceTree;
import org.apache.ibatis.javassist.ClassPath;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sound.midi.Soundbank;
import java.util.UUID;

/**
 * @author shy
 * @create 2021-07-28 13:20
 * 1.导入springtest模块
 * 2.@contextconfiguration指定spring配置文件的位置
 * 3.直接auttowired要使用的组件即可
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    /**
     * @Description 测试DepartmentMapper
     * @author shy
     * @date  2021/7/28 13:23
     * @param
     * @return
    */
    @Test
    public void testCRUFD(){
//        1.创建springioc容器
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        2.从容器中获取mapper
//        DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);

//        System.out.println(departmentMapper);

//        插入几个部门
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"销售部"));

//        生成员工数据
//        employeeMapper.insertSelective(new Employee(null,"Tom","M","Tom@163.com",1));

//        批量插入多个员工，使用可以执行批量操作sqlSession
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0; i < 1000; i++) {
//            String uid = UUID.randomUUID().toString().substring(0, 5)+i;
//            mapper.insertSelective(new Employee(null,uid,"M",uid+"@163.com",1));
//        }
//
//        System.out.println("批量完成");
    }

}
