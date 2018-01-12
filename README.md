# DavMail for Docker

[Davmail Gateway](http://davmail.sourceforge.net/) in a Docker container

Davmail Version: 4.8.1

## Quickstart

```bash
./start-docker.sh
```
Configure Thunderbird to connect to a server with the following settings:

#### General

|Field|Value|
|------|----------------|
|Email address|Exchange email address|
| Password | Exchange password|

#### Incoming

|Field|Value|
|-----|-----|
|Protocol|IMAP|
|Server hostname|exchange-gateway.local|
|Port|1143|
|SSL|None|
|Authentication|Normal password|
|Username|Exchange email address|

#### Outgoing

|Field|Value|
|-----|-----|
|Protocol|SMTP|
|Server hostname|exchange-gateway.local|
|Port|1025|
|SSL|None|
|Authentication|Normal password|
|Username|Exchange email address|
