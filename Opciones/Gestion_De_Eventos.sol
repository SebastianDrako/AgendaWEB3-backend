// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


import "./Gestion_Del_tiempo.sol";
import "./Gestion_De_Permisos.sol";
import "./Eventos/Tipos_de_eventos/Gestion_tipos_evento.sol";


contract gestion_de_eventos is permisos , tipos_evento  , GesTime {

//Donde se almacenan los eventos

// Apunta un mes acumulado a un Hash
mapping (uint => uint[]) indexEventos;
mapping (uint => uint[]) indexRecordatorios;


// Apunta un hash al struct del evento o recordatorio
mapping (uint => evento) eventos;
mapping (uint => evento) recordatorios;

// Apunta una direccion de un asistente al contrato de se agenda
mapping (address => address) contratoDeAsistente;

// Estrucutura del evento

    struct evento {
        string nombre;
        string descripcion;
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

    event eventStatus (


    );



 function create_event (string memory nombre , string memory descripcion, uint fecha_de_inicio, uint fehcha_de_fin, address quien_agenda) public {

    address[] memory asisitentes;
    uint[] memory hash_tipo_evento;

    uint[6] memory fecha = getGregoriano(fecha_de_inicio);
    uint mes = fecha[3] ;
    uint year = fecha[5] ;

    uint mesAcum = getMesGregAcum(mes , year);
    uint hash = getTimeAndNameHash ( nombre , fecha_de_inicio);

    indexEventos[mesAcum].push(hash) ;

    eventos[hash] = evento( nombre ,  descripcion ,  fecha_de_inicio ,  fehcha_de_fin ,  quien_agenda , asisitentes , hash_tipo_evento) ;

 }


function return_event_by_month (uint month) public view returns( uint[] memory) {return indexEventos[month] ;}

function return_event_data (uint hash) public view 
returns( string memory nombre,
        string memory descripcion,
        uint fecha_de_inicio,
        uint fehcha_de_fin,
        address quien_agenda,
        address[] memory asisitentes,
        uint[] memory hash_tipo_evento ) 
        
        {

            evento memory data = eventos[hash];

            return (data.nombre , data.descripcion , data.fecha_de_inicio , data.fehcha_de_fin , data.quien_agenda , data.asisitentes , data.hash_tipo_evento);

        }


    function getMesGregAcum (uint mes , uint year) public pure returns(uint) { return (mes + (year - 1970) * 12) ;}


    function getTimeAndNameHash (string memory nombre, uint seg_inicio ) internal pure returns(uint){

        uint data1 = uint(keccak256(abi.encodePacked(seg_inicio)));

        uint data2 = uint(keccak256(abi.encodePacked(nombre)));

        uint mixedData = uint(keccak256(abi.encodePacked( data1 + data2 )));

        return mixedData;
    }

}