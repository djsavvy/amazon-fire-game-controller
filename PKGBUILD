# Maintainer: Savvy Raghuvanshi <sraghuvanshi at college dot harvard dot edu>

pkgname=amazon-fire-game-controller
pkgver=7.db555eb
pkgrel=1
pkgdesc="Connect your Amazon Fire Game Controller as an Xbox Controller for use with Steam games."
arch=('any')
url="https://github.com/djsavvy/amazon-fire-game-controller"
license=('GPL3')
depends=('xboxdrv' 'bluez' 'bluez-utils' 'bluez-plugins')
makedepends=('git')
source=("git://github.com/djsavvy/amazon-fire-game-controller")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "$(git rev-list --count HEAD).$(git describe --always)" | sed -e 's/-/_/g'
}


package() {
    cd "$pkgname"
    install -Dm755 "$srcdir/../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/../amazon.conf" "$pkgdir/usr/bin/$pkgname"
}
