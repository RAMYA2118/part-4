1. High-Level Design
Modules/Components
Notification API – Receives notification requests from Assignment and Enrollment services.
Notification Service – Creates notifications and handles business logic.
User Preference Service – Stores students' notification preferences (Email, SMS, Push).
Notification Dispatcher – Sends notifications through the selected channel.
Database – Stores notification history and delivery status.
Layered Architecture

Presentation Layer

Receives notification requests through REST APIs.
Returns success or failure responses.

Business Layer

Validates notification requests.
Creates notification messages.
Checks user preferences.
Selects the delivery channel.

Data Access Layer

Retrieves student preferences.
Stores notification records.
Updates notification status.

Database Layer

Stores student preferences.
Stores notification history.
Stores delivery logs.
Notification Flow
A new assignment is posted.
Assignment Service sends a request to Notification API.
Business Layer creates a notification.
User preferences are retrieved.
Notification is stored in the database.
Notification Dispatcher sends Email/SMS/Push notification.
Delivery status is updated.
2. Architecture Style Choice
Selected Architecture

Event-Driven Architecture

Justification

Whenever a new assignment is posted or enrollment status changes, an event is generated. The Notification Service listens to the event and sends notifications automatically.

Advantages
Loose coupling between services.
High scalability for handling multiple notification requests.
Easy to add new notification channels in the future.
Challenges
Events may arrive out of order.
Message delivery may fail if the event broker is unavailable.
3. Low-Level Design
Class 1: Notification

Attributes

notificationId : int
studentId : int
title : String
message : String
channel : String
status : String
createdAt : Date

Methods

createNotification() : void
updateStatus(status : String) : void
getNotificationDetails() : String

SOLID Principle
Single Responsibility Principle (SRP) – The Notification class is responsible only for storing notification data and managing its status.

Class 2: NotificationDispatcher

Attributes

dispatcherId : int
channel : String

Methods

send(notification : Notification) : boolean
retry(notification : Notification) : boolean

SOLID Principle
Open/Closed Principle (OCP) – New notification channels can be added without modifying existing dispatcher logic.

Interface: NotificationChannel

Method

send(notification : Notification) : boolean

Implementations

EmailChannel
SMSChannel
PushChannel

Flexibility
Using an interface allows different notification channels to be added without changing the NotificationDispatcher. This improves flexibility and maintainability.

4. Scalability Plan
Expected Bottleneck

The notification service may experience heavy traffic during assignment deadlines, semester registration, or exam result announcements.

Scaling Choice

Horizontal Scaling

Justification

Multiple instances of the notification service can run simultaneously to handle increased traffic and improve performance.

Elasticity Policy
Add new servers when CPU usage exceeds 70% or the notification queue becomes large.
Remove servers when CPU usage remains below 30% for a long period.
Load Balancing Algorithm

Round Robin

Justification

Round Robin distributes incoming notification requests equally across all servers. It is simple, efficient, and suitable because notification requests generally require similar processing time.

5. Cloud Deployment Recommendation
Deployment Model

Public Cloud

Justification

Public Cloud provides low cost, easy scalability, and high availability.

Cloud Service Model

Platform as a Service (PaaS)

Justification

PaaS allows developers to focus on application development while the cloud provider manages the infrastructure.

Two NIST Characteristics

1. Rapid Elasticity
Resources automatically increase or decrease based on notification traffic.

2. On-Demand Self-Service
Computing resources can be provisioned automatically whenever needed.

Cloud Challenge

Downtime

Mitigation

Deploy the application across multiple availability zones and use automatic failover with regular backups to ensure uninterrupted service.