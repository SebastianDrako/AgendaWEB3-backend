// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Operaciones basicas como buscar en listas
import "./Opciones/Basical_operations.sol";

// Gestion de permisos
import "./Opciones/Gestion_De_Permisos.sol";

// Gestion de eventos
import "./Opciones/Gestion_De_Eventos.sol";



contract agenda is basic_logic , permisos , gestion_de_eventos{

// Configuracion de la primera ejecucion
constructor (){

// COnfiguracion inicial

//Hace que la persona que ejecute el contrato sea el admin por defecto
usuarios[msg.sender] = roles(mod) ;
//Pone la instacia en modo publico - cualquiera puede agendar
publico = true;

}
}
