EAPI=8

inherit acct-user
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( pamldapd )

DESCRIPTION="User for net-nds/pamldapd"

acct-user_add_deps
