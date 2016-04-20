<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/include/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>Report System - Report list</title>
    
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
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/user-list.css" type="text/css" media="screen" />

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
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                    <h3>Reports</h3>
                    <div class="span10 pull-right">
                        <input type="text" class="span5 search" placeholder="Type a report's name..." />
                        
                        <!-- custom popup filter -->
                        <!-- styles are located in css/elements.css -->
                        <!-- script that enables this dropdown is located in js/theme.js -->
                        <div class="ui-dropdown">
                            <div class="head" data-toggle="tooltip" title="Click me!">
                                Filter reports
                                <i class="arrow-down"></i>
                            </div>  
                            <div class="dialog">
                                <div class="pointer">
                                    <div class="arrow"></div>
                                    <div class="arrow_border"></div>
                                </div>
                                <div class="body">
                                    <p class="title">
                                        Show reports where:
                                    </p>
                                    <div class="form">
                                        <select>
                                            <option >Name</option>
                                            <option >Email</option>
                                            <option >Number of orders</option>
                                            <option >Signed up</option>
                                            <option >Last seen</option>
                                        </select>
                                        <select>
                                            <option >is equal to</option>
                                            <option >is not equal to</option>
                                            <option >is greater than</option>
                                            <option >starts with</option>
                                            <option >contains</option>
                                        </select>
                                        <input type="text" />
                                        <a class="btn-flat small">Add filter</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a href="${ctx }/parameter.do?method=turnToAddPage" class="btn-flat success pull-right">
                            <span>&#43;</span>
                            NEW REPORT
                        </a>
                    </div>
                </div>

                <!-- Users table -->
                <div class="row-fluid table">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="span4 sortable">
                                    Title
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>Abstract
                                </th>
                                <th class="span2 sortable">
                                    <span class="line"></span>Name
                                </th>
                                <th class="span2 sortable">
                                    <span class="line"></span>Time
                                </th>
                                <th class="span2 sortable">
                                    <span class="line"></span>Type
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>Reference
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>Status
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        	
                        	<c:forEach items="${list}" var="report">
                        	<!-- row -->
							<tr class="first">
								<td><c:out value="${report.reTitle}"/></td>
								<td><c:out value="${report.reAbstract}"/></td>
								<td><c:out value="${report.reMan}"/></td>
								<td><c:out value="${report.reTime}"/></td>
								<td>
									<c:choose>
										<c:when test="${report.reType == '1'}">论文</c:when>
										<c:when test="${report.reType == '2'}">新技术</c:when>
									</c:choose>
								</td>
								<td><c:out value="${report.relatedMaterials}"/></td>
								<td >
                                        <a href="${ctx}/reportRequest.do?method=download&reId=${report.reId}">Download</a>
                                        <span class="line">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                            <a href="${ctx}/reportRequest.do?method=lookDetail&reId=${report.reId}" >Delete</a>
                                        
<!-- 									<a href="${ctx}/reportRequest.do?method=lookDetail&reId=${report.reId}" >删除</a> -->
								</td>
							</tr>
							<!-- row -->
							</c:forEach>
                       
                        </tbody>
                    </table>
                </div>
                <!--  
                <div class="pagination pull-right">
                    <ul>
                        <li><a href="#">&#8249;</a></li>
                        <li><a class="active" href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&#8250;</a></li>
                    </ul>
                </div>
                -->
                <!-- end reports table -->
            </div>
        </div>
    </div>
    <!-- end main container -->


	<!-- scripts -->
    <script src="script/js/jquery-latest.js"></script>
    <script src="script/js/bootstrap.min.js"></script>
    <script src="script/js/theme.js"></script>

</body>
</html>