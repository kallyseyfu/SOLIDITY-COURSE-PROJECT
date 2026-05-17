contract Sidekick {
    function sendAlert(address hero) external {
        (bool success, ) = hero.call(
            abi.encodeWithSignature("alert()")
        );

        require(success, "Call failed");
    }
}