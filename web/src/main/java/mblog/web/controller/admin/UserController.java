/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package mblog.web.controller.admin;

import mblog.base.data.Data;
import mblog.base.lang.Consts;
import mblog.modules.authc.service.RoleService;
import mblog.modules.authc.service.UserRoleService;
import mblog.modules.user.data.UserVO;
import mblog.modules.user.service.UserService;
import mblog.web.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

/**
 * @author langhsu
 *
 */
@Controller("adminUserController")
@RequestMapping("/admin/user")
public class UserController extends BaseController {
	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private UserRoleService userRoleService;

	@RequestMapping("/list")
	@RequiresPermissions("user:list")
	public String list(ModelMap model) {
		Pageable pageable = wrapPageable();
		Page<UserVO> page = userService.paging(pageable);
		model.put("page", page);
		return "/admin/user/list";
	}

	@RequestMapping("/view")
	public String view(Long id, ModelMap model) {
		UserVO view = userService.get(id);
		model.put("view", view);
		model.put("roles", roleService.list());
		return "/admin/user/view";
	}

	@PostMapping("/update_role")
	@RequiresPermissions("user:role")
	public String postAuthc(Long id, @RequestParam(value = "roleIds", required=false) Set<Long> roleIds, ModelMap model) {
		userRoleService.updateRole(id, roleIds);
		model.put("data", Data.success());
		return "redirect:/admin/user/list";
	}

	@RequestMapping(value = "/pwd", method = RequestMethod.GET)
	@RequiresPermissions("user:pwd")
	public String pwsView(Long id, ModelMap model) {
		UserVO ret = userService.get(id);
		model.put("view", ret);
		return "/admin/user/pwd";
	}

	@RequestMapping(value = "/pwd", method = RequestMethod.POST)
	@RequiresPermissions("user:pwd")
	public String pwd(Long id, String newPassword, ModelMap model) {
		UserVO ret = userService.get(id);
		model.put("view", ret);

		try {
			userService.updatePassword(id, newPassword);
			model.put("message", "修改成功");
		} catch (IllegalArgumentException e) {
			model.put("message", e.getMessage());
		}
		return "/admin/user/pwd";
	}

	@RequestMapping("/open")
	@RequiresPermissions("user:open")
	public @ResponseBody Data open(Long id) {
		userService.updateStatus(id, Consts.STATUS_NORMAL);
		Data data = Data.success("操作成功", Data.NOOP);
		return data;
	}

	@RequestMapping("/close")
	@RequiresPermissions("user:close")
	public @ResponseBody Data close(Long id) {
		userService.updateStatus(id, Consts.STATUS_CLOSED);
		Data data = Data.success("操作成功", Data.NOOP);
		return data;
	}
}
