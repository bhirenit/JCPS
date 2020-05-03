<%@page import="modal.JcPartDao"%>
<%@page import="modal.JcPart"%>
<%@page import="modal.VehiclePartDetails"%>
<%@page import="modal.VehiclePartDetailsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.VehicleServiceDetails"%>
<%@page import="modal.VehicleServiceDetailsDao"%>
<%@page import="modal.JcServiceDao"%>
<%@page import="modal.JcService"%>
<%@page import="java.sql.*"%>

<%
	if (request.getParameter("reload_flag") != null) {
		int jobcardNumber = Integer.parseInt(request.getParameter("jobcardNumber"));
		if (request.getParameter("reload_flag").equals("0")) {
			int id = Integer.parseInt(request.getParameter("part_id"));
			boolean isAlready = JcPartDao.checkAlready(jobcardNumber, id);
			if (isAlready) {
				JcPartDao.increaseQuantity(jobcardNumber, id);
			} else {
				VehiclePartDetails vpd1 = VehiclePartDetailsDao.getPartsById(id);
				  int price =Integer.parseInt(request.getParameter("part_price"));
				boolean partRepairFlag = request.getParameter("part_repair_flag").equals("0")?false:true;//conditional op. for converting string to boolean based on 0 and 1
				VehiclePartDetails vpd = VehiclePartDetailsDao.getPartsById(id);
				JcPart jp = new JcPart();
				jp.setPartId(id);
				jp.setPartName(vpd.getPartName());
				jp.setPartPrice(price);
				jp.setPartStatus("pending");
				jp.setPartRepairFlag(partRepairFlag);
				jp.setJobcardNumber(jobcardNumber);
				int status = JcPartDao.save(jp);
				JcPartDao.increaseQuantity(jobcardNumber, id);
			}
		}
		List<JcPart> list = JcPartDao.getByNumber(jobcardNumber, "pending");
		Iterator<JcPart> itr = list.iterator();
%>
<script>
	function removePart(partid, jobcardNumber) {
		$.ajax({
			type : "POST",
			url : "cart/partremove.jsp",
			data : {
				part_id : partid,
				jobcardNumber : jobcardNumber,
				remove_flag : 0
			},
			cache : false,
			success : function(response) {
				$("#addedParts").html(response);
			}
		});
	}
	function removeAll(partid, jobcardNumber) {
		$.ajax({
			type : "POST",
			url : "cart/partremove.jsp",
			data : {
				part_id : partid,
				jobcardNumber : jobcardNumber,
				remove_flag : 1
			},
			cache : false,
			success : function(response) {
				$("#addedParts").html(response);
			}
		});
	}
	function increase(partid, jobcardNumber) {
		$.ajax({
			type : "POST",
			url : "cart/partadd.jsp",
			data : {
				part_id : partid,
				jobcardNumber : jobcardNumber,
				reload_flag : 0
			},
			cache : false,
			success : function(response) {
				$("#addedParts").html(response);
			}
		});
	}
</script>
<table class="table table-responsive z-depth-3">

	<tr>
		<th>Part Name</th>
		<th>Part Price</th>
		<th>Quantity</th>
		<th>Remove</th>
	</tr>
	<%
		while (itr.hasNext()) {
				JcPart jcp = itr.next();
	%>

	<tr>
		<td><%=jcp.getPartName()%></td>
		<td><%=jcp.getPartPrice()%></td>
		<td><a href="javascript:void(0)"
			onclick=" removePart('<%=jcp.getPartId()%>','<%=jobcardNumber%>')">-</a> <%=jcp.getPartQuantity()%>
			<a href="javascript:void(0)"
			onclick="increase('<%=jcp.getPartId()%>','<%=jobcardNumber%>')">+</a></td>
		<td><a href="javascript:void(0)"
			onclick=" removeAll('<%=jcp.getPartId()%>','<%=jobcardNumber%>')">Remove</a></td>
	</tr>
	<%
		}
	%>
</table>
<%
	}
%>

