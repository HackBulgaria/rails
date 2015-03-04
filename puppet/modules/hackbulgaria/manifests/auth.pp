class hackbulgaria::auth {
  Ssh_authorized_key {
    user    => 'hack',
    type    => 'ssh-rsa',
    require => User['hack']
  }

  # The best security, ever! Just let us authorize with public keys and don't
  # carry about passwords. Hack shouldn't be able to sudo. We can root, if we
  # have too.
  ssh_authorized_key {
    'genadi':    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDr+JLXkVhOKfa1UBTmZBY6YDvtRNFtSaWjvRKicAMyaQkgsPGAEyRwXmduzU5YbBAJ5uLfQw+zWy2f6Mm+1XakkBI53o/KNdkYa0KuDYxXhXL5/oR8s76mSjhtJMvCnMXnjP1azukNNrldHVh+y5vDnXBGckfKvI9aI/ZTo6Lt4IjesoyTQEi8ArDXdt2AAcmz6cl7EipYqFSwepnG0VnkT8ZWOcWF/M1tyHdt18cdzQjbg8VnFJuLmdH+Ly7HfurpraZ89zCsIGygKOKA5OvlI7ThkGx5cRs2+Jm3+wB+cwpsifXQs2896Z4ctDy23SFGghgKz57sZ7w8v06Tb1gB';
    'radorado':  key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1nVKo3wp8xy30UAuyeJt85m5X6ShU9DIXW2A6DxKdbpKC3JPMV/SU00PmiUqBiNCUOIqpfN+5z3nhz69w1HvjRYQKnz3tXBCwzCyxq477yYMuFYDhcl7hOw3sAvJ4foQ9jlnxTnR5GrVGa7AhyfoULBBd5RI0HpGAne61hc3fnyjVY8pVsLMUOo7Xr2vYqbgy0y8pTh+qvd9cR6Umo1emaQmlSykqE54bTdHQLnY2SMzUXO0obYdlxla3KSUMQaFOksQXTfMLi/2Zj0ziMRtkmxh/Z6tcdc2GW6koeQYOzsr1kW1+9540O15mcwVaT4+bfMegzgQZsu9w2sy5zrzp';
    'ivaylo':    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDfJ6W45X62Ehescw6t0ug07/cGKd/vs+HE8GTJxf20kHnhQMIG2q19JkPKCek7sYhAH55+lR+P9MxPeexk75e7jSqq+YigUKMxa3ObqaSuPyoJnCqHKejsb14oxk+CLxgp9Dl7acGXmcKvd4hAKA9I0q1TaUy46aD0wQJaLuBDZwgCd9n+XPkrkVQH7MY6/vMAKaQu0KwnToVBjLxfJgQli2OWXFKepaCZQL2HD9w3ymKrxAoj8x5bMPlYr+WbFDQtl7M3rYWyaGyYLQkLIW2qOD7QtXHjFnMNYSWxTbRb8d8opBwRqIgYODb0OI8YYLwBwTJCcXPj9oNP/U2Raujb';
    'stanislav': key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCql2NR+QiLnwVo8thSotEjKVoqPqBLV+VT4WCU/pRwP23KMbu1OWk5UM7uW5jbHBQeLM+VSPqqXwX++Fix/PjxdFMArqC1WR+Jqw4VcKSVSDPvSDbNYzUOwELuSgWWCSc/ZCH9roV6XE7PPhWsEt+aGldNsE6MFHUVQ0LdMgys7xAJgfTJoV1kIcFF9rSQNb5TAQdID02S9LUMfnkThNoBMOz2OQZl5YX1FLof28qAjCACJIBKWFzv4aohAP+Byl7xkLZxiN2IauuctskKVVFw1RQXAtRvWdSc6hqVQ+XaXN65ki3qXUUBpdgM/h1hT7pWWfyh5pB9F6k4mT+OeRF1';
  }
}
