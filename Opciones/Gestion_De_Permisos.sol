// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Basical_operations.sol";

contract permisos is basic_logic{

    // Enum con los posibles roles
    enum roles{mod , agend, ver, pub}

    uint constant pub = 0;
    uint constant ver = 1;
    uint constant agend = 2;
    uint constant mod = 3;

    // mapeo de los usuarios
    mapping(address => roles) usuarios;

    // bool que abre o cierra el acceso al calendario
    bool internal publico ;

    // Funcion que permite cambiar el estado de "publico"
    function editPublico (bool nval) public{
        require(permisosCheck(mod));
        publico = nval;

    }

//validacion de identidad
// niveles de permisos: 0 (pub) ; 1 (ver) ; 2 (agend) ; 3 (mod)
    function permisosCheck(uint level) internal view returns(bool){
        if (level == 0 && publico) {return true;}
        else if (level != 0 && level <= uint(usuarios[msg.sender])) {return true;}
        else return false;
    }

// Funciones para agregar usuarios

    function addPermisos (uint level, address user) public {
        require(permisosCheck(mod));
        usuarios[user] = roles(level) ;
    }

    function modifyPermisos (uint level, address user) public {
        addPermisos(level,user);
    }

// Funcion para eliminar usuarios
    function popPermisos (address user) public {
    require(permisosCheck(mod));      
    delete usuarios[user] ;
    }

// Funciones para consultar estado de permisos
    function getPermisosStatus() public view returns(uint) {
        return uint(usuarios[msg.sender]);
    }


}