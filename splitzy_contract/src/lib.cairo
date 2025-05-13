#[starknet::interface]
pub trait IMinimalContract<TContractState> {
    fn get_balance(self: @TContractState, key: MinimalContract::BalanceKey) -> i128;
    fn set_balance(ref self: TContractState, key: MinimalContract::BalanceKey, value: i128);
}

#[starknet::contract]
pub mod MinimalContract {
    use starknet::ContractAddress;
    use starknet::storage::Map;
    use core::serde::Serde; 
    use core::hash::{Hash, HashStateTrait}; 

    #[derive(Drop, Serde, starknet::Store, Hash, PartialEq, Copy)]
    pub struct BalanceKey {
        pub group_id: felt252,
        pub user_address: ContractAddress,
    }

    #[storage]
    pub struct Storage {
        pub balances: Map<BalanceKey, i128>
    }

    #[abi(embed_v0)] 
    impl MinimalContractImpl of super::IMinimalContract<ContractState> {
        fn get_balance(self: @ContractState, key: BalanceKey) -> i128 {
            self.balances.read(key) 
        }

        fn set_balance(ref self: ContractState, key: BalanceKey, value: i128) {
            self.balances.write(key, value); 
        }
    }

    #[constructor]
    fn constructor(ref self: ContractState) {}
}
