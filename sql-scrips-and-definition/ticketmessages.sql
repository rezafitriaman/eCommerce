--
-- The SenderID in the TicketMessages table represents the user who sent the message. It references the UserID in the Users table. Naming it SenderID rather than UserID provides clarity in the context of a messaging system, indicating that this ID specifically identifies the sender of the message within a support ticket conversation.
--
-- Clarification on Naming
-- SenderID: Represents the user who sent the message.
-- UserID: In the context of SupportTickets, it represents the user who created the support ticket.
-- By using SenderID, it becomes clear that this ID indicates the sender of a specific message in a ticket, which may be different from the user who opened the ticket (e.g., support staff or other users).

-- Adding Messages:
--
-- User (customer) with UserID = 1 sends a message about the issue.
-- Support representative with UserID = 2 responds.
-- User (customer) with UserID = 1 acknowledges the response.

INSERT INTO ecommerce_table.ticketmessages (ticketid, senderid, messagetext)
VALUES (9, 2, 'The product I received is damaged.'),
        (9, 4, 'We apoligize for the inconvenience. We will send a replacement.'),
        (9, 2, 'Thank you for the quick response.');