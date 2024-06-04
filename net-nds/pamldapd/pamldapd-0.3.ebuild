EAPI=8
inherit go-module
# max 80 chars
DESCRIPTION="Simple LDAP server, uses PAM as backend"
HOMEPAGE="https://github.com/eisin/pamldapd"
SRC_URI="http://ni.4a.si./sijanec/pamldapd/snapshot/pamldapd-${PV}.tar.gz http://splet.4a.si./dir/pamldapd-${PV}-vendor.tar.xz"
# https://wiki.gentoo.org/wiki/Writing_go_Ebuilds

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

# vsi moji programi so nestabilni (:
KEYWORDS="*"

DEPEND="acct-user/pamldapd acct-group/pamldapd"
RDEPEND="${DEPEND}"
BDEPEND=""

# do not use mirrors to download
RESTRICT="mirror"

src_unpack() {
	unpack ${A}
}

src_compile() {
	ego build
}

src_install() {
	keepdir /var/log/pamldapd
	fowners pamldapd:pamldapd /var/log/pamldapd
	fperms 750 /var/log/pamldapd
	newinitd "${FILESDIR}/pamldapd.initd" pamldapd
	dobin pamldapd
	default
}
