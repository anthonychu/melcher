/*
	Future Imperfect by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

(function ($) {

	skel.breakpoints({
		xlarge: '(max-width: 1680px)',
		large: '(max-width: 1280px)',
		medium: '(max-width: 980px)',
		small: '(max-width: 736px)',
		xsmall: '(max-width: 480px)'
	});

	$(function () {

		var $window = $(window),
			$body = $('body'),
			$menu = $('#menu'),
			$shareMenu = $('#share-menu'),
			$sidebar = $('#sidebar'),
			$main = $('#main');

		// TODO: Fix this, or implement lazy load.
		// Disable animations/transitions until the page has loaded.
		//	$body.addClass('is-loading');

		//	$window.on('load', function() {
		//		window.setTimeout(function() {
		//			$body.removeClass('is-loading');
		//		}, 100);
		//	});

		// Fix: Placeholder polyfill.
		$('form').placeholder();

		// Prioritize "important" elements on medium.
		skel.on('+medium -medium', function () {
			$.prioritize(
				'.important\\28 medium\\29',
				skel.breakpoint('medium').active
			);
		});

		// IE<=9: Reverse order of main and sidebar.
		if (skel.vars.IEVersion <= 9)
			$main.insertAfter($sidebar);

		$menu.appendTo($body);
		$shareMenu.appendTo($body);

		$menu.panel({
			delay: 500,
			hideOnClick: true,
			hideOnEscape: true,
			hideOnSwipe: true,
			resetScroll: true,
			resetForms: true,
			side: 'right',
			target: $body,
			visibleClass: 'is-menu-visible'
		});

		$shareMenu.panel({
			delay: 500,
			hideOnClick: true,
			hideOnEscape: true,
			hideOnSwipe: true,
			resetScroll: true,
			resetForms: true,
			side: 'right',
			target: $body,
			visibleClass: 'is-share-visible'
		});

		// Intro
		var $intro = $('#intro');

		// Move to main on <=large, back to sidebar on >large.
		skel
			.on('+large', function () {
				$intro.prependTo($main);
			})
			.on('-large', function () {
				$intro.prependTo($sidebar);
			});

	});

})(jQuery);

//adding copy to clipboard
(function (document, ClipboardJS) {

	if ((typeof window.orientation !== "undefined") || (navigator.userAgent.indexOf('IEMobile') !== -1)) {
		//do nothing cause its mobile
	}
	else {

		var highlights = document.querySelectorAll('.highlight');
		function addCopy(element) {
			var copy = document.createElement("button");
			copy.className = "copy button is-pulled-right";
			copy.innerHTML = "<i tooltip='copy' class='fa fa-clipboard' aria-hidden='true'></i>"

			var codes = element.querySelectorAll('code');
			var code = codes[codes.length - 1].parentElement;
			code.insertBefore(copy, code.firstChild);
		}

		for (var i = 0, len = highlights.length; i < len; i++) {
			addCopy(highlights[i]);
		}

		new ClipboardJS('.copy', {
			target: function (trigger) {
				return trigger.nextElementSibling;
			}
		});
	}
})(document, ClipboardJS);

(function (document) {

	var showSearch = $('.fa-search'); //the search button in the top right
	var closeSearch = $('.closebtn'); //the close button in the overlay

	var template = $("#search-template").html(); //the mustache.js search result template
	Mustache.tags = ['[[', ']]']; //replacing the {{ }} of mustache with [[ ]] - this interferes with hugo's template language otherwise
	Mustache.parse(template); //parse the template

	//attach a click handler to the search icon
	showSearch.on("click", function () {
		$('#overlay').show(); //show the overlay
		$('html, body').css('overflowY', 'hidden'); //remove the outer scroll bar 
		$('#searchinput').focus(); //focus the input box
	});

	//attach a click handler to the close icon
	closeSearch.on("click", function () {
		$('#overlay').hide(); //hide the overlay
		$('html, body').css('overflowY', 'auto'); //add the outer scroll bar
	});



	var $search_input = $('#searchinput');

	//attach a keyup handler to the search input box
	//delay the search by 500ms
	$search_input.on('keyup', delay(function (event) {
		search();
	}, 500));

	//the delay function I got from
	//https://stackoverflow.com/questions/1909441/how-to-delay-the-keyup-handler-until-the-user-stops-typing
	function delay(callback, ms) {
		var timer = 0;
		return function () {
			var context = this, args = arguments;
			clearTimeout(timer);
			timer = setTimeout(function () {
				callback.apply(context, args);
			}, ms || 0);
		};
	}

	//the actual search function
	function search() {
		//my api key
		var apikey = "291A630E0DAB2D652ECDF845294E793E";

		//get the search query
		var query = $('#searchinput').val();

		//properly encode it for the URL
		var encodedQuery = encodeURIComponent(query);
		var start_time = new Date().getTime();
		$.ajax({
			type: "GET",
			url: "https://melcher.search.windows.net/indexes/blog/docs?api-version=2017-11-11&highlight=title,description,categories,tags&$count=true&$top=10&search=" + encodedQuery + "&api-key=" + apikey,
			dataType: "json",
			success: function (data) {

				//clear the old results
				$(".overlay-results").empty();

				//required for the "no results" template
				data.noResults = !data.value || data.value.length < 1;
				data.count = data.value.length;
				data.total = data["@odata.count"];
				data.time = new Date().getTime() - start_time;

				$.each(data.value, function (index, value) {
					$.each(value["@search.highlights"], function (index2, innerValue) {
						data.value[index][index2] = innerValue;
					});
				});

				//render the search results as html
				var render = Mustache.render(template, data);

				//attach the html
				$(".overlay-results").html(render);
			}
		});
	}
})(document);

(function (window) {
	window.addEventListener("load", function () {
		window.cookieconsent.initialise({
			"palette": {
				"popup": {
					"background": "#929292",
					"text": "#000"
				},
				"button": {
					"background": "#000000",
					"text": "#ffffff"
				}
			},
			"theme": "classic",
			"content": {
				"href": "https://melcher.dev/cookies"
			}
		})
	});
});


(function () {
	'use strict';

	var section = document.querySelectorAll("#content h2, #content h3");
	var sections = {};
	var i = 0;

	Array.prototype.forEach.call(section, function (e) {
		sections[e.id] = e.offsetTop;
	});

	window.onscroll = function () {
		var scrollPosition = document.documentElement.scrollTop || document.body.scrollTop;

		for (i in sections) {
			var elem = document.querySelector('a[href$=' + i + ']');
			if (elem) {
				if (sections[i] <= scrollPosition) {
					elem.setAttribute('class', 'active');
				}
				else {
					elem.setAttribute('class', '');
				}
			}
		}
	};
})();
