package com.web;

import com.bean.Menu;
import com.github.pagehelper.PageInfo;
import com.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MenuController {
    @Autowired
    private MenuService menuService;

    @RequestMapping("/power/menu/getmenus")
    public  String getmenus(@RequestParam(defaultValue = "1") int index,
                            @RequestParam(defaultValue = "10") int size,
                            ModelMap map) {
        PageInfo pageInfo = menuService.getall2(index,size,-10);
        map.put("pi",pageInfo);
        return "/power/menu/list";
    }

    //查询一级菜单
    @RequestMapping("/power/menu/getupmenu")
    public String getup(ModelMap map) {
        List list = menuService.getall3();
        map.put("uplist",list);
        return "/power/menu/add";
    }

    @RequestMapping("/power/menu/addmenu")
    public String add(Menu menu) {
        menuService.insert(menu);
        return "redirect:/power/menu/getmenus";
    }

    //删除
    @RequestMapping("/power/menu/deletemenu")
    public void delte(int mid) {
        menuService.deleteByPrimaryKey(mid);
    }

  /*  //批量删除
    @RequestMapping("/power/menu/deleteall")
    public String deleteall(String[] menuids) {
        //1-1  2-3  3-4
        try {
            menuService.deletebyids(menuids);
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return "redirect:/power/menu/getmenus";
        }
        return "redirect:/power/menu/getmenus";
    }*/

    //批量删除
    @RequestMapping("/power/menu/deleteall")
    public String deleteall(String[] menuids){

        menuService.deletebyids(menuids);

        return "redirect:/power/menu/getmenus";
    }
}
