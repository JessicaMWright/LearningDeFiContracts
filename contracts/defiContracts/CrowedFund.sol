//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
    


contract CrowdFund {

    event Launch(
        uint id,
        address indexed creator,
        uint goal,
        uint startAt,
        uint endAt
    );

    event Cancel(uint _id);

    struct Campaign {
        address creator;
        uint goal;
        uint pledged;
        uint32 startAt;
        uint32 endAt;
        bool claim;
    }

    IERC20 public immutable token;
    uint public count;
    mapping(uint => Campaign) public campaigns;
    mapping(uint => mapping(address => uint)) public pledgedAmount;

    constructor(address _token) {
        token = IERC20(_token);
    }


    function launch(
        uint _goal,
        uint _startAt,
        uint _endAt

    ) external {
        require(_startAt >= block.timestamp, "start at < now");
        require(_endAt >= _startAt, "end at < start at");
        require(_endAt <= block.timestamp + 90 days, "end at is greater than max duration");

        count += 1;
        campaigns[count] = Campaign({
            creator: msg.sender, 
            goal: _goal,
            pledged: 0,
            startAt: _startAt,
            endAt: _endAt,
            claimed: false
        });

        emit Launch(count, msg.sender, _goal, _startAt, _endAt);

    }
        // to cancel campign
    function cancel(uint _id) external {
        Campaign memory campign = campaigns[_id];
        require(msg.sender == campaign.creator,"not creator");
        require(block.timestamp < campaign.startAt, "started");
        delete campaigns[_id];
        emit Cancel(_id);

    }
    
        function pledge(uint _id, uint _amount) external {

    }
    function unpledge(uint _id, uint _amount) external {

    }
    function claim(uint _id) external {

    }
    function refund(uint _id) external {

    }




}