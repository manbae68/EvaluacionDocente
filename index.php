<!DOCTYPE html>
<html>
<head>
	<title>Login de usuario</title>
	<link rel="stylesheet" type="text/css" href="librerias/bootstrap/css/bootstrap.css">
	<script src="librerias/jquery-3.2.1.min.js"></script>
	<script src="js/funciones.js"></script>
</head>
<body style="background-color: gray">
	<br><br><br>
	<div class="container">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel panel-heading">Evaluación de Tutores</div>
					<div class="panel panel-body">
						<p>
							<img src="img/logo.png" >
						</p>
						<form id="frmLogin">
							<label>Usuario</label>
							<input type="text" class="form-control input-sm" name="usuario" id="usuario">
							<label>Password</label>
							<input type="password" name="cpassword" id="cpassword" class="form-control input-sm">
							<p></p>
							<span class="btn btn-primary btn-sm" id="entrarSistema">Entrar</span>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
	$(document).ready(function(){
		$('#entrarSistema').click(function(){

		 vacios=validarFormVacio('frmLogin');

		 	if(vacios > 0){
		 		alert("Debe llenar todos los campos!!");
		 		return false;
		 	}

		datos=$('#frmLogin').serialize();
		$.ajax({
			type:"POST",
			data:datos,
			url:"procesos/reglogin/login.php",
			success:function(r){	
alert(r);			
				if(r==1){
					window.location="vistas/inicio.php";
				}else{
					if (r==2)
						alert("Verifique Usuario y Contraseña");
					else
						alert("No tiene rol asignado.");

				}
			}
		});
	});
	});
</script>