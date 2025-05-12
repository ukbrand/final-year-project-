<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>

<!-- Include SweetAlert2 from CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
}
</style>
</head>
<body>

<script type="text/javascript">
Swal.fire({
	  title: "Good job!",
	  text: "<%= request.getAttribute("uk") %>",  
	  icon: "success"
	}).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "index.jsp"; 
        }
    });
</script>

</body>
</html>
