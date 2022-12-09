// SPDX-License-Identifier: MZL
pragma solidity ^0.8.7;


contract search {

    function isAddressPresent (address toFind, address[] memory toCheck) internal pure returns(bool){

        for (uint i = 0; i < toCheck.length; i++) {
            if (toCheck[i] == toFind) {
                return true;
            }
        }
        return false;

    }
}


