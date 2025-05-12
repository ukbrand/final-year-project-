<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>this is the new web</title>
  <link rel="stylesheet" href="index.css">
</head>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
* {
  box-sizing: border-box;
}

img {
  object-fit: cover;
  width: 100%;
}

.mt {
  height: auto;
  width: 30%;
  text-align: center;
  display: inline-block;
  margin-left: 30px;
  border-radius: 20px;
  margin-top: 30px;
  box-shadow: 1px 9px 9px -2px;
}

.mt img {
  height: 250px;
  border-radius: 20px 20px 0 0;
}

.mt button {
  border: none;
  padding: 10px;
  background: gold;
  color: black;
  font-weight: 700;
  box-shadow: 2px 2px 5px -1px skyblue;
}

.mt p {
  font-weight: 300;
}

ol {
  list-style-type: none;
  margin-left: 420px;
}

li {
  display: inline-block;
  margin-left: 30px;
  font-weight: 800;
  font-size: 20px;
  cursor: pointer;
  font-family: Arial, sans-serif;
}

li:hover {
  color: green;
}

.side {
  height: 700px;
  width: 100%;
  animation-name: uk;
  animation-direction: alternate-reverse;
  animation-duration: 10s;
  animation-iteration-count: infinite;
}

@keyframes uk {
  0% { background-image: url('1.jpg'); background-size: cover; }
  15% { background-image: url('2.jpg'); background-size: cover; }
  25% { background-image: url('3.jpg'); background-size: cover; }
  35% { background-image: url('4.jpg'); background-size: cover; }
  45% { background-image: url('5.jpg'); background-size: cover; }
  55% { background-image: url('6.jpg'); background-size: cover; }
  65% { background-image: url('7.jpg'); background-size: cover; }
  75% { background-image: url('8.jpg'); background-size: cover; }
  85% { background-image: url('9.jpg'); background-size: cover; }
  95% { background-image: url('10.jpg'); background-size: cover; }
  100% { background-image: url('11.jpg'); background-size: cover; }
}

a {
  text-decoration: none;
  color: black;
}

a:hover {
  color: whitesmoke;
}

.srt {
  background: black;
  color: white;
  padding: 6px;
  font-weight: 700;
  box-shadow: 0px 0px 5px 3px green;
}

.input {
  position: relative;
  right: 130px;
  padding: 5px 60px 5px 10px;
  outline: none;
  border: none;
  box-shadow: 8px 2px 19px -4px skyblue;
}

.footer {
  height: 380px;
  width: 100%;
  border: 2px solid black;
  background: black;
  margin-top: 20px;
}

.F_BOX {
  color: white;
  position: relative;
  top: 30px;
  left: 50px;
}

.soc {
  margin-left: 450px;
}

.soc img {
  height: 56px;
  width: 7%;
  background-color: white;
  margin-left: 30px;
}

.f_divB {
  display: inline-block;
  height: 200px;
  width: 15%;
  font-size: 20px;
  color: white;
}

.s {
  margin-left: 60px;
}

.sub {
  position: relative;
  bottom: 23px;
  left: 120px;
  border: none;
  background: black;
  color: white;
  font-weight: 700;
}

.skd {
  display: inline;
  margin-left: 120px;
}

.logo {
  height: 70px;
  width: 10%;
  position: relative;
  top: 75px;
  left: 40px;
}

    .chart-container {
            width: 80%;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

.logo2 {
  height: 20px;
  width: 2%;
  position: absolute;
  top: 102px;
  left: 530px;
}

.big {
  margin-left: 410px;
  color: white;
  position: relative;
  top: 30px;
}

.Body {
  width: 100%;
  margin-top: 30px;
}

.box1 {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: center;
}

.b1 {
  flex: 1;
  min-width: 250px;
  max-width: 300px;
  margin-bottom: 20px;
  text-align: center;
  box-shadow: 1px 9px 9px -2px;
}

.b1 img {
  height: 200px;
  object-fit: cover;
  border-radius: 10px;
}

.b1 h1 {
  font-size: 20px;
}

/* General body styling */
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background-color: #f8f8f8;
}

