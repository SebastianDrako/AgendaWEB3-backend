// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


//aqui se crearan los fracmentos de codigo que permiten hacer operacines tediosas
contract basic_logic{

    function isAddressPresent (address toFind, address[] memory toCheck) internal pure returns(bool){

        for (uint i = 0; i < toCheck.length; i++) {
            if (toCheck[i] == toFind) {
                return true;
            }
        }
        return false;

    }



}