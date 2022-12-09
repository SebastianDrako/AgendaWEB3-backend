// SPDX-License-Identifier: MZL
pragma solidity ^0.8.7;

import "../Bool_analisis/Bool.sol";

contract time is bool_analisis {

uint timeZone;

struct date {

    uint segundo;
    uint minuto;
    uint hora;
    uint dia;
    uint mes;
    uint year;

}


// Funcion que obtiene Segundos, Minutos, Hora, dias y años segun calendario gregoriano y Fijo internacional
 function fechaGet (int _timeZone) view public returns( uint[5] memory) {

     //Obtiene los segundos acumulados desde unix y los desfaza segun la zona horaria.
    uint segundosAcumEpoch = uint((int(block.timestamp) + (_timeZone*60*60)));

    // obtiene los valores de Minutos, Hora, dias y años acomulados desde unix
    uint minutosAcumEpoch = (segundosAcumEpoch/60) ;
    uint horasAcumEpoch = (minutosAcumEpoch / 60) ;
    uint diasAcumEpoch = (horasAcumEpoch / 24) ;
    uint yearAcumEpoch = (diasAcumEpoch / 365);

    // Obtiene Segundos, Minutos, Hora, dias , anuales y el año segun calendario fijo y gregoriano
    uint segundos = segundosAcumEpoch - (minutosAcumEpoch * 60);
    uint minutos = minutosAcumEpoch - (horasAcumEpoch * 60);
    uint horas = horasAcumEpoch - (diasAcumEpoch * 24);
    uint dias = diasAcumEpoch - (yearAcumEpoch * uint(365));
    uint year = yearAcumEpoch + 1970 ;

    //Devuelve la informacion en una lista
    return ([ segundos , minutos  , horas , dias , year]) ;
 }


//Funcion que calcula la catnidad de dias bisiestos para una fecha
 function cuantosDiasBisiestos (int _timeZone) internal view returns(uint) {
     // Varibla contador de dias bisiestos
    uint diasBi = 0;

    // Obtiene el año solicitado de la funcion fechaGet
    uint year = fechaGet(_timeZone)[4];

    //Evalua para cada año desde epoch hasta el año solicitado la catnidad de años bisiestos y los cuenta
     for( uint c = 1970 ; c < year ; c++)
     {if (c % 4 == 0 && (c % 100 != 0 || c % 400 == 0)){diasBi++ ;}}

     //Devuelve la catidad de años bisiestos cotados
     return diasBi;
 }


 }


//view 

//pure