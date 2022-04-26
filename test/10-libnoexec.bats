#!/usr/bin/env bats

@test "libnoexec: no exec(3)" {
  run env LD_PRELOAD=./libnoexec.so echo ok
  cat << EOF
--- output
$output
--- expected
ok
EOF

  [ "$status" -eq 0 ]
  [ $output = "ok" ]
}

@test "libnoexec: attempt to use exec(3)" {
  run env LD_PRELOAD=./libnoexec.so sh -c "ls"
  cat << EOF
--- output
$output
---
EOF

  [ "$status" -ne 0 ]
}
