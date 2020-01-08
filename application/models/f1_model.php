<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class f1_model extends CI_Model {
	public function mostrar_fruta(){
		$this->db->select('f.id_fruta,f.nombre_fruta,c.nombre_color,s.nombre_sabor,f.cantidad');
		$this->db->from('fruta f');
		$this->db->join('color c','c.id_color = f.id_color');
		$this->db->join('sabor s','s.id_sabor = f.id_sabor');
		$dia = $this->db->get();
		return $dia->result();
	}
	public function delete_fruta($id){
		$this->db->where('id_fruta',$id);
		return $this->db->delete('fruta');

	}
	public function mostrar_color(){
		$dia = $this->db->get('color');
		return $dia->result();
	}
	public function mostrar_sabor(){
		$dia = $this->db->get('sabor');
		return $dia->result();
	}
	public function insert_fruta($datos){
		$this->db->set('nombre_fruta',$datos['fruta']);
		$this->db->set('id_color',$datos['color']);
		$this->db->set('id_sabor',$datos['sabor']);
		$this->db->set('cantidad',$datos['cantidad']);
		$this->db->insert('fruta');

	}
}