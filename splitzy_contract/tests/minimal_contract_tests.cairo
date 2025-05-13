#[cfg(test)]
mod tests {
    use splitzy_contract::{
        IMinimalContractDispatcher,      
        IMinimalContractDispatcherTrait  
    };

    use splitzy_contract::MinimalContract::BalanceKey; 

    use starknet::ContractAddress; 
    use core::option::OptionTrait; 
    use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

    fn deploy_minimal_contract() -> IMinimalContractDispatcher { 
        let contract_class = declare("MinimalContract").unwrap().contract_class();
        let constructor_calldata = array![]; 
        let (_contract_address, _) = contract_class.deploy(@constructor_calldata).unwrap(); 
        IMinimalContractDispatcher { contract_address: _contract_address } 
    }

    #[test]
    fn test_get_true_returns_true() {
        let dispatcher = deploy_minimal_contract();
        assert_eq!(dispatcher.get_true(), true, "get_true should return true");
    }

    #[test]
    fn test_set_and_get_balance() {
        let dispatcher = deploy_minimal_contract();

        let user1_felt: felt252 = 1; 
        let user1_address: ContractAddress = user1_felt.try_into().unwrap();
        
        let test_key = BalanceKey { group_id: 1_felt252, user_address: user1_address };
        let test_value = 100_i128;

        // Check that initial balance is 0 for a new key
        let initial_balance = dispatcher.get_balance(test_key);
        assert_eq!(initial_balance, 0_i128, "Initial balance should be 0");

        // Set a balance
        dispatcher.set_balance(test_key, test_value);

        // Get the balance
        let retrieved_balance = dispatcher.get_balance(test_key);
        assert_eq!(retrieved_balance, test_value, "Retrieved balance mismatch");

        // Test setting a different value
        let new_test_value = 200_i128;
        dispatcher.set_balance(test_key, new_test_value);
        let new_retrieved_balance = dispatcher.get_balance(test_key);
        assert_eq!(new_retrieved_balance, new_test_value, "New retrieved balance mismatch");

        // Test another key to ensure no interference
        let user2_felt: felt252 = 2; 
        let user2_address: ContractAddress = user2_felt.try_into().unwrap();
        let another_key = BalanceKey { group_id: 1_felt252, user_address: user2_address };
        let balance_for_another_key = dispatcher.get_balance(another_key);
        assert_eq!(balance_for_another_key, 0_i128, "Balance for another key should be 0");

        dispatcher.set_balance(another_key, 50_i128);
        let retrieved_for_another = dispatcher.get_balance(another_key);
        assert_eq!(retrieved_for_another, 50_i128, "Retrieved for another key mismatch");

        // Ensure first key is unaffected
        let first_key_still_ok = dispatcher.get_balance(test_key);
        assert_eq!(first_key_still_ok, new_test_value, "First key was affected");
    }
}
