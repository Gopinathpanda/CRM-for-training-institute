<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>CRM Student</title>
<%@include  file="../common/files.jsp" %>
<script>
    $(document).ready(function(){
        Display();
       DisplayEmail();
        DisplayCourses();
         DisplayMode();
         $("#adddetails").click(function(){
            ClearDataDetails();
        $("#myModaldetails").modal("show");
            GetMaxDetails();
           });
            $("#btnsubmitdetails").click(function(){
                  addDetails();
                  ClearDataDetails();
                  $("#myModaldetails").modal("hide");
                  Display();
                  });   
              });
               function GetMaxDetails()
                {
                $.get("/CRM_Student/getdetailsid",function(data){
                 $("#rdid").val(data);
                });                   
                }
                 function DisplayEmail(){
                $.ajax({
                url:'/CRM_Student/displayprofile',
                method:'get',
                contentType:'application/json',
                success:function(data){
                $("#ddemail").empty();
               $("#ddemail").append("<option  selected disabled>Select Email</option>");
                $.each(data,function(i,d){
               $("#ddemail").append("<option  value="+d.registration_id+">"+d.email+"</option>");
                });
                }
                });
                }    
                 function DisplayCourses(){
                $.ajax({
                url:'/CRM_Student/displayprogram',
                method:'get',
                contentType:'application/json',
                success:function(data){
                $("#ddcourse").empty();
                 $("#ddcourse").append("<option  selected disabled>Select Course</option>");
$.each(data,function(i,d){
    $("#ddcourse").append("<option  value="+d.program_id+">"+d.course_name+"</option>");
});
    }
    });
     }
     function DisplayMode(){
                $.ajax({
                url:'/CRM_Student/displayfeemode',
                method:'get',
                contentType:'application/json',
                success:function(data){
                $("#ddmode").empty();
                 $("#ddmode").append("<option  selected disabled>Select Mode</option>");
$.each(data,function(i,d){
    $("#ddmode").append("<option  value="+d.fee_mode_id+">"+d.mode_name+"</option>");
});
    }
    });
     }
            function Display(){
                
    $.ajax({
        url:'/CRM_Student/displayregdetails',
        method:'get',
        contentType:'application/json',
        success:function(data){
        $("#tbldata").empty();
        $.each(data,function(i,d){
    $("#tbldata").append("<tr><td>"+d.registration_details_id+"</td><td>"+d.email+"</td><td>"+d.course_name+"</td><td>"+d.mode_name+"</td><td>"+d.status+"</td><td>");
});
    }
    });
     }
     function addDetails(){
                var rdid=$("#rdid").val();
                var rid=$("#ddemail").val();
                var pid=$("#ddcourse").val();
                var mode=$("#ddmode").val();
                var status=$("#status").val();
                var data={"registration_details_id":rdid,"registration_id":rid,"program_id":pid,"fee_mode_id":mode,"status":status};
                   $.ajax({
                    url:'/CRM_Student/adddetails',
                    method:'post',
                    data:JSON.stringify(data),
                    contentType:'application/json',
                    success:function(d){
                     alert("success");
                    
                    }
                });
            }
             function ClearDataDetails()
       {
           $("#rdid").val("");
           $("#ddemail").val("");
           $("#ddcourse").val("");
           $("#ddmode").val("");
           $("#status").val("");
        }
    

</script>
</head> 
<body class="cbp-spmenu-push">
   <%@include file="../common/headersandMenu.jsp" %>
<div id="page-wrapper">
 <div class="container">
         <a id="adddetails" role="button" class="btn btn-large btn-primary" data-toggle="modal">Add Registration Details</a>
         <div class="row">
           <div id="myModaldetails" class="modal fade">
               <div class="modal-dialog">
                <div class="modal-content">
                   <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                   <h3 class="title1"><center>Registration Details-Form</center></h3>
                   </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-6"><small><label class="text-primary">Registration Details ID:</label></small></div>
                                <div class="col-md-6"><small><label class="text-primary">Student Email:</label></small></div>
                                <div class="col-md-6 img-rounded"><input type="text" class="form-control" id="rdid" placeholder="REGISTRATION DETAILS ID"></div>
                                <div class="col-md-6 img-rounded"> 
                                    <select type="text" id="ddemail" class="form-control">
                                        <option selected="selected" disabled="disabled">Select Email</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-4" ><small><label class="text-primary"> Course Name:</label></small></div>
                                <div class="col-md-4"><small><label class="text-primary">  Payment Mode Name:</label></small></div>
                                <div class="col-md-4"><small><label class="text-primary"> Status:</label></small></div>
                                <div class=" col-md-4 img-rounded"> 
                                    <select type="text" id="ddcourse" class="form-control">
                                       <option selected="selected" disabled="disabled">Select Course Name</option>
                                    </select>
                                </div>
                                <div class=" col-md-4 img-rounded"> 
                                    <select type="text" id="ddmode" class="form-control">
                                        <option selected="selected" disabled="disabled">Select Mode</option>
                                    </select>
                              </div>
                            <div class="col-md-4 img-rounded"> <input type="text" class="form-control" id="status" placeholder="STATUS"></div>
                            </div>    
                        </form>
                    </div>
                <div class="modal-footer">
                <button type="button" id="btnsubmitdetails" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span>Submit</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
                </div>
                </div>
           </div>
        </div>
     </div> 
 </div>
        <div class="col-md-12">
        <div class="container-fluid">
            <div style="overflow-y: scroll;overflow-x:scroll;height: 470px">
                <table class="table table-bordered table-striped table-hover table-responsive table-condensed">
                    <thead style="background:blue;color:white">
                       <tr>
                          <th class="text-center">Registration Details ID</th>
                          <th class="text-center">Student Email</th>
                          <th class="text-center">Course Name</th>
                          <th class="text-center">Payment Mode</th>
                          <th class="text-center">Status</th>                       
                       </tr>
                   </thead>
                   <tbody id="tbldata" class="text-center text-capitalize text-primary">
                   </tbody>
                </table>
            
            </div>
      </div>
        </div>
    </div>
        <%@include file="../common/footer.jsp" %>

</body>
</html>