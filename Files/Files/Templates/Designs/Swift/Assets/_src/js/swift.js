import * as bootstrap from 'bootstrap';
import { Sliders } from './_sliders';
import { Favorites } from './_favorites';
import { Cart } from './_cart';
import { Scroll } from './_scroll';
import { ProductList } from './_productlist';
import { PageUpdater } from './_pageupdater';
import { LocationsMap } from './_locationsmap';
import { Places } from './_places';
import { VariantSelector } from './_variantselector';
import { Video } from './_video';
import { Typeahead } from './_typeahead';
import { AssetLoader } from './_assetLoader';
import { LiveProductInfo } from './_live-product-info';

//Bootstrap
window.bootstrap = bootstrap;

//Swift modules
const swift = function () {
	return {
		Cart: Cart,
		Sliders: Sliders,
		Favorites: Favorites,
		Scroll: Scroll,
		ProductList: ProductList,
		PageUpdater: PageUpdater,
		LocationsMap: LocationsMap,
		Places: Places,
		VariantSelector: VariantSelector,
		Typeahead: Typeahead,
		Video: Video,
		AssetLoader: AssetLoader,
		LiveProductInfo: LiveProductInfo
	}
}();
export { swift };

window.swift = swift;

//Popstate
window.onpopstate = function (event) {
	swift.Typeahead.navigateToPage(document.location.href);
};
