<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>

<!-- Include SweetAlert2 from CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Include Lottie for animated error graphics -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lottie-web/5.9.6/lottie.min.js"></script>

<style>
body {
  font-family: "Open Sans", sans-serif;
  text-align: center;
  background-color: #f8d7da;
  padding: 50px;
}

#error-container {
  width: 200px;
  margin: 0 auto;
}
</style>
</head>
<body>

<!-- Animated Error Icon -->
<div id="error-container"></div>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    let message = "<%= request.getAttribute("uk") != null ? request.getAttribute("uk") : "An unexpected error occurred!" %>";
    
    // Load Lottie animation for error
    let animation = lottie.loadAnimation({
        container: document.getElementById("error-container"),
        renderer: "svg",
        loop: true,
        autoplay: true,
        path: "https://assets4.lottiefiles.com/packages/lf20_qp1spzqv.json" // Error animation
    });

    Swal.fire({
        title: "Oops! Something went wrong ❌",
        text: message.replace(/"/g, '\\"'),  // Escape double quotes
        icon: "error",
        confirmButtonText: "Go Back",
        background: "#f8d7da",
        confirmButtonColor: "#d33"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "index.html"; 
        }
    });
});
</script>

</body>
</html>
