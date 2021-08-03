package com.SuHe.controller;

import com.SuHe.bean.Employee;
import com.SuHe.bean.Msg;
import com.SuHe.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.FileHandler;

/**
 * 处理员工CRUD请求
 * @author shy
 * @create 2021-07-28 15:22
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * @Description 根据id来修改员工信息
     * @author shy
     * @date  2021/7/30 16:40
     * @param
     * @return
    */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}" ,method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){
         employeeService.updateEmp(employee);
        return Msg.success();
    }

    /**
     * @Description 根据id查询员工
     * @author shy
     * @date  2021/7/30 16:35
     * @param id：员工id @PathVariable从@RequestMapping的value中{id}拿出值
     * @return msg
    */
    @RequestMapping(value = "/emp/{id}" ,method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){

        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }

    /**
     * @Description 判断用户名是否重复
     * @author shy
     * @date  2021/7/30 16:38
     * @param
     * @return
    */
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName")String empName){
//        先判断用户名是否合法
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名可以是2-5位中文也可以是6-16位字母和数字");

        }

        boolean b = employeeService.checkUser(empName);
        if (b){
            return Msg.success();
        }else {
            return Msg.fail().add("va_msg","用户名不可用");
        }
    }

    /**
     * @Description 员工信息保存
     * @author shy
     * @date  2021/7/30 12:20
     * @param
     * @return Msg
    */
    @ResponseBody
    @RequestMapping(value = "/emp" ,method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if (result.hasErrors()){
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError:errors) {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    /**
     * @Description 导入jackson包
     * @author shy
     * @date  2021/7/29 15:29
     * @param pn
     * @return PageInfo
    */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){

//        引入PageHelper分页插件
//        在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
//        startPage后面竟跟的这个查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
//        使用怕个info包装查询后的结构,只需要将pageInfo交给页面就行了
//        封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);

        return Msg.success().add("pageInfo",page);
    }

//    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
//
////        引入PageHelper分页插件
////        在查询之前只需要调用，传入页码，以及每页的大小
//        PageHelper.startPage(pn, 5);
////        startPage后面竟跟的这个查询就是一个分页查询
//        List<Employee> emps = employeeService.getAll();
////        使用怕个info包装查询后的结构,只需要将pageInfo交给页面就行了
////        封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数
//        PageInfo page = new PageInfo(emps,5);
//        model.addAttribute("pageInfo",page);
//
//        return "list";
//    }


}
