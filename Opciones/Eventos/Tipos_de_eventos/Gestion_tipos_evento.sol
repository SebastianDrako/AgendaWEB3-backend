// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "../../Gestion_De_Permisos.sol";

contract tipos_evento is permisos {

    // mapas con los tipos de eventos (mapa bidireccional)
    mapping (uint => string) eventos;
    mapping (string => uint) evento_rev;

    //funcion para interactuar con los mapas de tipo de evento

    function agregarTipoDeEvento (string memory nombre) public {
        require(permisosCheck(mod));
        uint hash = uint(keccak256(abi.encodePacked(nombre)));
         eventos[hash] = nombre;
         evento_rev[nombre] = hash;
    }

    function hashANombreTipoDeEvento (uint hash) public view returns(string memory){return eventos[hash];}

    function nombreAHashTipoDeEvento (string memory nombre) public view returns(uint){return evento_rev[nombre];}

    function eliminarTipoDeEvento (uint hash) public {
        require(permisosCheck(mod));
        delete evento_rev[eventos[hash]]; 
        delete eventos[hash];
        }

}