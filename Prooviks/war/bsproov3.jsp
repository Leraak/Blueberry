<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Proov3</title>

    <!-- Bootstrap -->
    <link href="bsstyle/bootstrap.min.css" rel="stylesheet">
    <link href="stylesheets/StyleSheet5.css" rel="stylesheet">
    <link href="bsstyle/bootstrap-theme.min.css" rel="stylesheet">

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
          <a class="navbar-brand" href="#">Mustikauudised</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#logi">Logi sisse</a></li>
            <li><a href="#registreeri">Registreeri</a></li>
            <li><a href="#kontakt">Kontakteeru</a></li>
          </ul>
          <div class="col-md-12">
          <ul class="nav navbar-nav navbar-left">
            <li><a href="#t1">Teema 1</a></li>
            <li><a href="#t2">Teema 2</a></li>
            <li><a href="#t3">Koerad</a></li>
            <li><a href="#o">
            	<form>
            		<input type="text">
            		<button type="button">OTSI</button>
            	</form></a></li>
          </ul>
          </div>
        </div><!--/.navbar-collapse -->
      </div>
    </div>
    <div class="col-md-6">
          <div class="list-group">
            <a href="#" class="list-group-item">
              <h4 class="list-group-item-heading">Kommid</h4>
              <div class="thumbnail">
		      <img src="http://f3.pmo.ee/f/2014/03/12/2889646t151hc3c1.jpg" alt="...">
		      </div>
              <p class="list-group-item-text">Kommid ruulivad</p>
            </a>
            <a href="#" class="list-group-item">
              <h4 class="list-group-item-heading">Uudis 2</h4>
              <p class="list-group-item-text">blabla</p>
            </a>
            <a href="#" class="list-group-item">
              <h4 class="list-group-item-heading">Uudis 3</h4>
              <p class="list-group-item-text">bööö</p>
            </a>
          </div>
        </div><!-- /.col-sm-4 -->
        <div class="col-md-6">
          <div class="list-group">
            <a href="#" class="list-group-item">
              <h4 class="list-group-item-heading">Kommid</h4>
              <div class="thumbnail">
		      <img src="http://f3.pmo.ee/f/2014/03/12/2889646t151hc3c1.jpg" alt="...">
		      </div>
              <p class="list-group-item-text">Kommid ruulivad</p>
            </a>
            <a href="#" class="list-group-item">
              <h4 class="list-group-item-heading">Uudis 2</h4>
              <p class="list-group-item-text">blabla</p>
            </a>
            <a href="#" class="list-group-item">
              <h4 class="list-group-item-heading">Uudis 3</h4>
              <p class="list-group-item-text">bööö</p>
            </a>
          </div>
        </div><!-- /.col-sm-4 -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>