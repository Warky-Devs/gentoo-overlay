EAPI=8

inherit desktop

DESCRIPTION="State-of-the-art slicer app to prepare your 3D models for your 3D printer"
HOMEPAGE="https://ultimaker.com/software/ultimaker-cura"
SRC_URI="https://github.com/Ultimaker/Cura/releases/download/${PV}/UltiMaker-Cura-${PV}-linux-X64.AppImage
	https://github.com/Ultimaker/Cura/raw/main/packaging/icons/cura-icon_256x256.png -> ${PN}.png"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="kde"

DEPEND="kde? ( kde-plasma/xdg-desktop-portal-kde:5 )"
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
  doicon -s 256 ${DISTDIR}/${PN}.png
  cp ${DISTDIR}/UltiMaker-Cura-${PV}-linux-X64.AppImage ${PN} || die
  dobin ${PN}
  make_desktop_entry "${PN}" "UltiMaker Cura" "${PN}" "Graphics;" \
    "MimeType=model/stl;application/vnd.ms-3mfdocument;application/prs.wavefront-obj;image/bmp;image/gif;image/jpeg;image/png;text/x-gcode;application/x-amf;application/x-ply;application/x-ctm;model/vnd.collada+xml;model/gltf-binary;model/gltf+json;model/vnd.collada+xml+zip;"
}

