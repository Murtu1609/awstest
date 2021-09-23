#!/bin/bash
sudo su
amazon-linux-extras install ansible2
ssh-keygen -f /root/.ssh/id_rsa -q -N ""
echo "-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAkcf2ks3jGIjzT5HbTxzdJ0L08zF9/YOmhyb7supzINasjJbN
/QYFawS006SQBYim2A0pK6ubr8vVasUZPPALX/Tf/60Bzx17VjhGx7WhRfA07KUn
W/tr5X6DqIjgYV1R86V6elEqJN5ueBLFV+uOiGimNDJUoqf5H2PHdkIyeGmIfXD/
URGhpt7YmHuiR8HDMTeaqK203FnGPchXB0lkshvv3C2LxV3VL+DgdZbKlYe1VlFl
ebDyFPEBsRW0jLvtB2XQhv6RVVvZj25Z+UcV90GxBSCFgOkDP8SbRecG4lDDZzjR
S7vjtqyifv7HJ2DmVB7Jc0bCHSrL/SDRaERHYwIDAQABAoIBADc7aaJJOydKi9Sz
0EFzEB8V8TRKpg9s16UREf/BcAkbDJjfcf/RTjAzwkcFbEOMeJoWsmiHRh8evScM
sfkygTzDzDJUXAEajGYoQDjeCdIzpfmawQTKhyCWBE/QPCLndms3YOYC5lK9q2D2
y6n55zCrZX0VLJfLyEkqRqH5hqGz1dPIrkllmWBgHH2M0qZsjennxYBPwVkIYS1/
B9RL9Buar/Dj8WlrmzW/rbYV1feHNx25jljiDQrAiGtWwtMqN6d/83RvqadGuapx
ga/+04mWsxYymExjyYu3FMkagS7HMMg/CjssBnuV9tVObUKIeA7rKkb97dxt4CwK
9xOfUFECgYEA46dB7UabeUIho8VmDYymlXqOXOr4pnlnd7c5EV5ewtFfiN4bbo5L
VepD4t8Lfj2Q4YFFPZP4gJUp3buWi+pv6QfulSO4S/x94WXnK0PgFAhLXEmP8xof
U3oOziYVFu/U6UzAqt91AAP6wtM+OagxjPxD2xgEexo9I//AXX/udOUCgYEAo+7s
Qp8NUQ6NRqoed1rWrLq0tk59TXnrlRbbmDBaNEPuflbCbzpxh3xErgRfQL2xL7TK
YGmvjot0DK4Y7Agrsf6FczktVxIixPM+Wbo+KelptvqQEmbUBJvoEXUx8SvTJFJE
/IU+z1RKdYFC8vrJC8a3rcW4DSB1jtA07rxzjqcCgYEAsyWrDsLSlHDDMjKkJaN6
cAUaxOovtCmzj5UC9rUR0zOaf4VxhuW5SSnqND2buMNQIPVufI/WLbG0WYZGaWKa
oIIacQjD/h/7G4XqjbSDQKBqVXyaKA91eWaDAh0b2YnwPYulzpG8a7+19NzxicPf
Anh+GYrj88/pL0wSoEGNcDUCgYAHTnnXSlGEoFppoOF0vma9EiFF0t/A2UNHxNoK
wXTzyWdS2DkYTgmLWV2SR/2a3BmOn8c5XtyFRO/qNMRFmOOhrk9yYEUGEXfdQV4x
D5z/rziYADj1qQGgJvbD+G4+ao6hms0aWDIBeadL73P1cnoNfVDofNyEMUMsF1mU
nm+kFwKBgQDVCMs7mdAUGrTcN+Gb4Rx4m7De4jW85uJgqTwSKQBykMCOdbN+ROgy
+g0PhxmS7umIVtCFeqg+TbqegJXDA4rfwIQj9sIRkqMer45hbjbqwpqv+JqVdOPb
LhMIkBjwF6C6QG7IQPJBdCGno6HqgfC07W95akIpZ6yYvy0/l6p/iQ==
-----END RSA PRIVATE KEY-----">/root/.ssh/id_rsa
mkdir /etc/ansible
echo "[servers]
172.29.3.26">/etc/ansible/hosts
ssh-agent bash
ssh-add /root/.ssh/id_rsa
