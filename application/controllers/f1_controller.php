<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class f1_controller extends CI_Controller {
	public function __construct(){
		parent:: __construct();
		$this->load->model('f1_model');
	}

	public function index(){
		$data = array(
			'title' => 'ejemplo basico f1',
			'fruta' => $this->f1_model->mostrar_fruta(),
			'color' => $this->f1_model->mostrar_fruta()
		);
		$this->load->view('template/header',$data);
		$this->load->view('f1_view');
		$this->load->view('template/footer');
	}
	public function eliminar($id){
		$this->f1_model->delete_fruta($id);
		redirect('/f1_controller/index','refresh');
	}
	public function ingresar(){
		$datos = array(
			'fruta'   => $_POST['fruta'],
			'color'   => $_POST['color'],
			'sabor'   => $_POST['sabor'],
			'cantidad'=> $_POST['cantidad']
		);
		$this->f1_model->insert_fruta($datos);
		redirect('f1_controller/index','refresh');
	}
}