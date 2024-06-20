trigger Contracts on Contract (after insert, after update, after delete) {

    new ContractTriggerHandler().run();

}