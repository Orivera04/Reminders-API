<div align="center">
  <h1>Hi there! 🤖</h1>
  <p>Reminders is an API that allows you to send messages to the Telegram API and post them in groups. The API lets you create a set of reminders which can then be sent via ActiveJob.</p>
</div>

## 🚀 Controllers:

TypeSchedules -> Here is a catalog of the types of execution schedules available, including:
- Daily (ID: 1): sends a message every day at a specified hour (specified in JSON)
- Specific (ID: 2): sends a message on a specified day of the month at a specified time (specified in JSON).
```
GET {{HOST}}/type_schedules
```
<hr/>

FormattingStyles -> List of supported Markdown styles for the Telegram API, including:
- MarkDownV2 (ID: 1)
- HTML (ID: 2)
```
GET {{HOST}}/formatting_styles
```

<hr/>

Setting -> Here you can store the API key of your bot that Telegram provides, along with:
- Formatting style ID (use the ID from the MarkDownStyle model)
- Description of the setting

| Params        | Value.        |
| ------------- | ------------- |
| token_bot_api  | API KEY of the bot  |
| formatting_style_id  | Formatting style it could be markdown or html, you have to use the id of the model FormatingStyles  |
| description  | A description of the setting  |

```
GET, POST, PUT, DELETE {{HOST}}/settings
```


<hr/>

Chats -> Here you can store your chat configurations:

| Params        | Value.        |
| ------------- | ------------- |
| name  | Name of the chat  |
| description  | A description of the chat.  |
| setting_id  | The bot that will be used to send the reminder  |

```
GET, POST, PUT, DELETE {{HOST}}/chats
```


<hr/>
Reminder -> Here is a list of messages to be sent to the bot, where you specify the type of schedule.

| Parameter | Description |
|-----------|-------------|
| chat_id | The ID of the chat to send the reminder to |
| message | The message to include in the reminder |
| type_schedule_id | The type of reminder to create (1 for daily, 2 for specific day and time) |
| schedules | An object specifying the schedule for the reminder. For daily reminders, this should be an array of objects, each with a `day` (number 1-7) and an `hour_of_execution` (in format `HH:MM`), specifying the day(s) and time(s) to send the reminder. For specific day and time reminders, this should be an object with a `day_of_month` (number 1-31) and an `execution_hour` (in format `HH:MM`), specifying the exact date and time to send the reminder. |
| setting_id | The ID of the reminder setting to use |"


### Daily Reminder

A daily reminder can be sent every day at a specific hour. Here is an example JSON payload for creating a daily reminder:
```json
{
  "message": "Hello this is a test.",
  "type_schedule_id": 1,
  "schedules": {
    "schedules": [
      "monday": "11:30",
      "tuesday": "11:30",
      "wednesday": "11:30",
      "thursday": "11:30",
      "friday": "11:30",
      "saturday": "11:30",
      "sunday": "11:30"
    ]
  },
  "chat_id": 1
}
```

### Specific Reminder
A specific reminder is sent at a specific day and hour of the month. Here is an example JSON payload for creating a specific reminder:
```json
{
  "type_schedule_id": 2,
  "schedules": {
    "schedule": {
      "day_of_month": 27,
      "execution_hour": "10:00"
    }
  },
  "chat_id": 2,
  "message": "Hi Specific Test"
}
```
<hr/>

TelegramTrigger -> You can use this endpoint to send a manual reminder message for testing purposes.


| Params        | Value.        |
| ------------- | ------------- |
| reminder_id  |  ID of the reminder to be sent |

```
POST {{HOST}}/telegram_triggers
```

<hr/>


TelegramJobs -> You can use this endpoint to force the execution of the job that is responsible for sending automatic reminder messages without user interaction.

```
POST {{HOST}}/telegram_jobs
```

<hr/>

## ReminderJob

ReminderJob is a background job that sends reminders to Telegram chats based on their schedule.

### How it works

ReminderJob is a Ruby class that inherits from ActiveJob::Base. It performs the following steps:

1. Retrieves all active reminders from the database.
2. For each reminder, checks if it's time to send the message based on its schedule.
3. If it's time, sends the message to the corresponding chat using the TelegramNotifier service.

### How to use it

Invoke ReminderJob manually using the following command:
```rails
ReminderJob.perform_now
```

Alternatively, you can make a GET request to the TelegramJobs controller. This allows you to use an online tool like https://www.easycron.com/ to schedule the job instead of relying on your computer's crontab. Simply schedule the request to the controller to run every 20 minutes, and all your reminders will be sent automatically without any further interaction required.


Diagram:

                          ┌───────────┐
                          │ EasyCron  │
                          └─────┬─────┘
                                │
                                ▼
                          ┌────────────┐            ┌────────────┐
                          │RemindersAPI│──────────▶ │  Database  │    
                          └─────┬──────┘            └────────────┘
                                │                   
                                ▼
                          ┌───────────┐
                          │ Telegram  │
                          │    API    │
                          └───────────┘

