# README

## Credentials

```shell
EDITOR="code --wait" bin/rails credentials:edit --environment=production
```

## Fly.io

Running `rails c` in fly.io

```shell
fly ssh console --pty -C "/rails/bin/rails console"
```
