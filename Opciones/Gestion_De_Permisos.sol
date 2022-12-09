// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Basical_operations.sol";

contract permisos is basic_logic{

    // Enum con los posibles roles
    enum roles{pub , ver, agend, mod}

    // mapeo de los usuarios
    mapping(address => roles) usuarios;

    // bool que abre o cierra el acceso al calendario
    bool internal publico ;

    // Funcion que permite cambiar el estado de "publico"
    function editPublico (bool nval) public{
        require(permisosCheck(roles.mod));
        publico = nval;

    }

//validacion de identidad
// niveles de permisos: 0 (pub) ; 1 (ver) ; 2 (agend) ; 3 (mod)
    function permisosCheck(roles level) internal view returns(bool){
        if (level == roles.pub && publico) {return true;}
        else if (level != roles.pub && level <= usuarios[msg.sender]) {return true;}
        else return false;
    }

// Funciones para agregar usuarios

    function addPermisos (roles level, address user) public {
        require(permisosCheck(roles.mod));
        usuarios[user] = roles(level) ;
    }

    function modifyPermisos (roles level, address user) public {
        addPermisos(level,user);
    }

// Funcion para eliminar usuarios
    function popPermisos (address user) public {
    require(permisosCheck(roles.mod));      
    delete usuarios[user] ;
    }

// Funciones para consultar estado de permisos
    function getPermisosStatus() public view returns(uint) {
        return uint(usuarios[msg.sender]);
    }


}