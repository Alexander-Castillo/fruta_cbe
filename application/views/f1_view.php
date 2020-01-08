<body>
	<div class="container">
		<br>
		<h1 class="bg-dark text-white text-center text-algerian">
			REGISTRO DE FRUTAS EN ALMACEN
		</h1>
		<br>
		<!-- Button trigger modal -->
		<button  type="button" class="btn btn-outline-primary btn" data-toggle="modal" data-target="#nuevo">
			Nuevo registro
		</button>
		<br>
		<br>
		<table class="table table-hover table-striped table-bordered table-sm">
			<thead class="thead-dark text-center">
				<tr>
					<th>N°</th>
					<th>Nombre de la fruta</th>
					<th>Color de la fruta</th>
					<th>Sabor de la fruta</th>
					<th>Cantidad</th>
					<th>eliminar</th>
					<th>editar</th>
				</tr>
			</thead>
			<tbody class="text-center">
				<?php 
				$n = 1;
				foreach ($fruta as $f): ?>
					<tr>
						<td><?php echo $n; $n++; ?></td>
						<td><?php echo $f->nombre_fruta ?></td>
						<td><?php echo $f->nombre_color ?></td>
						<td><?php echo $f->nombre_sabor ?></td>
						<td><?php echo $f->cantidad ?></td>
						<td>
							<!-- Button trigger modal -->
							<button  type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#eliminar">
								Eliminar
							</button>
						</td>
						<td></td>
					</tr>					
				
			</tbody>
		</table>
	</div>
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="eliminar">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Alerta /_!_\</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						Realmente desea eliminar este registro?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">No</button>
						<a href="<?php echo base_url('f1_controller/eliminar/').$f->id_fruta ?>" class="btn btn-outline-primary">Si</a>
						<?php endforeach ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<!-- Modal -->
		<div class="modal fade" id="nuevo">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">NUEVO REGISTRO</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="<?php echo base_url('f1_controller/ingresar') ?>" method="POST">
							<div class="row">
								<div class="col">Ingrese el nombre de la fruta:</div>
								<div class="col">
									<input type="text" name="fruta" id="fruta" class="form-control">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">Seleccione el color de la fruta:</div>
								<div class="col">
									<select name="color" id="color" class="form-control">
										<option value="">
											Seleccione una opcion
										</option>
										
									</select>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">Seleccione el sabor de la fruta:</div>
								<div class="col">
									<select name="sabor" id="sabor" class="form-control">
										<option value="">
											Seleccione una opcion
										</option>
									</select>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">Ingrese la cantidad de fruta:</div>
								<div class="col">
									<input type="text" name="cantidad" id="cantidad" class="form-control" onkeypress="if(isNaN(String.fromCharCode(event.keyCode))) return false" minlength="4" maxlength="4">
								</div>
							</div>
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-outline-primary">Guardar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>