<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/include/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>Report System - New Report</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/new-user.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

    <!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
            <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
            <a class="brand" href="#"><img src="img/logo.png" /></a>

            <ul class="nav pull-right">                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle hidden-phone" data-toggle="dropdown">
                        Your account
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"> userName：${userName }</a></li>
                         
                        
                     </ul> 
                </li>
                <li class="settings hidden-phone">
                    <a href="#" role="button">
                        <i class="icon-cog"></i>
                    </a>
                </li>
                <li class="settings hidden-phone">
                    <a href="#" role="button">
                        <i class="icon-share-alt"></i>
                    </a>
                </li>
            </ul>            
        </div>
    </div>
    <!-- end navbar -->

    <!-- sidebar -->
    <div id="sidebar-nav">
        <ul id="dashboard-menu">
            <li>                
                <a href="${ctx }/reportRequest.do">
                    <i class="icon-home"></i>
                    <span>Home</span>
                </a>
            </li>            
            <li class="active">
                <div class="pointer">
                    <div class="arrow"></div>
                    <div class="arrow_border"></div>
                </div>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-group"></i>
                    <span>Reports</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="active submenu">
                    <li><a href="${ctx }/reportRequest.do" class="active">Report list</a></li>
                    <li><a href="${ctx }/parameter.do?method=turnToAddPage">New report</a></li>
                </ul>
            </li>
            
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-share-alt"></i>
                    <span>Extras</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="${ctx }/parameter.do">Sign in</a></li>
                    <li><a href="#">Sign up</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- end sidebar -->

	<%! 
  		Date now=new Date();
   		String form1=String.format("%tF",now);
   		String form2=String.format("%tT", now); 
   	%>

	<!-- main container -->
    <div class="content">
        
        <!-- settings changer -->
        <div class="skins-nav">
            <a href="#" class="skin first_nav selected">
                <span class="icon"></span><span class="text">Default</span>
            </a>
            <a href="#" class="skin second_nav" data-file="css/skins/dark.css">
                <span class="icon"></span><span class="text">Dark skin</span>
            </a>
        </div>
        
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header">
                    <h3>Create a new report</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form class="new_user_form inline-input" id="inputForm"  action="${ctx}/reportRequest.do?method=add" method="post">
                            
                            <div class="span12 field-box">
                                    <label>MaterialAddress:</label>
                                    <a href="${ctx}/parameter.do?method=upPage">Upload</a>
                                </div>
                            	<div class="span12 field-box">
                                    <label>UploadTime:</label>
                                    <input class="span9" name="materialUptime" type="text" value="<%=form1 %>" />
                                </div>
                                <div class="span12 field-box">
                                    <label>MyName:</label>
                                    <input class="span9" name="reMan"  type="text" value="${userName}" />
                                </div>
                                <div class="span12 field-box">
                                    <label>Time:</label>
                                    <input class="span9" name="reTime"  type="text" value="<%=form2 %>" />
                                </div>
                                <div class="span12 field-box">
                                    <label>Title:</label>
                                    <input class="span9" name="reTitle"  type="text"  />
                                </div>
                                <div class="span12 field-box">
                                    <label>Type:</label>
                                    <div class="ui-select span5">
                                        <select name="reType">
                                            <option selected value="1" >论文</option>
                                            <option value="2" > 新技术 </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="span12 field-box">
                                    <label>Materials:</label>
                                    <input class="span9" name="relatedMaterials"  type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>PublishedYear:</label>
                                    <input class="span9"  name="paYear" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>Author:</label>
                                    <input class="span9" name="paAuther" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>Origin:</label>
                                    <input class="span9" name="paOrigin" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>Reference:</label>
                                    <input class="span9" name="neReference" type="text" />
                                </div>
                                <div class="span12 field-box">
                                    <label>MaterialName:</label>
                                    <input class="span9" name="materialName" readonly="readonly" type="text" value="${fileName}"/>
                                </div>
                                
                                
                                
                                <div class="span12 field-box textarea">
                                    <label>Abstract:</label>
                                    <textarea class="span9" name="reAbstract"></textarea>
                                    <span class="charactersleft">90 characters remaining. Field limited to 100 characters</span>
                                </div>
                                <div class="span11 field-box actions">
                                    <input type="submit" class="btn-glow primary" value="Create report" />
                                    <span>OR</span>
                                    <input type="reset" value="Cancel" class="reset" />
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- side right column -->
                    <div class="span3 form-sidebar pull-right">
                        <div class="btn-group toggle-inputs hidden-tablet">
                            <button class="glow left active" data-input="inline">INLINE INPUTS</button>
                            <button class="glow right" data-input="normal">NORMAL INPUTS</button>
                        </div>
                        <div class="alert alert-info hidden-tablet">
                            <i class="icon-lightbulb pull-left"></i>
                            Click above to see difference between inline and normal inputs on a form
                        </div>                        
                        <h6>Sidebar text for instructions</h6>
                        <p>Choose one of the following file types:</p>
                        <ul>
                            <li><a href="#">Upload a vCard file</a></li>
                            <li><a href="#">Import from a CSV file</a></li>
                            <li><a href="#">Import from an Excel file</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end main container -->


	<!-- scripts -->
    <script src="script/js/jquery-latest.js"></script>
    <script src="script/js/bootstrap.min.js"></script>
    <script src="script/js/theme.js"></script>

    <script type="text/javascript">
        $(function () {

            // toggle form between inline and normal inputs
            var $buttons = $(".toggle-inputs button");
            var $form = $("form.new_user_form");

            $buttons.click(function () {
                var mode = $(this).data("input");
                $buttons.removeClass("active");
                $(this).addClass("active");

                if (mode === "inline") {
                    $form.addClass("inline-input");
                } else {
                    $form.removeClass("inline-input");
                }
            });
        });
    </script>

</body>
</html>