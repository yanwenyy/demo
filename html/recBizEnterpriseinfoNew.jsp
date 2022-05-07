<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/pages/inc/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>组织机构信息管理</title>
<style>
	.table_list thead{
		background:#f2f2f2;
	}
	.table_list th,.table_list td{
		text-align:center;
		padding:10px 0;
	}
		#dutyTable_newFzr thead{
		background:#f2f2f2;
	}
	.table_list th,.table_list td{
		text-align:center;
		padding:10px 0;
	}
	.key_show{
		float: left;
	    margin-bottom: 1px;
	}
	.blue{
		color:blue!important;
	}
	.dutyTable_new_input{
		padding-left:10px;
	}
	.dutyTable_new_inputFzr{
		padding-left:10px;
	}
	.addleader_new,.delleader_new{
		cursor:pointer;
		margin-right:10px;
	}
	.btn_hide{
		display:none;
	}
	.btn_show{
		display:inline-block;
	}
</style>
<%@ include file="/pages/inc/header.jsp" %>
</head>
<body>
<%@ include file="/pages/inc/common.jsp" %>
<div id="container" class="main">
    <div class="barTitle">
		<div class="content"><a href="javascript:;" onfocus="this.blur();"></a> <span>组织机构信息管理</span></div>
	</div>
    <hr class="barTitleHr"></hr>

    <div class="ui-table ui-widget ui-corner-all">
		<button id="complete_button" type="button" onclick="complete();">完成</button>
		<!-- <button id="submit_button" type="button" onclick="confirm();">提交</button> -->
		<button id="report_button" type="button" onclick="reportUp()">上报</button>
	</div>
	<div class="barTitle">
		<div class="content"><a href="javascript:;" onfocus="this.blur();"></a> <span>企业基本信息 </span></div>
	</div>
	<div class="ui-table ui-widget ui-corner-all">
		<button id="save_button" type="button" onclick="save();">保存</button>
	</div>
	<form id="recBizEnterpriseinfoForm" action="<c:url value='/recBizEnterpriseinfo/save'/>"  method="post" >
     <input type="hidden" class="text" id ="enterpriseinfoId" name="enterpriseinfoId" value="<c:out value='${recBizEnterpriseinfo.enterpriseinfoId}'/>"/>
     <input type="hidden" class="text" id ="bizEnterpriseinfoId" name="bizEnterpriseinfoId" value="<c:out value='${recBizEnterpriseinfo.bizEnterpriseinfoId}'/>"/>
     <input type="hidden" class="text" id ="wfstatus" name="wfstatus" value="<c:out value='${recBizEnterpriseinfo.wfstatus}'/>"/>
     <input type="hidden" class="text" id ="wfstatusname" name="wfstatusname" value="<c:out value='${recBizEnterpriseinfo.wfstatusname}'/>"/>
    <div class="ui-table ui-widget ui-corner-all ui-border">
		<table class="table forview">
			<!-- <tr>
				<td class="inputLabelTd">enterpriseinfoId：</td>
				<td class="inputTd">
					<input id="enterpriseinfoId" name="enterpriseinfoId" type="text" class="text"/>
				</td>

				<td class="inputLabelTd">bizEnterpriseinfoId：</td>
				<td class="inputTd">
					<input id="bizEnterpriseinfoId" name="bizEnterpriseinfoId" type="text" class="text"/>
				</td>

			</tr> -->
			<tr>
				<td class="inputLabelTd"><span style="color:red">*</span>集团全称：</td>
				<td class="inputTd">
					<input id="groupName" name="groupName" type="text" class="text" style="width:98%;" value="<c:out value='${recBizEnterpriseinfo.groupName}'/>"/>
				</td>

				<td class="inputLabelTd"><span style="color:red">*</span>集团英文名称：</td>
				<td class="inputTd">
					<input id="groupEngName" name="groupEngName" type="text" class="text" style="width:98%;" value="<c:out value='${recBizEnterpriseinfo.groupEngName}'/>"/>
				</td>


			</tr>
			<tr>
				<td class="inputLabelTd"><span style="color:red">*</span>集团简称：</td>
				<td class="inputTd">
					<input id="groupSortName" name="groupSortName" type="text" class="text" style="width:98%;" value="<c:out value='${recBizEnterpriseinfo.groupSortName}'/>"/>
				</td>
				<td class="inputLabelTd"><span style="color:red">*</span>统一社会信用代码：</td>
				<td class="inputTd">
					<input id="uscCode" name="uscCode" type="text" class="text" style="width:98%;" value="<c:out value='${recBizEnterpriseinfo.uscCode}'/>"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd"><span style="color:red">*</span>所属行业名称：</td>
				<td class="inputTd">
					<input id="industryName" name="industryName" type="text" class="text" style="width:98%;" value="<c:out value='${recBizEnterpriseinfo.industryName}'/>"/>
				</td>
				<td class="inputLabelTd"><span style="color:red">*</span>行业代码：</td>
				<td class="inputTd">
					<input id="industryCode" name="industryCode" type="text" class="text" style="width:98%;" value="<c:out value='${recBizEnterpriseinfo.industryCode}'/>"/>
				</td>
			</tr>
			<tr>
				<td class="inputLabelTd">备注：</td>
				<td class="inputTd" colspan="3">
					<textarea class="textarea" style="width:100%;height:180px" id="remark" name="remark" ><biz:out value='${recBizEnterpriseinfo.remark}'/></textarea>
				</td>
			</tr>
		</table>

	</div>
	</form>
	<hr class="barTitleHr"></hr>
	<div class="barTitle">
		<div class="content"><a href="javascript:;" onfocus="this.blur();"></a> <span>责任追究领导小组或工作小组 </span></div>
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-margin">
		<div id='showdiv'></div>
        <div class="ui-table ui-widget ui-corner-all">
			<button id="save_duty_button" type="button" onclick="saveDuty('dutyTable_new','dutyTableList_zz,dutyTableList_fzz');">保存</button>
		</div>
		<div id = "dutyTable" class = "CloseBillCon" style="margin: auto;width: 99%">
			<table class="table_list"  id="dutyTable_new" width='100%' align='center' border='1' cellpadding='4' cellspacing='0' bordercolor='#B1B1B1'>
				<thead>
					<tr>
						<th width="200">类别</th>
						<th width="100">姓名</th>
						<th width="220">职务</th>
						<th width="140">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr class="dutyTableList_zz">
						<td>
						<input disabled="disabled" class="dutyTable_new_input" data-name="type" value="组长" data-list="dutyTableList_zz" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="name" data-list="dutyTableList_zz" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="post" data-list="dutyTableList_zz" data-index="0"/>
						</td>
						<td>
							<span class="addleader_new blue" data-list="dutyTableList_zz" data-type="组长">增加</span>
						</td>
					</tr>
					<tr class="dutyTableList_fzz">
						<td>
						<input disabled="disabled" class="dutyTable_new_input" data-name="type" value="副组长" data-list="dutyTableList_fzz" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="name" data-list="dutyTableList_fzz" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="post" data-list="dutyTableList_fzz" data-index="0"/>
						</td>
						<td>
							<span class="addleader_new blue" data-list="dutyTableList_fzz" data-type="副组长">增加</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
   	   <!-- <table id="dutyTable"></table> -->
   		<!-- <div id="dutyPager"></div> -->
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-border org_name">
		<table class="table">
			<tr>
				<td class="inputLabelTd" style="width:15%;font-weight: bold;"><span style="float: left;color: red;margin-left: 133px;">*</span><p  class="key_show cybm_type">成员部门</p></td>
				<td class="inputTd">
					<input id="dutyOrgName" name="dutyOrgName" type="text" class="text cybm" style="width:50%;"/>
				</td>
			</tr>
		</table>
