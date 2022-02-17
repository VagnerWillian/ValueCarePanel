'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "b8a3a237b187374ee8d9c333442b8209",
"assets/assets/anims/loading.flr": "51eb608bfe80ffe1b004dfc551fbae77",
"assets/assets/images/classifications/Emerg%25C3%25AAncia.svg": "94f70ace313b2fb3e46b17b9089bbebf",
"assets/assets/images/classifications/N%25C3%25A3o%2520Urgente.svg": "9f9f87bd99fe7552ab2c4604f3fbc0e2",
"assets/assets/images/classifications/Pendente.svg": "01856a4a6f2de4a9ce57f254759a5a99",
"assets/assets/images/classifications/Pouco%2520Urgente.svg": "dee8a3be4a81c094a78831ef16199201",
"assets/assets/images/classifications/Urgente.svg": "061625a9f78aa965281618478700fa94",
"assets/assets/images/logo.png": "0f6dd5b58e4ba559e595b285e2a2ed04",
"assets/assets/images/logo_h.png": "1b7e76cca8db92b6a3144238eb18824e",
"assets/assets/images/menu/agendamento.svg": "6b19e4294905157def86fa09d97ada8d",
"assets/assets/images/menu/analytics.svg": "750cf9decedc39ef1c8977a0ff76fa72",
"assets/assets/images/menu/configuracoes.svg": "4c20c4cb94a9beef7aed4b5f57d8e868",
"assets/assets/images/menu/drawer.svg": "2f47e9270f699b4702f827bd6202d055",
"assets/assets/images/menu/inicio.svg": "b649287de8e1a14cbc6479236beee5b7",
"assets/assets/images/menu/monitoramento.svg": "55187ecc028312f0b87ec7f74faad9ee",
"assets/assets/images/menu/notificacoes.svg": "4963527ef314e2da6a91e7738aba1f94",
"assets/assets/images/menu/pacientes.svg": "f103bae3fa85d6a590056fead093b578",
"assets/assets/images/menu/usuarios.svg": "15b855cb8b2f3d2127b4aca8bcba8da3",
"assets/assets/images/others/background.png": "5fe8b4dc9bdda58a85297976e24f6086",
"assets/assets/images/others/background_card.png": "a3e06c0ac7f46db2d90f34356897ff9f",
"assets/assets/images/others/drag.svg": "85802f43ec2044dea7804124410bba4c",
"assets/assets/images/photos/user_1.jpg": "846321f4860d36f8762cf8a92f2f7136",
"assets/assets/images/photos/user_2.jpg": "53de29550d5e45033ebd76248b1e4c12",
"assets/assets/images/photos/user_3.jpg": "ea3b997facd43507e98b65dce3a3c6ad",
"assets/assets/images/photos/user_4.jpg": "d767fe4fe05bb2724828ae5381d8c8eb",
"assets/assets/images/symptoms/0.svg": "a73974031639cf5df4e601d2f855d113",
"assets/assets/images/symptoms/1.svg": "88ae37fa0a919a46a9cd5a5560fbd823",
"assets/assets/images/symptoms/10.svg": "c89ec47f4afb01b089f44eefa98d4a63",
"assets/assets/images/symptoms/11.svg": "02a5a88261238dbcfa7f751d5cbdd421",
"assets/assets/images/symptoms/12.svg": "335b7b8c8c29b6dd12edd669662724f8",
"assets/assets/images/symptoms/13.svg": "b1e3b084b282c962e29f0f10948b599b",
"assets/assets/images/symptoms/14.svg": "bc08112a701dda772b6a44e4e88d1697",
"assets/assets/images/symptoms/15.svg": "85af72aca7435dffd8a12fc053d0b2dd",
"assets/assets/images/symptoms/16.svg": "dc580765728390930a1f1fd20b1112d3",
"assets/assets/images/symptoms/17.svg": "bdea278958c8eeab4b0fb6b1aae6557d",
"assets/assets/images/symptoms/18.svg": "a4489e83f1f8ec8946b2f208d258e1c0",
"assets/assets/images/symptoms/2.svg": "c458c619a0138caa4bb010bce466716e",
"assets/assets/images/symptoms/3.svg": "044ef85027899504f32673849a7b87cb",
"assets/assets/images/symptoms/4.svg": "7c889c80024b5abb684a771d9d8d35e5",
"assets/assets/images/symptoms/5.svg": "863593f427c78b5a5c9451cfd7d5061a",
"assets/assets/images/symptoms/6.svg": "da97f41a701ffd0a9352e066ace5b7c2",
"assets/assets/images/symptoms/7.svg": "8643a46eec1e8791121f84d53a99db03",
"assets/assets/images/symptoms/8.svg": "2e1ec0611f551ed950af43be2a8e28ba",
"assets/assets/images/symptoms/9.svg": "45affba7be70a724c65aaf0cf73f948e",
"assets/assets/static_jsons/monitoring_today.json": "59805d7822e3c16dbd460b45359f01e7",
"assets/assets/static_jsons/report_doc.json": "947498c807fd11f4e3eddc7414daa7e2",
"assets/assets/static_jsons/scheduling_today.json": "9c8ef54612ffb34052865b5bdfe10520",
"assets/FontManifest.json": "851407e608ebe7473c0ff3a0a45a91b7",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "da8a799bbd3aa0e927fd13f1cec04893",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"assets/packages/modern_form_line_awesome_icons/assets/fonts/icon_font.ttf": "4d42f5f0c62a8f51e876c14575354a6e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d3e08be2eb260310f6a7d7d728a9e367",
"/": "d3e08be2eb260310f6a7d7d728a9e367",
"main.dart.js": "5cc39948260217feaae0a1b12c2bfbd7",
"manifest.json": "a6bf733c5ff7cd5775faad23095ee26a",
"version.json": "03f5412e45d2df3d844a7cbea420b6f4"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
