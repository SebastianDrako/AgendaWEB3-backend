// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "../Gestion_De_Permisos.sol";
import "./Tipos_de_eventos/Gestion_tipos_evento.sol";

contract gestion_de_eventos is permisos , tipos_evento {

//Donde se almacenan los eventos

mapping (uint => evento[]) eventosPorFecha;
mapping (uint => recrodatorio[]) recrodatoriosPorFecha;



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

// Evento que dura 24 horas y marca recordatortios
    struct recrodatorio {
        string nombre;
        string dsecripcion;
        uint fecha;
        address quien_agenda;
        bool publico;
        uint[] hash_tipo_evento;
    }

// Formas de evniar eventos una vez ejecutados los comandos
    enum indexEvent { evento , confirmacion }

    event newEvent(

        indexEvent indexed eventype,
        uint indexed eventNameHash,
        evento eventInfo

    );

    event eventStatus (

        indexEvent indexed eventype,
        uint indexed eventNameHash,
        evento eventInfo

    );



 function create_event () internal {



 }

    function getTimeStampAndNameHash (string memory nombre) internal view returns(uint){
        uint data = block.timestamp + uint(keccak256(abi.encodePacked(nombre)));
        return uint(keccak256(abi.encodePacked(data)));
    }

}