# Roadmap
Here is the full Roadmap for HaxeShare in implementation order:

 1. Add, implement and test the major SQL databases (MySQL, SQLLite, PostgreSQL, Microsoft & Oracle). - Milestone: SQL Databases
 2. Add, implement and test the major NoSQL databases (MongoDB & Cassandra). - Milestone: NoSQL Databases
 3. Revise macro-context code generation. - Milestone: Code-gen Refactoring
 4. Add file uploading utilities (both static and dynamic). - Milestone: File Uploading
 5. Add, implement and test login system for client and server. - Milestone: Login System
 6. Add tests for other target languages (Python, NodeJS (JavaScript), C# & Java). - Milestone: Tests
 7. Create and test REST Helper class. - Milestone: REST Helper
 8. Add, implement and test the major payment gateways (Stripe, PayPal & Square). - Milestone: Payment Gateways
 9. Add, implement and test auto-form generation for client and server. - Milestone: Form Generation

## SQL Databases

 1. MySQL database layer implemented for PHP.
 2. SQLLite database layer implemented for PHP.
 3. PostgreSQL database layer implemented for PHP.
 4. Microsoft database layer implemented for PHP.
 5. Oracle database layer implemented for PHP.

## NoSQL Databases

 1. MongoDB database layer implemented for PHP.
 2. Cassandra database layer implemented for PHP.

## Code-gen Refactoring

 1. Revise server-side router generation.
 2. Revise client-side router generation.
 3. Revise REST API generation.

## File Uploading
This speaks for itself really.

## Login System
The login system would macro-generate `DBObject`'s for tables and setup server-side Session code accordingly.

It will be basic at first. Later, when the REST Helper class is fully implemented, we will come back to this to implement access privileges.

## Tests

 1. Add more Tests for other target languages.

### Python

 1. Pages (HTML)
 2. File Uploading
 3. Login and Sessions
 4. MySQL
 5. SQLLite
 6. PostgreSQL
 7. Microsoft
 8. Oracle
 9. MongoDB
 10. Cassandra

### NodeJS

 1. Pages (HTML)
 2. File Uploading
 3. Login and Sessions
 4. MySQL
 5. SQLLite
 6. PostgreSQL
 7. Microsoft
 8. Oracle
 9. MongoDB
 10. Cassandra

### C#

 1. Pages (HTML)
 2. File Uploading
 3. Login and Sessions
 4. MySQL
 5. SQLLite
 6. PostgreSQL
 7. Microsoft
 8. Oracle
 9. MongoDB
 10. Cassandra

 ### Java

 1. Pages (HTML)
 2. File Uploading
 3. Login and Sessions
 4. MySQL
 5. SQLLite
 6. PostgreSQL
 7. Microsoft
 8. Oracle
 9. MongoDB
 10. Cassandra

## REST Helper
OAuth would be implemented on all the targets for the REST Helper class.

Once that is done, this class would wrap the respective target OAuth implementations and, in conjunction with the REST API generator, provide a secure way to develop REST applications more productively.

 1. PHP
 2. Python
 3. NodeJS
 4. C#
 5. Java

Client-side will just be JavaScript, which would have the typedef's already being generated for the client.

## Payment Gateways
In working with this, many wrapper classes will be added: `Checkout`, `Voucher`, `Subscription`, `Customer`, `Order`, `Invoice`.

 1. Stripe
 2. PayPal
 3. Square

## Form Generation
Automatic form generation would come in the form of linking database objects to templates/HTML pages.