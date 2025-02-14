<p align="center">
  <a href='https://twitter.com/WeAreTellor'>
    <img src= 'https://img.shields.io/twitter/url/http/shields.io.svg?style=social' alt='Twitter WeAreTellor' />
  </a>
</p>


# Overview

Use this package to install the Tellor User Contracts and integrate Tellor into your contracts.

Once installed this will allow your contracts to inherit the functions from UsingTellor.

#### How to Use
Just inherit the UsingTellor contract, passing the Tellor address as a constructor argument:

Here's an example
```solidity
import "usingtellor/contracts/UsingTellor.sol";

contract PriceContract is UsingTellor {

  uint256 public btcPrice;

  //This contract now has access to all functions in UsingTellor
  constructor(address payable _tellorAddress) UsingTellor(_tellorAddress) public {}

  function setBtcPrice() public {
      bytes memory _b = abi.encode("SpotPrice", abi.encode("btc", "usd"));
      bytes32 _btcQueryId = keccak256(_b);

      bool _didGet;
      uint256 _timestamp;
      bytes memory _value;

      (_didGet, _value, _timestamp) = getCurrentValue(_btcQueryId);
      btcPrice = abi.decode(_value,(uint256));
  }
}
```
##### Addresses:

Find Tellor contract addresses [here](https://docs.tellor.io/tellor/the-basics/contracts-reference).


#### Available Tellor functions:

Children contracts have access to the following functions:

```solidity
/**
 * @dev Retrieve value from oracle based on queryId/timestamp
 * @param _queryId being requested
 * @param _timestamp to retrieve data/value from
 * @return bytes value for query/timestamp submitted
 */
function retrieveData(bytes32 _queryId, uint256 _timestamp) public view returns(bytes memory);

/**
 * @dev Determines whether a value with a given queryId and timestamp has been disputed
 * @param _queryId is the value id to look up
 * @param _timestamp is the timestamp of the value to look up
 * @return bool true if queryId/timestamp is under dispute
 */
function isInDispute(bytes32 _queryId, uint256 _timestamp) public view returns(bool);

/**
 * @dev Counts the number of values that have been submitted for the queryId
 * @param _queryId the id to look up
 * @return uint256 count of the number of values received for the queryId
 */
function getNewValueCountbyQueryId(bytes32 _queryId) public view returns(uint256);

// /**
//  * @dev Gets the timestamp for the value based on their index
//  * @param _queryId is the id to look up
//  * @param _index is the value index to look up
//  * @return uint256 timestamp
//  */
function getTimestampbyQueryIdandIndex(bytes32 _queryId, uint256 _index) public view returns(uint256);

/**
 * @dev Allows the user to get the latest value for the queryId specified
 * @param _queryId is the id to look up the value for
 * @return ifRetrieve bool true if non-zero value successfully retrieved
 * @return value the value retrieved
 * @return _timestampRetrieved the retrieved value's timestamp
 */
function getCurrentValue(bytes32 _queryId) public view returns(bool _ifRetrieve, bytes memory _value, uint256 _timestampRetrieved);

/**
 * @dev Retrieves the latest value for the queryId before the specified timestamp
 * @param _queryId is the queryId to look up the value for
 * @param _timestamp before which to search for latest value
 * @return _ifRetrieve bool true if able to retrieve a non-zero value
 * @return _value the value retrieved
 * @return _timestampRetrieved the value's timestamp
 */
function getDataBefore(bytes32 _queryId, uint256 _timestamp) public view returns(bool _ifRetrieve, bytes memory _value, uint256 _timestampRetrieved);

```


#### Tellor Playground:

For ease of use, the  `UsingTellor`  repo comes with a version of [Tellor Playground](https://github.com/tellor-io/TellorPlayground) for easier integration. This version contains a few helper functions:

```solidity
/**
 * @dev A mock function to submit a value to be read without miners needed
 * @param _queryId The tellorId to associate the value to
 * @param _value the value for the queryId
 * @param _nonce the current value count for the query id
 * @param _queryData the data used by reporters to fulfill the data query
 */
function submitValue(bytes32 _queryId, bytes calldata _value, uint256 _nonce, bytes memory _queryData) external;

/**
 * @dev A mock function to create a dispute
 * @param _queryId The tellorId to be disputed
 * @param _timestamp the timestamp of the value to be disputed
 */
function beginDispute(bytes32 _queryId, uint256 _timestamp) external;

/**
 * @dev Retrieve bytes value from oracle based on queryId/timestamp
 * @param _queryId being retrieved
 * @param _timestamp to retrieve data/value from
 * @return bytes value for queryId/timestamp submitted
 */
function retrieveData(bytes32 _queryId, uint256 _timestamp) public view returns (bytes memory);

/**
 * @dev Counts the number of values that have been submitted for a given ID
 * @param _queryId the ID to look up
 * @return uint256 count of the number of values received for the queryId
 */
function getNewValueCountbyQueryId(bytes32 _queryId) public view returns (uint256);

/**
 * @dev Gets the timestamp for the value based on their index
 * @param _queryId is the queryId to look up
 * @param _index is the value index to look up
 * @return uint256 timestamp
 */
function getTimestampbyQueryIdandIndex(bytes32 _queryId, uint256 _index) public view returns (uint256);

/**
 * @dev Adds a tip to a given query ID.
 * @param _queryId is the queryId to look up
 * @param _amount is the amount of tips
 * @param _queryData is the extra bytes data needed to fulfill the request
 */
function tipQuery(bytes32 _queryId, uint256 _amount, bytes memory _queryData) external;
```


# Test
Open a git bash terminal and run this code:

```bash
git clone https://github.com/tellor-io/usingtellor.git
cd usingtellor
npm i
npm test
```

# Implementing using Tellor
See our documentation for implementing usingTellor [here.](https://docs.tellor.io/tellor/getting-data/introduction)

# Keywords

Decentralized oracle, price oracle, oracle, Tellor, TRB, Tributes, price data, smart contracts.
