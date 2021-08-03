package com.SuHe.service;

import com.SuHe.bean.Employee;
import com.SuHe.bean.EmployeeExample;
import com.SuHe.bean.EmployeeExample.Criteria;
import com.SuHe.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shy
 * @create 2021-07-28 15:35
 */
@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }
    
    /**
     * @Description 员工保存
     * @author shy
     * @date  2021/7/30 12:22
     * @param employee
     * @return
    */
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    /**
     * @Description 校验用户名是否可用
     * @author shy
     * @date  2021/7/30 13:46
     * @param empName
     * @return boolean true:代表用户名可用 false:代表用户名不可用
    */
    public boolean checkUser(String empName) {
        EmployeeExample example = new EmployeeExample();
        Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    /**
     * @Description 按照员工id查询员工
     * @author shy
     * @date  2021/7/30 16:06
     * @param id
     * @return Employee
    */
    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    /**
     * @Description 员工编辑
     * @author shy
     * @date  2021/7/30 16:45
     * @param
     * @return
    */
    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
}
