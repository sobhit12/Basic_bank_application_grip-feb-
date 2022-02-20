<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="jquery/jquery3.5.js"></script>
        <style>
        
    
      @media screen and (min-width: 600px){
.col-lg-4 {
  background-color: white;
  margin-top:50px;
 
}
.card-btn-div{
	display:flex;
	justify-content:center;
	bottom:0px;
	position:relative;

	
}
       
.home-btn{
	


width:300px;
cursor:pointer;

}

 .bottom-home{
   display:flex;
   flex-direction: row;
   flex: auto;
   margin:0px 88px;
}
.card-body{
overflow:hidden;
font-style:italic;
font-weight:bold;

}
 
        </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <link href="./css/style.css" rel="stylesheet">
<title>HOME</title>
</head>
<body>
<div  class="outercontainer">
       <jsp:include page="navbar.jsp"></jsp:include>
        <!-- //image slider: -->
        <div id="carouselExampleIndicators" class=" carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100" src="img/img-6.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Welcome to the spark Foundation Bank</h1>
                    <p>...</p>
                  </div>
            </div>
              <div class="carousel-item">
                <img class="d-block w-100" src="img/img-8.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Welcome to the spark Foundation Bank</h1>
                    <p>...</p>
                  </div>
            </div>
              <div class="carousel-item">
                <img  class="d-block w-100 " src="img/img-12.jpeg" alt="Third slide">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Transfer Money is Made Easy.</h1>
                    <p>...</p>
                  </div>
            </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <div class="  bottom-home">
              <div class="row">
                  <div class="col-lg-4">
                    <div class="card" style="width: 100%; ">
                        <img class="card-img-top"  src="img/customer3.jpg" alt="Card image cap">
                        <div class="card-body card1 " style="background-color:silver; font-size:21px;">
                          <h3 style="text-align:center; color:red;" >*OUR CUSTOMERS*</h3>
                          <p class="card-text">In banking,customer service is an important means to ensure that customer are satisfied with the services offered.Banks have dedicated customer service teams that provide assistance to customers who reach out to them.</p>
                            <div  class="card-btn-div" style="margin-top:42px;">
                          <a class="btn btn-danger   btn-lg home-btn" role="button"  href="customer.jsp">VIEW</a>
                        </div>
                        </div>
                       
                      </div>
                  </div>
                  
                  <div class="col-lg-4">
                  
                    <div class="card" style="width: 100%;">
                        <img class="card-img-top"  src="img/make_transaction2.jpg" alt="Card image cap">
                           <div class="card-body " style=" overflow:hidden;height:100%; font-size:21px; ">
                          <h3 style="text-align:center; color:red;">*MAKE TRANSACTION*</h3>
                          
                          <p class="card-text">Send or receive money without any Spark's Bank's fund transfer channels.We make transferring funds from  your FNB account very simple and convenient.In fact,there are various options that we provide for transferring your funds online.</p>
                              <div class="card-btn-div">                        
                         <a class= "btn btn-danger   btn-lg home-btn" role="button" href="make_transaction.jsp" >TRANSFER</a>
                       </div> 
                           
                        </div>
                          
                      </div>
                  </div>

                 

                  <div class="col-lg-4">
                    <div class="card" >
                        <img class="card-img-top"    src="img/transaction_history.png" alt="Card image cap">
                        <div class="card-body" style="background-color:pink; font-size:21px;">
                          <H3 style="text-align:center;color:red;">*TRANSACTION HISTORY*</H3>
                          <p class="card-text">A transaction history is a record of every transaction within a certain period of time.You can get a transaction history from your online banking or by requesting one from bank's local branch ,we record all transactions history</p>
                           <div class="card-btn-div">
                          <a class="btn btn-danger btn-lg home-btn"  href="transaction_history.jsp">CHECK</a>
                        </div>
                        </div>
                      </div>
                  </div>

              </div>
                
          </div>
          </div>
         
           <jsp:include page="footer1.jsp"></jsp:include>
          
  
           
</body>
</html>