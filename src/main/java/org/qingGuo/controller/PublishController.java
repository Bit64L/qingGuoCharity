package org.qingGuo.controller;


import org.qingGuo.common.PageParams;
import org.qingGuo.model.Commodity;
import org.qingGuo.model.User;
import org.qingGuo.service.impl.CommodityService;
import org.qingGuo.service.impl.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/publish")
public class PublishController {
    @Resource
    CommodityService commodityService;
    @Resource
    UserService userService;

    @RequestMapping(value = "commodityInfo")
    public String commodityInfo(){
        return "publish/commodityInfo";
    }

    @RequestMapping(value="commodityInfoSave")
    public String commodityInfoSave(Commodity commodity, HttpServletRequest request){
        request.getSession().setAttribute("commodity",commodity);
        return "publish/commodityImage";
    }

    @RequestMapping(value = "commodityImageSave")
    public String commodityImageSave(@RequestParam(value = "imageFile") MultipartFile imageFile, HttpServletRequest request){
        String uploadUrl = "/Users/Lwx/Workspace/usst/qingGuoCharity/upload";
        User user = (User) request.getSession().getAttribute("user");
        Commodity commodity = (Commodity)request.getSession().getAttribute("commodity");
        commodity.setStatus("待审核");//设置默认值
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("commodity",commodity);
        commodityService.insert(map);
        if(imageFile !=null ){
            userService.headSave(imageFile, uploadUrl + "/" + user.getId() + "/" + commodity.getId());
            commodity.setImage("/qingguo/upload/"+user.getId()+"/"+commodity.getId()+"/"+imageFile.getOriginalFilename().hashCode());
        }else{
            commodity.setImage("/qingguo/images/default-commodity-image");
        }
        map.put("commodity",commodity);
        commodityService.update(map);
        map.put("commodity",commodity);
        return "redirect:/publish/publishManage";
    }


    @RequestMapping(value = "publishManage")
    public String commodityManage(HttpServletRequest request, ModelMap modelMap,@RequestParam(value = "page",required = false) String page){
        int currPage = 1;
        if(page == null || page.equals("")) currPage = 1;
        else{
            try{
             currPage = Integer.parseInt(page);
            }catch (Exception e){
                currPage = 1;
            }
        }
        User user = (User)request.getSession().getAttribute("user");
        PageParams pageParams = commodityService.getCommoditiesByUser(currPage,user);
        modelMap.put("commodities",pageParams.getData());
        modelMap.put("pageParams",pageParams);
        return "user/publishManage";
    }

    @RequestMapping(value = "commodityDelete")
    public String commodityDelete(Commodity commodity,@RequestParam(value = "currPage")String currPage){
        Map<String,Object> map = new HashMap<>();
        map.put("commodity",commodity);
        commodityService.delete(map);
        return "redirect:/publish/publishManage?page="+currPage;
    }



    @RequestMapping(value = "commodityInfoEdit")
    public String commodityEdit(Commodity commodity,@RequestParam(value = "currPage")String currPage,HttpServletRequest request,ModelMap modelMap){
        Map<String,Object> map = new HashMap();
        map.put("commodity",commodity);
        List<Commodity> commodities = commodityService.get(map);
        request.getSession().setAttribute("currPage",currPage);
        modelMap.put("commodity",commodities.get(0));
        return "publish/commodityInfoEdit";
    }


    @RequestMapping(value = "commodityInfoEditSave")
    public String commodityInfoEditSave(Commodity commodity, ModelMap modelMap){
        Map<String,Object> map = new HashMap();
        map.put("commodity",commodity);
        commodityService.update(map);
        modelMap.put("commodity",commodity);
        return "publish/commodityImageEdit";
    }


    @RequestMapping(value = "commodityImageEditSave")
    public String commodityImageEditSave(@RequestParam(value = "imageFile") MultipartFile imageFile, HttpServletRequest request,Commodity commodity){
        if(imageFile != null){
            String uploadUrl = "/Users/Lwx/Workspace/usst/qingGuoCharity/upload";
            User user = (User) request.getSession().getAttribute("user");
            userService.headSave(imageFile, uploadUrl + "/" + user.getId() + "/" + commodity.getId());
            commodity.setImage("/qingguo/upload/"+user.getId()+"/"+commodity.getId()+"/"+imageFile.getOriginalFilename().hashCode());
            Map<String,Object> map = new HashMap<>();
            map.put("commodity",commodity);
            commodityService.update(map);
        }

        String currPage =(String) request.getSession().getAttribute("currPage");
        return "redirect:/publish/publishManage?page="+currPage;
    }

}
