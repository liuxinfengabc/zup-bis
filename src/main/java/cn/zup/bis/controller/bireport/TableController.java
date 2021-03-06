package cn.zup.bis.controller.bireport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Driver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruisi.ext.engine.view.context.ExtContext;
import com.ruisi.ext.engine.view.context.MVContext;
import cn.zup.bis.entity.bireport.TableQueryDto;
import cn.zup.bis.service.bireport.TableService;
import cn.zup.bis.util.BaseController;
import cn.zup.bis.util.CompPreviewService;

import java.sql.*;

@Controller
@Scope("prototype")
@RequestMapping(value = "/rest/bis/bireport/TableController")
public class TableController extends BaseController {
	
	@Autowired
	private TableService tableService;

	@RequestMapping(value="/TableView", method = RequestMethod.POST)
	public @ResponseBody
    Object tableView(@RequestBody TableQueryDto tableJson, HttpServletRequest req, HttpServletResponse res) throws Exception {

		//放入request,方便访问
		req.setAttribute("table", tableJson);
		req.setAttribute("compId", String.valueOf(tableJson.getCompId()));

		String sql=tableService.createSql(tableJson,1);
		System.out.println(sql);
		String result=tableService.creattable(sql,tableJson);
		return result;
//		DriverManager.registerDriver(new Driver());
//
//		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bi-demo?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai", "root", "123456");
//
//		Statement stat = conn.createStatement();
//
//		ResultSet rs =  stat.executeQuery(sql);
//
//		while(rs.next()) {
//		           String name = rs.getString("first_letter");
//			           System.out.println(name);
//			       }








//
//		ExtContext.getInstance().removeMV(TableService.deftMvId);
//		CompPreviewService ser = new CompPreviewService(req, res, req.getServletContext());
//		ser.setParams(tableService.getMvParams());
//		ser.initPreview();
//
//
//		MVContext mv = tableService.json2MV(tableJson);
//
//
//
//		String ret = ser.buildMV(mv, req.getServletContext());



	}
}