</div>

	<hr class="barTitleHr"></hr>
	<div class="barTitle">
		<div class="content"><a href="javascript:;" onfocus="this.blur();"></a> <span>下设办公室：</span></div>
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-margin">
        <div class="ui-table ui-widget ui-corner-all">
			<button id="save_duty_button1" type="button" onclick="saveDuty('dutyTable_newFzr','dutyTableList_fzr');">保存</button>
		</div>
		<div id = "dutyTableFzrfz" class = "CloseBillCon" style="margin: auto;width: 99%">
			<table class="table_list"  id="dutyTable_newFzr" width='100%' align='center' border='1' cellpadding='4' cellspacing='0' bordercolor='#B1B1B1'>
				<thead>
					<tr>
						<th width="200">类别</th>
						<th width="100">姓名</th>
						<th width="220">职务</th>
						<!-- <th width="140">操作</th> -->
					</tr>
				</thead>
				<tbody>
					<tr class="dutyTableList_fzr">
						<td>
						<input disabled="disabled" class="dutyTable_new_input" data-name="type" value="负责人" data-list="dutyTableList_fzr" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="name" data-list="dutyTableList_fzr" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="post" data-list="dutyTableList_fzr" data-index="0"/>
						</td>
						<!-- <td>
							<span class="addleader_new blue" data-list="dutyTableList_zz" data-type="组长">增加</span>
						</td> -->
					</tr>

				</tbody>
			</table>
		</div>
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-border org_name">
		<table class="table">
			<tr>
				<td class="inputLabelTd" style="width:15%;font-weight: bold;"><span style="float: left;color: red;margin-left: 133px;">*</span><p  class="key_show szbmtype">所在部门</p></td>
				<td class="inputTd">
					<input id="dutyOrgName1" name="dutyOrgName" type="text" class="text szbm" style="width:50%;"/>
				</td>
			</tr>
		</table>
