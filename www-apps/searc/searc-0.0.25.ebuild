EAPI=8

# max 80 chars
DESCRIPTION="scraper for search results of popular engines, caches them and creates a HTML UI"
HOMEPAGE="http://ni.sijanec.eu./sijanec/sear.c"
SRC_URI="http://ni.sijanec.eu./sijanec/sear.c/snapshot/sear.c-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
IUSE="oldstorage logmem"

# vsi moji programi so nestabilni (:
KEYWORDS="*"

DEPEND="dev-libs/libxml2 net-libs/libmicrohttpd acct-user/searc acct-group/searc"
RDEPEND="${DEPEND}"
BDEPEND=""

# do not use mirrors to download
RESTRICT="mirror"

src_unpack() {
	unpack ${A}
	mv sear.c searc-${PV}
}

src_compile() {
	use oldstorage && append-flags "-DSC_OLD_STORAGE"
	use logmem && append-flags "-DSC_LOGMEM"
	emake
}
