<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="stylesheets/StyleSheet.css"/>
        <style>
        </style>
        <script src="http://ajax.microsoft.com/ajax/jQuery/jquery-2.0.0.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        </script>
        <title>BEST NEWS EU</title>
    </head>
    <body>
    
		<jsp:include page="/header.jsp"></jsp:include>
		
        <div id="sisukord" class="disain">
            <h2>TEEMAD</h2>
            <div id="valikud">
                <form>
                    <input type="checkbox">Üks<br>
                    <input type="checkbox">Kaks<br>
                    <input type="checkbox">Kolm
                </form>
            </div>
            <div id="otsing">
            	<h2>Otsing</h2>
            </div>
        </div>

        <div id="uudised" class="disain">
        	<ul>
        		<li>Esimene</li>
        		<li>Teine</li>
        		<li>Kolmas</li>
        	</ul>
        </div>

        <div id="widgets" class="disain">
            <h2>Kell vms</h2>
            <h2>Lemmikud</h2>
            <h2>Tellimine</h2>
            <h2>Kalender</h2>
        </div>
    </body>
</html>