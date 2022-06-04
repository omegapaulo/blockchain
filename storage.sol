// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; // Solidity version, always on top of file

// EVM = Ethereum Virtual Network
// Any solidity code can be deployed to any EVM compatible blockchain like
// Avalanche, Polygon, Fantom

// class
contract SimpleStorage {
    // Basic data types
    // boolean:  true || false
    // uint: Unsigned intenger -  whole number that is not positive or negative
    // int: positive or negative whole number
    // address: the wallet address
    // bytes: Strings converted into random nums+strings
    // structured object - to store mutiple variables, just like objects in js
    // arrays -  Adding the [] infront of the variable will make it an array
    // mapping -  is a data structure where a key is mapped to a single value. Just like objects in js

    // variables:
    // bool hasFavNum = true;
    // uint256 longNum = 12345;
    // int256 num = -12345;
    // string favNumInText = "Five";
    // address myAddress = 0x03c0FC95babc10c81bEA62cC47b24A151A3c1b91;
    // bytes32 favBytes = "Cat"; //0x1134njfjri

    // Initialized to zero
    // a variable is just a view function that returns a piece of data
    uint256 public favNum; // can be:  public, internal, external or private

    // Mapping a name to a fav num
    // Mapping is a dictionary or hash tables
    mapping(string => uint256) public nameToFavNum;

    function store(uint256 _favNum) public {
        favNum = _favNum;
    }

    // Settig public People as person
    // People public person = People({favNum:2, name:"Omega"}); Not the best way

    // object
    struct People {
        uint256 favNum;
        string name;
    }

    // Array
    People[] public people;

    // function can be view or pure
    // functions types: view and pure don't make call to blockchain, therefore don't cost gas, and don't modify the blockchain and only read data
    function retrieve() public view returns (uint256) {
        return favNum;
    }

    // Data locations for functions
    // caldata, memory: Means that data is only temporary,  Are given to struct , maps and arrays
    // storage: Means that data is permanent, Are stored in the blockchain

    function addPerson(string memory _name, uint256 _favNum) public {
        people.push(People(_favNum, _name)); // pushing new data to array
        nameToFavNum[_name] = _favNum; // Mapping a name to a fav num
    }
}