</div>
<hr class="barTitleHr"></hr>
	<div class="barTitle">
		<div class="content"><a href="javascript:;" onfocus="this.blur();"></a> <span>职能部门：</span></div>
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-margin">
        <div class="ui-table ui-widget ui-corner-all">
			<button id="save_duty_button2" type="button" onclick="saveDuty('dutyTable_newZnbm','dutyTableList_znbm,dutyTableList_znbmfg');">保存</button>
		</div>
		<div id = "dutyTableZnbm" class = "CloseBillCon" style="margin: auto;width: 99%">
			<table class="table_list"  id="dutyTable_newZnbm" width='100%' align='center' border='1' cellpadding='4' cellspacing='0' bordercolor='#B1B1B1'>
				<thead>
					<tr>
						<th width="200">类别</th>
						<th width="100">姓名</th>
						<th width="220">职务</th>
						<th width="100">办公室电话</th>
						<th width="100">手机</th>
					</tr>
				</thead>
				<tbody>
					<tr class="dutyTableList_znbm">
						<td>
						<input disabled="disabled" class="dutyTable_new_input" data-name="type" value="部门主要负责人" data-list="dutyTableList_znbm" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="name" data-list="dutyTableList_znbm" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="post" data-list="dutyTableList_znbm" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="tel" data-list="dutyTableList_znbm" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="phone" data-list="dutyTableList_znbm" data-index="0"/>
						</td>
					</tr>
					<tr class="dutyTableList_znbmfg">
						<td>
						<input disabled="disabled" class="dutyTable_new_input" data-name="type" value="分管监督追责工作负责人" data-list="dutyTableList_znbmfg" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="name" data-list="dutyTableList_znbmfg" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="post" data-list="dutyTableList_znbmfg" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="tel" data-list="dutyTableList_znbmfg" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="phone" data-list="dutyTableList_znbmfg" data-index="0"/>
						</td>

					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-border org_name">
		<table class="table">
			<tr>
				<td class="inputLabelTd" style="width:15%;font-weight: bold;"><span style="float: left;color: red;margin-left: 133px;">*</span><p class="key_show znbmtype">职能部门</p></td>
				<td class="inputTd">
					<input id="dutyOrgName2" name="dutyOrgName" type="text" class="text znbm" style="width:50%;"/>
				</td>
			</tr>
		</table>
</div>
<hr class="barTitleHr"></hr>
	<div class="barTitle">
		<div class="content"><a href="javascript:;" onfocus="this.blur();"></a> <span>职能处室 </span></div>
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-margin">
        <div class="ui-table ui-widget ui-corner-all">
			<button id="save_duty_button3" type="button" onclick="saveDuty('dutyTable_newZncscs','dutyTableList_zncscs,dutyTableList_zncsgzry');">保存</button>
		</div>
		<div id = "dutyTableZncscs" class = "CloseBillCon" style="margin: auto;width: 99%">
			<table class="table_list"  id="dutyTable_newZncscs" width='100%' align='center' border='1' cellpadding='4' cellspacing='0' bordercolor='#B1B1B1'>
				<thead>
					<tr>
						<th width="200">类别</th>
						<th width="100">姓名</th>
						<th width="220">职务</th>
						<th width="220">办公室电话</th>
						<th width="220">手机</th>
						<th width="140">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr class="dutyTableList_zncscs">
						<td>
						<input disabled="disabled" class="dutyTable_new_input" data-name="type" value="职能处室负责人" data-list="dutyTableList_zncscs" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="name" data-list="dutyTableList_zncscs" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="post" data-list="dutyTableList_zncscs" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="tel" data-list="dutyTableList_zncscs" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="phone" data-list="dutyTableList_zncscs" data-index="0"/>
						</td>

					</tr>
					<tr class="dutyTableList_zncsgzry">
						<td>
						<input disabled="disabled" class="dutyTable_new_input" data-name="type" value="工作人员" data-list="dutyTableList_zncsgzry" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="name" data-list="dutyTableList_zncsgzry" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="post" data-list="dutyTableList_zncsgzry" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="tel" data-list="dutyTableList_zncsgzry" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="phone" data-list="dutyTableList_zncsgzry" data-index="0"/>
						</td>
						<td>
							<span class="addleader_new blue" data-list="dutyTableList_zncsgzry" data-type="工作人员">增加</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
   	   <!-- <table id="dutyTable"></table> -->
   		<!-- <div id="dutyPager"></div> -->
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-border org_name">
		<table class="table">
			<tr>
				<td class="inputLabelTd" style="width:15%;font-weight: bold;"><span style="float: left;color: red;margin-left: 133px;">*</span><p  class="key_show zncstype">职能处室</p></td>
				<td class="inputTd">
					<input id="dutyOrgName3" name="dutyOrgName" type="text" class="text zncs" style="width:50%;"/>
				</td>
			</tr>
		</table>
