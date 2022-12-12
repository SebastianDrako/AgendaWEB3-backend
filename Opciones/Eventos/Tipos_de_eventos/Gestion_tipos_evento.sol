// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "../../Gestion_De_Permisos.sol";

contract tipos_evento is permisos {

    // mapas con los tipos de eventos (mapa bidireccional)
    mapping (uint => string) _eventos;
    mapping (string => uint) _evento_rev;

    //funcion para interactuar con los mapas de tipo de evento

    function agregarTipoDeEvento (string memory nombre) public {
        require(permisosCheck(roles.mod));
        uint hash = uint(keccak256(abi.encodePacked(nombre)));
         _eventos[hash] = nombre;
         _evento_rev[nombre] = hash;
    }

    function hashANombreTipoDeEvento (uint hash) public view returns(string memory){return _eventos[hash];}

    function nombreAHashTipoDeEvento (string memory nombre) public view returns(uint){return _evento_rev[nombre];}

    function eliminarTipoDeEvento (uint hash) public {
        require(permisosCheck(roles.mod));
        delete _evento_rev[_eventos[hash]]; 
        delete _eventos[hash];
        }

}