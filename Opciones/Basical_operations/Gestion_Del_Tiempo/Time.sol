// SPDX-License-Identifier: MZL
pragma solidity ^0.8.7;

import "../Bool_analisis/Bool.sol";

contract time is bool_analisis {

int timeZone = -5;


    function getAcumMinutes (uint seg) public pure returns(uint) { return seg / 60 ;}

    function getAcumHours (uint seg) public pure  returns(uint) { return getAcumMinutes(seg) / 60 ;}

    function getAcumDays (uint seg) public pure  returns(uint) { return getAcumHours(seg) / 24 ;}

    function getAcumYears (uint seg) public pure returns(uint) { return getAcumDays(seg) / 365 ;}


//Funcion para saber si un año es bisiesto

    function esYearBisiesto (uint year) public pure returns(bool){

        if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))
        {return true;} 
        else {return false;}

    }

//Funcion que calcula la catnidad de dias bisiestos para una fecha
 function cuantosDiasBisiestos (uint year) public pure returns(uint) {
     // Varibla contador de dias bisiestos
    uint diasBi = 0;


    //Evalua para cada año desde epoch hasta el año solicitado la catnidad de años bisiestos y los cuenta
     for( uint c = 1970 ; c < year ; c++)
     {if ( esYearBisiesto( c )){diasBi++ ;}}

     //Devuelve la catidad de años bisiestos cotados
     return diasBi;
 }

 function fechaGet (uint seg) public view returns(uint[5] memory){

    // Ajusta el tiempo a la zonaHoraria
     seg = uint(int(seg) + (timeZone * 3600)) ;

     // Se fija el año actual teniendo en cuenta la fecha de epoch
    uint yearToEval = getAcumYears(seg) + 1970;
    // Prueba que valida si se esta en un año bisiesto
     bool test = esYearBisiesto( yearToEval ) ;
    // Si el año es bisiesto se deben restar los segundos de los dias bisiestos tracturridos hasta el año anterior desde epoch , de lo contrario se deben restar los segundos de los dias bisiestos tracturridos hasta el año desde epoch
     if ( test ) { seg = seg - (cuantosDiasBisiestos(yearToEval - 1) * 86400);}
     else { seg = seg - ( cuantosDiasBisiestos(yearToEval) * 86400 ); }

    // obtiene los valores de Minutos, Hora, dias y años acomulados desde unix con ajuste
    uint minutosAcumEpoch = getAcumMinutes(seg) ;
    uint horasAcumEpoch = getAcumHours(seg) ;
    uint diasAcumEpoch = getAcumDays(seg) ;
    uint yearAcumEpoch = getAcumYears(seg);


    // Obtiene Segundos, Minutos, Hora, dias , anuales y el año segun calendario fijo y gregoriano
    uint segundos = seg - (minutosAcumEpoch * 60);
    uint minutos = getAcumMinutes(seg) - (horasAcumEpoch * 60);
    uint horas = horasAcumEpoch - (diasAcumEpoch * 24);
    // El mas uno se agrega por que apartir de las 0:0:01 es el dia 1
    uint dias = (diasAcumEpoch - (yearAcumEpoch * uint(365))) + 1;
    uint year = yearAcumEpoch + 1970 ;

    return ([ segundos , minutos  , horas , dias , year]) ;

}



}