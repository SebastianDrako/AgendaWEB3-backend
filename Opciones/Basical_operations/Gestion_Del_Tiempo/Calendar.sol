// SPDX-License-Identifier: MZL
pragma solidity ^0.8.7;

import "./Time.sol";

contract calendar is time {

    uint[12] mesesGregorianos = [31 , 28 , 31 , 30 , 31 , 30 , 31 , 31 , 30 , 31 , 30 , 31 ] ;

    uint[14] mesesFijoInternacional = [28,28,28,28,28,28,28,28,28,28,28,28,28,1] ;



 function fixGregoriano (uint dias , uint year) public view returns(uint[2] memory) {

     uint[12] memory list = mesesGregorianos;

    if (esYearBisiesto(year)) {

        list[1] = list[1] + 1 ;

    }

for ( uint i = 0 ; i < list.length ;  i++ ) {
   if ( dias <= list[i] ) {

       return [dias , i+1] ;

   } else { dias = dias - list[i];}
}

return [uint(0) , uint(0)];

 }


 function getGregoriano (uint seg) public view returns(uint[6] memory) {

    uint[5] memory fecha = fechaGet(seg);
    uint[2] memory mesdia = fixGregoriano(fecha[3] , fecha[4]);

    return [fecha[0] , fecha[1] , fecha[2] , mesdia[0] , mesdia[1] , fecha[4]];




}

}