</div>
<hr class="barTitleHr"></hr>
	<div class="barTitle">
		<div class="content"><a href="javascript:;" onfocus="this.blur();"></a> <span>联系人 </span></div>
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-margin">
        <div class="ui-table ui-widget ui-corner-all">
			<button id="save_duty_button4" type="button" onclick="saveDuty('dutyTable_newLxr','dutyTableList_lxr');">保存</button>
		</div>
		<div id = "dutyTableLxr" class = "CloseBillCon" style="margin: auto;width: 99%">
			<table class="table_list"  id="dutyTable_newLxr" width='100%' align='center' border='1' cellpadding='4' cellspacing='0' bordercolor='#B1B1B1'>
				<thead>
					<tr>

						<th width="100">姓名</th>
						<th width="220">职务</th>
						<th width="220">电子邮箱</th>
						<th width="220">邮编</th>
						<th width="220">地址</th>
						<th width="140">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr class="dutyTableList_lxr">
						<input style="display: none;" class="dutyTable_new_input" data-name="type" value="联系人" data-list="dutyTableList_lxr" data-index="0"/>
						<!-- <td>
						<input disabled="disabled" class="dutyTable_new_input" data-name="type" value="联系人" data-list="dutyTableList_lxr" data-index="0"/>
						</td> -->
						<td>
							<input class="dutyTable_new_input" data-name="name" data-list="dutyTableList_lxr" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="post" data-list="dutyTableList_lxr" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="email" data-list="dutyTableList_lxr" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="postcode" data-list="dutyTableList_lxr" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="location" data-list="dutyTableList_lxr" data-index="0"/>
						</td>
						<td>
							<span class="addleader_new blue" data-list="dutyTableList_lxr" data-type="联系人">增加</span>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
   	   <!-- <table id="dutyTable"></table> -->
   		<!-- <div id="dutyPager"></div> -->
	</div>
	<hr class="barTitleHr"></hr>
	<div class="barTitle">
		<div class="content"><a href="javascript:;" onfocus="this.blur();"></a> <span>信息系统管理员：</span></div>
	</div>
	<div class="ui-table ui-widget ui-corner-all ui-margin">
        <div class="ui-table ui-widget ui-corner-all">
			<button id="save_duty_button5" type="button" onclick="saveDuty('dutyTable_newXxgly','dutyTableListXxgly');">保存</button>
		</div>
		<div id = "dutyTableXxgly" class = "CloseBillCon" style="margin: auto;width: 99%">
			<table class="table_list"  id="dutyTable_newXxgly" width='100%' align='center' border='1' cellpadding='4' cellspacing='0' bordercolor='#B1B1B1'>
				<thead>
					<tr>
						<th width="100">姓名</th>
						<th width="220">传真</th>
						<th width="200">电子邮箱</th>
					</tr>
				</thead>
				<tbody>
					<tr class="dutyTableListXxgly">
						<input style="display:none;" class="dutyTable_new_input" data-name="type" value="信息系统管理员" data-list="dutyTableListXxgly" data-index="0"/>
						<td>
							<input class="dutyTable_new_input" data-name="name" data-list="dutyTableListXxgly" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="fax" data-list="dutyTableListXxgly" data-index="0"/>
						</td>
						<td>
							<input class="dutyTable_new_input" data-name="email" data-list="dutyTableListXxgly" data-index="0"/>
						</td>

					</tr>

				</tbody>
			</table>
		</div>
	</div>
