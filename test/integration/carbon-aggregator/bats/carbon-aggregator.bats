#!/usr/bin/env bats

@test "carbon-aggregator should be running" {
  ps aux | grep carbon-aggregator\.p[y]
}

@test "carbon-aggregator should be listening on port 2023" {
  pid="$(ps aux | grep carbon-aggregator\.p[y] | awk '{print $2}' | head -1)"
  lsof -Pna -itcp:2023 -sTCP:LISTEN -p$pid 2> /dev/null
}