/* Navigation Bar Container */
nav {
  background-color: #333; /* Dark background */
  padding: 10px 20px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Centering the nav content */
.nav-container {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

/* Logo Styling */
.logo2 {
  height: 40px; /* Adjust logo size */
  width: auto;
  margin-right: 20px;
}

/* Navigation Links Container */
.nav-links {
  list-style-type: none;
  display: flex;
  gap: 20px;
  margin: 0;
}

/* Navigation Links Styling */
.nav-links li {
  display: inline;
}

.nav-links li a {
  text-decoration: none;
  color: white;
  font-size: 18px;
  font-weight: 500;
  transition: color 0.3s ease;
}

/* Hover Effect for Links */
.nav-links li a:hover {
  color: #f1c40f; /* Gold color on hover */
}

/* For Mobile: Stack the items vertically */
@media screen and (max-width: 768px) {
  .nav-container {
    flex-direction: column;
    align-items: flex-start;
  }

  .nav-links {
    flex-direction: column;
    align-items: flex-start;
    gap: 10px;
  }
}


    .operations-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      padding: 50px 20px;
      gap: 30px;
    }

    .operation-card {
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      border: 2px solid #00fff7;
      box-shadow: 0 0 15px #00fff7;
      width: 300px;
      height: 260px;
      border-radius: 15px;
      padding: 20px;
      transition: transform 0.3s, box-shadow 0.3s;
      cursor: pointer;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .operation-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 0 25px #00fff7, 0 0 30px #00fff7;
    }

    .operation-card h2 {
      margin-top: 0;
      color: #00fff7;
      font-size: 22px;
    }


    .operation-card p {
      font-size: 15px;
      color: #cfcfcf;
    }

    .op-btn {
      margin-top: 10px;
      padding: 10px;
      background: linear-gradient(45deg, #00fff7, #00bcd4);
      border: none;
      border-radius: 8px;
      color: #000;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.5s, box-shadow 0.4s;
      box-shadow: 0 0 10px #00fff7, 0 0 20px #00bcd4;
      animation: pulse 1.8s infinite ease-in-out;
    }

    .op-btn:hover {
      background: linear-gradient(45deg, #00ff99, #00d4ff);
      box-shadow: 0 0 20px #00ff99, 0 0 25px #00d4ff;
    }

    @keyframes pulse {
      0% {
        box-shadow: 0 0 8px #00fff7;
      }
      50% {
        box-shadow: 0 0 15px #00fff7, 0 0 25px #00bcd4;
      }
      100% {
        box-shadow: 0 0 8px #00fff7;
      }
    }

    @media screen and (max-width: 768px) {
      .operation-card {
        width: 100%;
      }
    }



</style>

<body>

<header>
   
  <nav>
  <div class="nav-container">
     
    <ul class="nav-links">
      <li><a href="#">Home</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Cold Storage Solutions</a></li>
      <li><a href="#">Products</a></li>
      <li><a href="#">Pricing</a></li>
      <li><a href="#">Blog</a></li>
      <li><a href="#">Support</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </div>
</nav>

  <div class="side"></div>
</header>






<%
    String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
    int[] temps = {3, 5, 6, 4, 2, 7, 6};

    StringBuilder daysJson = new StringBuilder();
    for (int i = 0; i < days.length; i++) {
        daysJson.append("\"").append(days[i]).append("\"");
        if (i < days.length - 1) daysJson.append(",");
    }

    StringBuilder tempsJson = new StringBuilder();
    for (int i = 0; i < temps.length; i++) {
        tempsJson.append(temps[i]);
        if (i < temps.length - 1) tempsJson.append(",");
    }
%>

<h2 style="text-align:center;">Cold Storage Temperature Chart</h2>

<div class="chart-container">
    <canvas id="temperatureChart" width="800" height="400"></canvas>
</div>









<!-- Intro Cards -->
<div class="mt">
  <img src="3.jpg" alt="Cold Storage Facility" />
  <h1>Benefits of Cold Storage</h1>
  <p>Cold storage facilities help preserve perishable goods, reduce food waste, and maintain product quality throughout the supply chain.</p>
  <button>Read More</button>
</div>

<div class="mt">
  <img src="4.jpg" alt="Storage Units" />
  <h1>Choosing the Right Unit</h1>
  <p>We guide you in selecting the right cold storage unit size and configuration for your business needs—whether for food, pharma, or logistics.</p>
  <button>Read More</button>
</div>

<div class="mt">
  <img src="1.jpg" alt="Refrigeration" />
  <h1>Why Temperature Monitoring</h1>
  <p>Consistent temperature control is critical in preserving quality, preventing spoilage, and complying with health regulations.</p>
  <button>Read More</button>
</div>


<!-- cold storage opration -->



  <h1 style="text-align:center; padding-top:30px;">Cold Storage Operations</h1>

  <div class="operations-container">
    <div class="operation-card">
      <h2>Insert Inventory</h2>
      <p>Enter new stock with temperature, expiry, and quantity details.</p>
      <button class="op-btn"><a href="insert_inventory.jsp">Insert</a></button>
    </div>
    <div class="operation-card">
      <h2>Update Conditions</h2>
      <p>Adjust temperature, humidity, and alert settings in real time.</p>
      <button class="op-btn"><a href="SearchItem.jsp">Update</a></button>
    </div>
    <div class="operation-card">
      <h2>Track Inventory</h2>
      <p>Monitor product location, shelf life, and live storage data.</p>
      <button class="op-btn"><a href="TrackInventory.jsp">Track</a></button>
    </div>
    <div class="operation-card">
      <h2>Dispatch Items</h2>
      <p>Remove or transfer items, and generate shipping records.</p>
      <button class="op-btn"><a href="dispatchInventoryForm.jsp">Dispatch</a></button>
    </div>
    <div class="operation-card">
      <h2>Generate Reports</h2>
      <p>Create usage, temperature logs, and compliance documents.</p>
      <button class="op-btn"><a href="report.jsp">Generate</a></button>
    </div>
    <div class="operation-card">
      <h2>User Management</h2>
      <p>Control access with admin, technician, and view-only roles.</p>
      <button class="op-btn">Manage</button>
    </div>
  </div>








<!-- Cold Storage Project Section -->
<div class="Body">
  <h1 style="text-align: center;">Cold Storage Project Showcase</h1>

  <div class="box1">
    <div class="b1">
      <img src="6.jpg" alt="Cold Storage Facility">
      <h1>Cold Storage Facility</h1>
      <p>A modern facility equipped with advanced refrigeration and backup systems for uninterrupted storage.</p>
    </div>
    <div class="b1">
      <img src="7.jpg" alt="Warehouse Logistics">
      <h1>Warehouse Logistics</h1>
      <p>Our logistics-integrated storage ensures streamlined transport and distribution for perishables.</p>
    </div>
    <div class="b1">
      <img src="8.jpg" alt="Walk-in Freezers">
      <h1>Walk-in Freezers</h1>
      <p>Highly insulated freezers for long-term storage of meat, dairy, and pharmaceutical products.</p>
    </div>
    <div class="b1">
      <img src="9.jpg" alt="Blast Chillers">
      <h1>Blast Chillers</h1>
      <p>Rapid cooling technology that helps preserve the freshness of seafood, produce, and cooked meals.</p>
    </div>
  </div>

  <div class="box1">
    <div class="b1">
      <img src="10.jpg" alt="Monitoring Systems">
      <h1>Monitoring Systems</h1>
      <p>Real-time temperature and humidity monitoring ensures quality and compliance.</p>
    </div>
    <div class="b1">
      <img src="11.jpg" alt="Industrial Cold Rooms">
      <h1>Industrial Cold Rooms</h1>
      <p>Large-capacity rooms for high-volume storage in food processing and distribution centers.</p>
    </div>
    <div class="b1">
      <img src="1.jpg" alt="Insulated Doors">
      <h1>Insulated Doors</h1>
      <p>Heavy-duty doors reduce energy loss while maintaining internal temperature control.</p>
    </div>
    <div class="b1">
      <img src="2.jpg" alt="Custom Solutions">
      <h1>Custom Solutions</h1>
      <p>Tailored cold storage design to fit unique client needs across industries.</p>
    </div>
  </div>
</div>


















<!-- Footer -->
<footer>
  <div class="footer">
    <div class="F_BOX f_divB">
      <h3>Cold Storage Solutions</h3>
      <small>Advanced, efficient cold storage systems tailored for your business success.</small>
    </div>
    <div class="skd">
      <div class="f_divB s">
        <h3>Company</h3>
        <small>About Us</small><br>
        <small>Contact</small><br>
        <small>Support</small><br>
        <small>Careers</small><br>
      </div>
      <div class="f_divB s">
        <h3>Services</h3>
        <small>Cold Rooms</small><br>
        <small>Design & Build</small><br>
        <small>Maintenance</small><br>
        <small>Consulting</small><br>
      </div>
      <div class="f_divB s">
        <h3>Newsletter</h3>
        <small>Subscribe for cold storage updates</small><br>
        <input type="text" placeholder="Enter your email"><br>
        <input type="submit" value="SEND" class="sub">
      </div>
    </div>
    <div class="soc">
      <img src="3.jpg">
      <img src="4.jpg">
      <img src="5.jpg">
    </div>
    <big class="big">© 2025 Cold Storage Co. All rights reserved.</big>
  </div>
</footer>






<script>
    window.onload = function () {
        const days = [<%= daysJson.toString() %>];
        const temps = [<%= tempsJson.toString() %>];

        const ctx = document.getElementById('temperatureChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: days,
                datasets: [{
                    label: 'Temperature (°C)',
                    data: temps,
                    fill: true,
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.5)',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: false,
                        title: {
                            display: true,
                            text: 'Temperature (°C)'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Day of Week'
                        }
                    }
                }
            }
        });
    };
  

</script>

</body>
</html>
