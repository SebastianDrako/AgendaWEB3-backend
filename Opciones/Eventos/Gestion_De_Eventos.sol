// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "../Gestion_De_Permisos.sol";
import "./Tipos_de_eventos/Gestion_tipos_evento.sol";

contract gestion_de_eventos is permisos , tipos_evento {


// Estrucutura del evento

    struct evento {
        string nombre;
        string dsecripcion;
        uint fecha_de_inicio;
        uint fehcha_de_fin;
        address quien_agenda;
        address[] asisitentes;
        uint[] hash_tipo_evento;
    }




}