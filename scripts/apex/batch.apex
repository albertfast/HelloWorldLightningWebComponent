//invoke the batch class
AddressBatch batchable = new AddressBatch();
Database.executeBatch(batchable, 50);