<%@ include file="/pages/inc/footer.jsp" %>
</body>
</html>
<script type="text/javascript">

	new biz.button({id:"#complete_button",icons:{primary:'ui-icon-disk'}});
	new biz.button({id:"#save_button",icons:{primary:'ui-icon-disk'}});
	new biz.button({id:"#report_button", icons: {primary:'ui-icon-disk'}});
	new biz.button({id:"#save_duty_button",icons:{primary:'ui-icon-disk'}});
	new biz.button({id:"#save_duty_button1",icons:{primary:'ui-icon-disk'}});
	new biz.button({id:"#save_duty_button2",icons:{primary:'ui-icon-disk'}});
	new biz.button({id:"#save_duty_button3",icons:{primary:'ui-icon-disk'}});
	new biz.button({id:"#save_duty_button4",icons:{primary:'ui-icon-disk'}});
	new biz.button({id:"#save_duty_button5",icons:{primary:'ui-icon-disk'}});
	/* new biz.button({id:"#reset_button", icons: {primary:'ui-icon-refresh'}});
	new biz.button({id:"#back_button", icons: {primary:'ui-icon-arrowthick-1-w'}}); */
	//责任追究领导小组或工作小组list
	var dutyTableList_zz=[{type:'组长',name:'',post:'',orgLevel:'1',jgId:''}],
		dutyTableList_fzz=[{type:'副组长',name:'',post:'',orgLevel:'1',jgId:''}],
		dutyTableList_fzr=[{type:'负责人',name:'',post:'',orgLevel:'2',jgId:''}],
		dutyTableList_znbm=[{type:'部门主要负责人',name:'',post:'',orgLevel:'3',tel:'',phone:'',jgId:''}],
		dutyTableList_znbmfg=[{type:'分管监督追责工作负责人',name:'',post:'',orgLevel:'3',tel:'',phone:'',jgId:''}],
		dutyTableList_zncscs=[{type:'职能处室负责人',name:'',post:'',orgLevel:'4',tel:'',phone:'',jgId:''}],
		dutyTableList_zncsgzry=[{type:'工作人员',name:'',post:'',orgLevel:'4',tel:'',phone:'',jgId:''}],
		dutyTableList_lxr=[{type:'联系人',name:'',post:'',orgLevel:'5',email:'',postcode:'',location:'',jgId:''}],
		dutyTableListXxgly=[{type:'信息系统管理员',name:'',orgLevel:'6',fax:'',email:'',jgId:''}];
	//责任追究领导小组或工作小组list
	$(document).ready(function(){

		//新增按钮事件
		$(".table_list").on("click",".addleader_new",function(){
			var that=$(this);
			var type=that.attr("data-type");
			var crData;
			var v={type:type,name:'',post:''};
			var list=that.attr("data-list");
			if(type=="组长"){
				crData=
				'<tr class="'+list+'"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="组长" data-list="dutyTableList_zz" data-index="0"/></td>'+
				'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
				'<td><input  class="dutyTable_new_input"  data-name="post" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
				'<td><span class="addleader_new blue" data-list="'+list+'" data-type="'+type+'">增加</span><span class="delleader_new blue" data-list="'+list+'" data-index="'+eval(list).length+'" data-type="'+type+'">删除</span></td>'
				+'</tr>'
			}else if(type=="副组长"){
				crData=
					'<tr class="'+list+'"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="副组长" data-list="dutyTableList_fzz" data-index="0"/></td>'+
					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
					'<td><input  class="dutyTable_new_input"  data-name="post" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
					'<td><span class="addleader_new blue" data-list="'+list+'" data-type="'+type+'">增加</span><span class="delleader_new blue" data-list="'+list+'" data-index="'+eval(list).length+'" data-type="'+type+'">删除</span></td>'
					+'</tr>'

				}
			else if(type=="工作人员"){
				crData=
					'<tr class="'+list+'"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="工作人员" data-list="dutyTableList_zncsgzry" data-index="0"/></td>'+
					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
					'<td><input  class="dutyTable_new_input"  data-name="post" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
					'<td><input  class="dutyTable_new_input"  data-name="tel" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
					'<td><input  class="dutyTable_new_input"  data-name="phone" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
					'<td><span class="addleader_new blue" data-list="'+list+'" data-type="'+type+'">增加</span><span class="delleader_new blue" data-list="'+list+'" data-index="'+eval(list).length+'" data-type="'+type+'">删除</span></td>'
					+'</tr>'
				}else if(type=="联系人"){
					crData=
						'<tr class="'+list+'"><input style="display: none;" class="dutyTable_new_input" data-name="type" value="联系人" data-list="dutyTableList_lxr" data-index="0"/>'+
						'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
						'<td><input  class="dutyTable_new_input"  data-name="post" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
						'<td><input  class="dutyTable_new_input"  data-name="email" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
						'<td><input  class="dutyTable_new_input"  data-name="postcode" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
						'<td><input  class="dutyTable_new_input"  data-name="location" data-list="'+list+'" data-index="'+eval(list).length+'"/></td>'+
						'<td><span class="addleader_new blue" data-list="'+list+'" data-type="'+type+'">增加</span><span class="delleader_new blue" data-list="'+list+'" data-index="'+eval(list).length+'" data-type="'+type+'">删除</span></td>'
						+'</tr>'
					}
			that.addClass("btn_hide");
			that.parent().parent().after(crData);
			eval(list).push(v);
		});
		//删除按钮点击
		$(".table_list").on("click",".delleader_new",function(){
			debugger;
			var that=$(this);
			var list=that.attr("data-list");
			var index=that.attr("data-index");
			eval(list).splice(index,1);
			that.parent().parent().remove();
			$("."+list+":last").children().children(".addleader_new").removeClass("btn_hide")
		});
		//input输入事件
		$(".table_list").on("blur",".dutyTable_new_input",function(){
			var that=$(this);
			var list=that.attr("data-list");
			var index=that.attr("data-index");
			var show_name=that.attr("data-name");
			eval(list)[index][show_name]=that.val();
		})
		function stringToList(list){
			var newArray=[];
		 	for(var i in list){


				list[i]=list[i].replace(/=/g,":");
				if(list[i]=='"[]"'){
					list[i]=[];
				}else{
					list[i]=JSON.parse(list[i]);
				}

				}
			return list;


			}
		 $.ajax({
		        type:"post",
		        url:"../recBizEnterpriseContacts/listEnterpriseContacts?orgLevel=1",
		        async:false,
		        dataType:"json",
		        success:function(data){
		        	  var htmlstr = '';
			            var datas = stringToList(data);
			            var indcNum = 0;
			            for(var o in datas){
				            if(o=="list11"){
				            	$(".cybm").val(datas[o][0].name);
								$(".cybm_type").html(datas[o][0].type);
					            }else if(o=="list12"){
						            var _array=datas[o],num=_array.length;
					            	if(num>0){
					            		dutyTableList_zz=[];
					            		dutyTableList_fzz=[];
						       		for(var i=0;i<num;i++){
							       		var v=_array[i];
							       		var list='';
							       		if(v.type=="组长"){
							       			list='dutyTableList_zz';
							       			dutyTableList_zz.push(v);
							       			htmlstr= htmlstr+'<tr class="'+list+'"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="组长" data-list="dutyTableList_zz" data-index="0"/></td>'+
						 					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+i+'"  value="'+v.name+'"/></td>'+
											'<td><input  class="dutyTable_new_input"  data-name="post" value="'+v.post+'"/></td>'+
											'<td><span class="addleader_new blue" data-list="'+list+'" data-type="'+v.type+'">增加</span></td>'
											+'</tr>';
							       		}else{
							       			list='dutyTableList_fzz';
							       			dutyTableList_fzz.push(v);
							       			//hasFzz=true;
							       			htmlstr=htmlstr+'<tr class="dutyTableList_fzz"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="副组长" data-list="dutyTableList_fzz" data-index="0"/></td>'+
						 					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+i+'"  value="'+v.name+'"/></td>'+
											'<td><input  class="dutyTable_new_input"  data-name="post" value="'+v.post+'"/></td>'+
											'<td><span class="addleader_new blue" data-list="'+list+'" data-type="'+v.type+'">增加</span></td>'
											+'</tr>';
								       	}

							       	}

						       		$("#dutyTable_new tbody").html(htmlstr);
						          }}else if(o=="list21"){
						        	  $(".szbm").val(datas[o][0].name);
									  $(".szbmtype").html(datas[o][0].type);
							       }else if(o=="list22"){
							    	   var _array=datas[o],num=_array.length;
						            	if(num>0){
						            		dutyTableList_fzr=[];
							       		for(var i=0;i<num;i++){
								       		var v=_array[i];
								       		var list='';
								       		if(v.type=="负责人"){
								       			list='dutyTableList_fzr';
								       			dutyTableList_fzr.push(v);
								       			htmlstr= htmlstr+'<tr class="'+list+'"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="负责人" data-list="dutyTableList_fzr" data-index="0"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+i+'"  value="'+v.name+'"/></td>'+
												'<td><input  class="dutyTable_new_input"  data-name="post" value="'+v.post+'"/></td>'
												+'</tr>';
								       		}
								       	}
							       		$("#dutyTable_new tbody").html(htmlstr);
								   }
			            		}else if(o=="list31"){
						        	  $(".znbm").val(datas[o][0].name);
									  $(".znbmtype").html(datas[o][0].type);
							       }else if(o=="list32"){
							    	   var _array=datas[o],num=_array.length;
						            	if(num>0){
						            		dutyTableList_znbm=[];
						            		dutyTableList_znbmfg=[];
							       		for(var i=0;i<num;i++){
								       		var v=_array[i];
								       		var list='';
								       		if(v.type=="部门主要负责人"){
								       			list='dutyTableList_znbm';
								       			dutyTableList_znbm.push(v);
								       			htmlstr= htmlstr+'<tr class="'+list+'"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="部门主要负责人" data-list="dutyTableList_znbm" data-index="0"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+i+'"  value="'+v.name+'"/></td>'+
												'<td><input  class="dutyTable_new_input"  data-name="post" data-list="'+list+'" data-index="'+i+'" value="'+v.post+'"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="tel" data-list="'+list+'" data-index="'+i+'"  value="'+v.tel+'"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="phone" data-list="'+list+'" data-index="'+i+'"  value="'+v.phone+'"/></td>'
												+'</tr>';
								       		}else{
								       			list='dutyTableList_znbmfg';
								       			dutyTableList_znbmfg.push(v);
								       			htmlstr= htmlstr+'<tr class="'+list+'"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="分管监督追责工作负责人" data-list="dutyTableList_znbmfg" data-index="0"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+i+'"  value="'+v.name+'"/></td>'+
												'<td><input  class="dutyTable_new_input"  data-name="post" data-list="'+list+'" data-index="'+i+'"  value="'+v.post+'"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="tel" data-list="'+list+'" data-index="'+i+'"  value="'+v.tel+'"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="phone" data-list="'+list+'" data-index="'+i+'"  value="'+v.phone+'"/></td>'+
							 					'<td><span class="addleader_new blue" data-list="'+list+'" data-type="'+v.type+'">增加</span></td>'
												+'</tr>';

									       		}
								       	}
							       		$("#dutyTable_new tbody").html(htmlstr);
								   }
			            		}else if(o=="list41"){
						        	  $(".zncs").val(datas[o][0].name);
									  $(".zncstype").html(datas[o][0].type);
							       }else if(o=="list4"){
							    	   var _array=datas[o],num=_array.length;
						            	if(num>0){
						            		dutyTableList_zncscs=[];
						            		dutyTableList_zncsgzry=[];
							       		for(var i=0;i<num;i++){
								       		var v=_array[i];
								       		var list='';
								       		if(v.type=="职能处室负责人"){
								       			list='dutyTableList_zncscs';
								       			dutyTableList_zncscs.push(v);
								       			htmlstr= htmlstr+'<tr class="'+list+'"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="职能处室负责人" data-list="dutyTableList_zncscs" data-index="0"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+i+'"  value="'+v.name+'"/></td>'+
												'<td><input  class="dutyTable_new_input"  data-name="post" data-list="'+list+'" data-index="'+i+'" value="'+v.post+'"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="tel" data-list="'+list+'" data-index="'+i+'"  value="'+v.tel+'"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="phone" data-list="'+list+'" data-index="'+i+'"  value="'+v.phone+'"/></td>'
												+'</tr>';
								       		}else{
								       			list='dutyTableList_zncsgzry';
								       			dutyTableList_zncsgzry.push(v);
								       			htmlstr= htmlstr+'<tr class="'+list+'"><td><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="工作人员" data-list="dutyTableList_zncsgzry" data-index="0"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+i+'"  value="'+v.name+'"/></td>'+
												'<td><input  class="dutyTable_new_input"  data-name="post" data-list="'+list+'" data-index="'+i+'" value="'+v.post+'"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="tel" data-list="'+list+'" data-index="'+i+'"  value="'+v.tel+'"/></td>'+
							 					'<td><input  class="dutyTable_new_input"  data-name="phone" data-list="'+list+'" data-index="'+i+'"  value="'+v.phone+'"/></td>'
												+'</tr>';

									       		}
								       	}
							       		$("#dutyTable_new tbody").html(htmlstr);
								   }
			            		}else if(o=="list41"){
						        	  $(".zncs").val(datas[o][0].name);
									  $(".zncstype").html(datas[o][0].type);
							       }else if(o=="list5"){
							    	   var _array=datas[o],num=_array.length;
						            	if(num>0){
						            		dutyTableList_lxr=[];
							       		for(var i=0;i<num;i++){
								       		var v=_array[i];
								       		var list='dutyTableList_lxr';
								       		dutyTableList_lxr.push(v);
							       			htmlstr= htmlstr+'<tr class="'+list+'"><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="联系人" data-list="dutyTableList_lxr" data-index="0"/>'+
						 					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+i+'"  value="'+v.name+'"/></td>'+
											'<td><input  class="dutyTable_new_input"  data-name="post" data-list="'+list+'" data-index="'+i+'" value="'+v.post+'"/></td>'+
						 					'<td><input  class="dutyTable_new_input"  data-name="tel" data-list="'+list+'" data-index="'+i+'"  value="'+v.email+'"/></td>'+
						 					'<td><input  class="dutyTable_new_input"  data-name="postcode" data-list="'+list+'" data-index="'+i+'"  value="'+v.postcode+'"/></td>'+
						 					'<td><input  class="dutyTable_new_input"  data-name="location" data-list="'+list+'" data-index="'+i+'"  value="'+v.location+'"/></td>'
											+'</tr>';

								       	}
							       		$("#dutyTable_new tbody").html(htmlstr);
								   }
			            		}else if(o=="list6"){
							    	   var _array=datas[o],num=_array.length;
						            	if(num>0){
						            		dutyTableListXxgly=[];
							       		for(var i=0;i<num;i++){
								       		var v=_array[i];
								       		var list='dutyTableListXxgly';
								       		dutyTableListXxgly.push(v);
							       			htmlstr= htmlstr+'<tr class="'+list+'"><input disabled="disabled" class="dutyTable_new_input" data-name="type" value="信息系统管理员" data-list="dutyTableListXxgly" data-index="0"/>'+
						 					'<td><input  class="dutyTable_new_input"  data-name="name" data-list="'+list+'" data-index="'+i+'"  value="'+v.name+'"/></td>'+
											'<td><input  class="dutyTable_new_input"  data-name="fax" data-list="'+list+'" data-index="'+i+'" value="'+v.fax+'"/></td>'
											+'</tr>';

								       	}
							       		$("#dutyTable_new tbody").html(htmlstr);
								   }
			            		}
		                }
                }
		    });

	});
	function save(button){
		var form =$("#recBizEnterpriseinfoForm");
	 	if(!biz.validate("valid",form)){
	        showWarn("请填写必填项内容！",3000);
	        return;
	    }
		var enterpriseinfoId =$("#enterpriseinfoId").val();
		var dataUrl="";
		if(enterpriseinfoId!=""&&enterpriseinfoId!=null){
			dataUrl="/AuditPlatForm/recBizEnterpriseinfo/update";
		}else{
			dataUrl="/AuditPlatForm/recBizEnterpriseinfo/save";
		}
   	   	new biz.ajaxsubmit({
			id:form,
			method:"POST",
			dataType:"json",
			url: dataUrl,
			success: function(data, textStatus, jqXHR){
				showInfo("保存成功！",3000);
				biz.utils.val("enterpriseinfoId",data["enterpriseinfoId"]);
				biz.utils.val("bizEnterpriseinfoId",data["bizEnterpriseinfoId"]);
				biz.utils.val("groupName",data["groupName"]);
				biz.utils.val("groupEngName",data["groupEngName"]);
				biz.utils.val("groupSortName",data["groupSortName"]);
				biz.utils.val("uscCode",data["uscCode"]);
				biz.utils.val("industryName",data["industryName"]);
				biz.utils.val("industryCode",data["industryCode"]);
				biz.utils.val("remark",data["remark"]);
				biz.utils.val("wfstatus",data["wfstatus"]);
				biz.utils.val("wfstatusname",data["wfstatusname"]);

			},
			error:biz.utils.loadError
		});

	}
	//点击完成按钮
	function complete(){
		var form =$("#recBizEnterpriseinfoForm");
		var enterpriseinfoId =$("#enterpriseinfoId").val();
		var dataUrl="/AuditPlatForm/recBizEnterpriseinfo/update";
		var wfstatus=$("#wfstatus").val("20");
		var wfstatusname=$("#wfstatusname").val("已完成");
   	   	new biz.ajaxsubmit({
			id:form,
			method:"POST",
			dataType:"json",
			url: dataUrl,
			success: function(data, textStatus, jqXHR){
				showInfo("已完成！",3000);
				biz.utils.val("enterpriseinfoId",data["enterpriseinfoId"]);
				biz.utils.val("bizEnterpriseinfoId",data["bizEnterpriseinfoId"]);
				biz.utils.val("groupName",data["groupName"]);
				biz.utils.val("groupEngName",data["groupEngName"]);
				biz.utils.val("groupSortName",data["groupSortName"]);
				biz.utils.val("uscCode",data["uscCode"]);
				biz.utils.val("industryName",data["industryName"]);
				biz.utils.val("industryCode",data["industryCode"]);
				biz.utils.val("remark",data["remark"]);
				biz.utils.val("wfstatus",data["wfstatus"]);
				biz.utils.val("wfstatusname",data["wfstatusname"]);

			},
			error:biz.utils.loadError
		});
	}
	function checkVal(parent){
		var cango=true;
		var list=$("#"+parent).children("tbody").children("tr").children("td").children("input"),len=list.length;i=0;
		for(;i<len;i++){
			var v=list[i];
			if(v.value==''){
				alert("请完善信息！");
				cango=false;
				return false;
			}
		}
		if($("#"+parent).parent().parent().next(".org_name").children().children().children().children().children("input").val()==''){
			alert("请完善信息！");
			cango=false;
			return false;
		}
		return cango;
	}
	//保存企业联系人信息
		function saveDuty(_class,args){
			var cango=checkVal(_class);
			if(cango){
				debugger;
				var org_name_value=$("#"+_class).parent().parent().next(".org_name").children().children().children().children().children("input").val();
				var org_name_type=$("#"+_class).parent().parent().next(".org_name").children().children().children().children().children(".key_show").html();
				var org_name_level='';
				var org_jgId='';
				var EachList=args.split(","),len=EachList.length,i=0;
				var dataList=[];
				var as='0';
				for(;i<len;i++){
					var v=eval(EachList[i]);
					for(var aa in v){
						var s=v[aa];
						s.jgId=$("#bizEnterpriseinfoId").val();
						org_jgId=$("#bizEnterpriseinfoId").val();
						if(s.type=='组长'||s.type=='副组长'){
							s.orgLevel='1';
							org_name_level='1';
							as='1';
						}else if(s.type=='负责人'){
							s.orgLevel='2';
							org_name_level='2';
							as='1';
						}else if(s.type=='部门主要负责人'||s.type=='分管监督追责工作负责人'){
							s.orgLevel='3';
							org_name_level='3';
							as='1';
						}else if(s.type=='职能处室负责人'||s.type=='工作人员'){
							s.orgLevel='4';
							org_name_level='4';
							as='1';
						}else if(s.type=='联系人'){
							s.orgLevel='5';
							org_name_level='5';
						}else if(s.type=='信息系统管理员'){
							s.orgLevel='6';
							org_name_level='6';
						}
					}
					dataList=dataList.concat(v);
				}
				if(as=='1'){
				dataList.push({type:org_name_type,name:org_name_value,orgLevel:org_name_level,jgId:org_jgId});
				}
				var ss=JSON.stringify(dataList);
				 $.ajax({
				        type:"post",
				        url:"../recBizEnterpriseContacts/saveAll?orgLevel='"+ss+"'",
				        async:false,
				        dataType:"json",
				        success:function(data){

					     }

			        })
			}

		}
	//点击上报按钮
	function reportUp(){
		debugger;
		var wfstatus=$("#wfstatus").val();
		var enterpriseinfoId=$("#enterpriseinfoId").val();
		if(wfstatus!="20"){
			showWarn("只有已完成状态的记录才能进行上报!",3000);
			return;
		}
		new biz.alert({type:"confirm",message:"确认上报吗？",
			title:I18N.promp,callback:function(result){
	    		if (!result) {
	    			return;
	    		}
	    		$.ajax({
		    	    type:"post",
					url: contextPath+"/recBizEnterpriseinfo/report?id="+enterpriseinfoId+"",
		    	    data:"",
		    	    async:false,
		    	    dataType:"json",
		    	    success:function(data){
		    	    	showWarn("上报成功!",3000);
		        	}
		    	});
			}
		});

	}
</script>