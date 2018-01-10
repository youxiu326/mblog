/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.web.controller.desk.group;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import mblog.base.lang.Consts;
import mblog.core.data.Group;
import mblog.core.persist.service.GroupService;
import mblog.web.controller.BaseController;
import mblog.web.controller.desk.Views;

/**
 * Group 主页
 * @author langhsu
 *
 */
@Controller
public class GroupIndexController extends BaseController {
	@Autowired
	private GroupService groupService;
	
	@RequestMapping("/group/{groupKey}")
	public String root(@PathVariable String groupKey, ModelMap model,
			HttpServletRequest request) {
		// init params
		String order = ServletRequestUtils.getStringParameter(request, "order", Consts.order.NEWEST);
		int pn = ServletRequestUtils.getIntParameter(request, "pn", 1);
		Group group = groupService.getByKey(groupKey);
		
		// callback params
		model.put("group", group);
		model.put("order", order);
		model.put("pn", pn);
		return view(Views.ROUTE_POST_INDEX);
	}
	
}
