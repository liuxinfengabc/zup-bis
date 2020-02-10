package cn.zup.bis.util;

import cn.zup.bis.entity.RequestStatus;
import cn.zup.bis.entity.Result;

public class BaseController {

	public Object buildSucces(){
		return new Result(RequestStatus.SUCCESS.getStatus(), "操作成功", null);
	}
	
	public Object buildSucces(Object datas){
		return new Result(RequestStatus.SUCCESS.getStatus(), "操作成功", datas);
	}
	
	public Object buildSucces(com.github.pagehelper.PageInfo<?> page){
		Long total = page.getTotal();
	   // Integer pageIndex = page.getPageNum();
	   // Integer pageSize = page.getPageSize();
	    Object datas = (Object) page.getList();
		return new Result(RequestStatus.SUCCESS.getStatus(), "操作成功", datas, total);
	}
	
	public Object buildError(String msg){
		return new Result(RequestStatus.FAIL_FIELD.getStatus(), msg, null);
	}
}
