<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>

<!DOCTYPE html>




<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mustikauudised</title>
    <meta charset="UTF-8">

    <!-- Bootstrap -->
    <link type="text/css" href="bsstyle/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="stylesheets/StyleSheet5.css" rel="stylesheet">
    <link type="text/css" href="bsstyle/bootstrap-theme.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  
  
	







<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/bsproov3.jsp">Mustikauudised</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          
			<li><a href="#">Logi sisse</a></li>
            
            <li><a href="#registreeri">Registreeri</a></li>
            <li><a href="#kontakt">Kontakteeru</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Teemad/Otsi <b class="caret"></b></a>			 
              <ul class="dropdown-menu">
   			 	<li><a href="#t1">Teema 1</a></li>
            	<li><a href="#t2">Teema 2</a></li>
            	<li><a href="#t3">Teema 3</a></li>
            	<li><a href="#t6">Koerad</a></li>
    			<li class="divider"></li>
    			<li>
            	  <form class="navbar-form navbar-left" role="search">
       				<div class="form-group">
         			 <input type="text" class="form-control" placeholder="Otsi">
        			</div>
        			<button type="submit" class="btn btn-default">OTSI</button>
     		 	  </form>
     		    </li>
     		   </ul>
     		</li>
          </ul>
          </div>
      </div>
    </div>
	<div class="row">
    
	   <div class="col-md-6 col-lg-4" >
		<div class="thumbnail">
			<a href="/bsuudis.jsp?id=6">
		      <img src="http://www.bauhof.ee/media/wysiwyg/Uudised/mustika_avamine/Bauhof_Mustika_v_livaade_28.11.2013.jpg" alt="Proov">
		      </a>
		      <div class="caption">
		      <a href="/bsuudis.jsp?id=6">
		        <h3>Proov</h3>
		        </a>
		        <p><a href="#" class="btn btn-primary" role="button">Lisa lemmikutesse</a> 
		      </div>
		    </div>
        </div><!-- /.col-sm-4 -->
	
	   <div class="col-md-6 col-lg-4" >
		<div class="thumbnail">
			<a href="/bsuudis.jsp?id=4">
		      <img src="http://www.greenfoot.org/photo_attachments/0000/9088/DOGE.png?1387078982" alt="Doge">
		      </a>
		      <div class="caption">
		      <a href="/bsuudis.jsp?id=4">
		        <h3>Doge</h3>
		        </a>
		        <p><a href="#" class="btn btn-primary" role="button">Lisa lemmikutesse</a> 
		      </div>
		    </div>
        </div><!-- /.col-sm-4 -->
	
	   <div class="col-md-6 col-lg-4" >
		<div class="thumbnail">
			<a href="/bsuudis.jsp?id=3">
		      <img src="http://xdgum.com/files/21/20130823180953_ee.png" alt="MUSTIKAS">
		      </a>
		      <div class="caption">
		      <a href="/bsuudis.jsp?id=3">
		        <h3>MUSTIKAS</h3>
		        </a>
		        <p><a href="#" class="btn btn-primary" role="button">Lisa lemmikutesse</a> 
		      </div>
		    </div>
        </div><!-- /.col-sm-4 -->
	
	   <div class="col-md-6 col-lg-4" >
		<div class="thumbnail">
			<a href="/bsuudis.jsp?id=2">
		      <img src="http://www.bauhof.ee/media/wysiwyg/Uudised/mustika_avamine/Bauhof_Mustika_v_livaade_28.11.2013.jpg" alt="BAUHOF AVAS KAUPLUSE MUSTIKA KESKUSES">
		      </a>
		      <div class="caption">
		      <a href="/bsuudis.jsp?id=2">
		        <h3>BAUHOF AVAS KAUPLUSE MUSTIKA KESKUSES</h3>
		        </a>
		        <p><a href="#" class="btn btn-primary" role="button">Lisa lemmikutesse</a> 
		      </div>
		    </div>
        </div><!-- /.col-sm-4 -->
	
	   <div class="col-md-6 col-lg-4" >
		<div class="thumbnail">
			<a href="/bsuudis.jsp?id=1">
		      <img src="http://www.bioneer.ee/static/files/018/t2_marmelaadikommid.jpg" alt="KOMMID">
		      </a>
		      <div class="caption">
		      <a href="/bsuudis.jsp?id=1">
		        <h3>KOMMID</h3>
		        </a>
		        <p><a href="#" class="btn btn-primary" role="button">Lisa lemmikutesse</a> 
		      </div>
		    </div>
        </div><!-- /.col-sm-4 -->
	
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>