<?php

class AdminDAO
{
    private $id;
    private $nombre;
    private $apellido;
    private $correo;
    private $clave;

    public function __construct($id = 0, $nombre = "", $apellido = "", $clave = "")
    {
        $this->id = $id;
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->clave = $clave;
    }


    public function autenticar()
{
    return "SELECT idAdmin 
        FROM Admin 
        WHERE nombre = '" . $this->nombre . "' AND clave = '" . $this->clave . "'";
}


    public function consultar()
    {
        return "SELECT idAdmin, nombre, apellido FROM Admin;";
    }
}
