EAPI=8
inherit go-module
# max 80 chars
DESCRIPTION="Simple LDAP server, uses PAM as backend"
HOMEPAGE="https://github.com/eisin/pamldapd"
SRC_URI="https://github.com/eisin/pamldapd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz http://splet.sijanec.eu./dir/pamldapd-0.2-vendor.tar.xz"

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
	dobin pamldapd
	default
}
