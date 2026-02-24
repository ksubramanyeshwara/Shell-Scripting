# Job Scheduling

- It allows you to automate the execution of commands or scripts at specific times, dates, or intervals without manual intervention.
- It is useful for automating repetitive tasks, backups, system maintenance, and more.

## at

- It is used to schedule task to be executed at a specific time in the future.
- It is a one time scheduler.

`at [options] TIME`

### Time formats

```sh
at 10:30              # Today at 10:30 AM
at 10:30 PM           # Today at 10:30 PM
at 10:30 tomorrow     # Tomorrow at 10:30 AM
at noon               # Today at 12:00 PM
at midnight           # Tonight at 12:00 AM
at now + 5 minutes    # 5 minutes from now
at now + 2 hours      # 2 hours from now
at now + 3 days       # 3 days from now
at 9am July 4         # A specific date
at 10:00 AM 2/28/2026 # Another specific date format
```

- `$atq`: List all scheduled jobs.
- `$atrm <job_number>`: Remove a scheduled job.
- `$at -c <job_number>`: Shows what is scheduled.

## DevOps use cases

1. Restart service after a specific time.
   ```sh
    at now + 15 minutes
    sudo systemctl restart nginx
   ```
2. Delete temporary files at night
   ```sh
   at 11:59 PM
   rm -rf /tmp/*
   ```
3. Schedule log cleanup
   ```sh
   at 11:59 PM
   rm -rf /var/log/nginx/*
   ```

# CRON

- CRON is a time-based job scheduler.
- It runs commands or scripts at specified intervals, such as hourly, daily, weekly, or monthly.
- It is used to automate repetitive tasks, backups, system maintenance, and more.

## How does it work?

- It uses a daemon called `crond` to manage scheduled jobs.
- It reads the crontab file to determine which jobs to run and when.
- Configuration for the task are stored in the crontab file.

### crontab = cron table

- It stores scheduled jobs.
- It is a text file that contains the schedule of cron entries.
- It is user specific.

### crontab commands

- `$crontab -e`: Edit the crontab file.
- `$crontab -l`: List all scheduled jobs.
- `$crontab -r`: Remove all scheduled jobs.
- `$crontab -u <username>`: Edit the crontab file for a specific user. Root only access
- `$crontab -u <username> -l`: List all scheduled jobs for a specific user. Root only access
- `$crontab -u <username> -r`: Remove all scheduled jobs for a specific user. Root only access

### crontab format

```sh
# user
m h  dom mon dow   command
minute hour day-of-month month day-of-week command

# root
m h  dom mon dow   user   command
minute hour day-of-month month day-of-week username command

0 0 * * *  # 12 midnight daily
*/15 * * * * # Every 15 minutes
5 * * * *  # Runs at 5th minute of every hour
0 2 * * *  # Run every day at 2 AM
0 17 * * * # Run every Sunday at 5 PM
30 8 1 * * # 1st of every month
15 14 * * 1-5 # Run at 2:15 PM from Monday to Friday
```

### Special Strings

| String     | Equivalent       | Meaning               |
| ---------- | ---------------- | --------------------- |
| `@reboot`  |                  | Run at system startup |
| `@yearly`  | 0 0 1 1 \*       | Once per year         |
| `@monthly` | 0 0 1 \* \*      | Once per month        |
| `@weekly`  | 0 0 \* \* 0      | Once per week         |
| `@daily`   | 0 0 \* \* \*     | Once per day          |
| `@hourly`  | 0 \* \* \* \* \* | Once per hour         |

```sh
# instead of this
0 0 * * * command

# use this
@daily command
```

> crontab -e is user cron
> /etc/crontab is system cron and it is used for system-wide tasks. Also used by Root, System services, Installed packages

- `/etc/crontab`: Main System Crontab and only root can edit it.
- `/etc/cron.d/`: This folder is for applications where they can create their own cron jobs. Instead of editing /etc/crontab directly, apps drop their own file inside /etc/cron.d/.
- `/etc/cron.hourly/`: Every hour
- `/etc/cron.daily/`: Once per day
- `/etc/cron.weekly/`: Once per week
- `/etc/cron.monthly/`: Once per month

> These are run by root only.

- Cron + Anacron work together.
- Cron handles exact time scheduling.
- Anacron ensures missed daily/weekly/monthly jobs are executed.

#### When Should You Care? In cloud servers (AWS EC2, Azure VM):

- If instance is stopped at night to save cost, you NEED anacron-like behavior otherwise backups won’t run.

### Real DevOps Use Cases

- Daily database backups
- Log rotation
- Disk monitoring
- Cleanup old Docker images
- Auto restart services
- Sending reports
