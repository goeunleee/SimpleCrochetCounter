'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".dart_tool/package_config.json": "8de502f53912a234a5d1360b870ed2ce",
".dart_tool/package_config_subset": "e32388653a904700c4171093e10ccc71",
".dart_tool/version": "4fbe56a1e692c4eb026a83a581b47de1",
".git/COMMIT_EDITMSG": "73db3559e31d8d274d9d7626958afc96",
".git/config": "4683b5c2a5f8a247acfcea787bd67c9e",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "1824bf7947e45bb563a223958726d4e1",
".git/HEAD": "d2bc14bd97b0ae100a3db7bcf9b75dfc",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "33ba5523be166c60c2ea28aa12e4b6ae",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "d31ac2486b7124ab7fe681596d104595",
".git/logs/refs/heads/main": "742bec7b617418af4bb3ee9433a917bc",
".git/logs/refs/heads/master": "aee43b416c81c34c5b6d85eb6a108f86",
".git/logs/refs/heads/upload": "98e85e62137ce0d2e290eb2c2cb3d50f",
".git/logs/refs/remotes/origin/main": "4ec8594ad1a52de01cdd22b0c89975e2",
".git/logs/refs/remotes/origin/master": "ff26e39dbb6b7833c5c7ad3af2cebf35",
".git/logs/refs/remotes/origin/upload": "6fa0c4203955c4345fc3371cc26715b0",
".git/objects/03/a5627030bd4d0b146b62e4eaa1d4b801c49ccc": "0f538a687934a84b811eff16399233a1",
".git/objects/04/e5efc15dc0c60ea2ffcc37c5bf25e96689f44d": "978222f47488835b92838c74cb5c684c",
".git/objects/05/62e8e9a539399292aa1042ff56a3cf95613715": "e37557f86ebdd0ef4847b8810065866e",
".git/objects/06/1329827d6cd3c8b251ba9001b72407d0d506af": "6d67d2ff0660535f9701211194c6cb21",
".git/objects/06/19413452dfbfb35eee8ed8abb22975b5ae1955": "e15b52b4378448095a5fdd0ca70b3b17",
".git/objects/07/f7cecf5e46b0e2903feca51ed5ab39aab23dc2": "9e118944910bb2b0d542b07566b1ad41",
".git/objects/09/4957677046c9e2b83357241f1a8754f5f82703": "326c04d9e68549ab51e6854fb557f5ef",
".git/objects/0a/257a7f0a0082a499f33275f291ab166269112f": "9dd1c2ae03a702e528a0396feb70e52b",
".git/objects/0c/b6121b4329d06fd6042cb4defe1d350739698f": "5a7391270262e48818da93a210e04d05",
".git/objects/0d/846c8d4e47a645a373889c8b2c499152924140": "7f8f3bbf2e35701a64b33210abfe6443",
".git/objects/0e/021444042a6cf51dd0667d702da2ca624e0e69": "03e27ddcd5844a5643599ea4c29c3ba7",
".git/objects/0e/e3590f4d74c3a4e4621a8d048d01f13436ec7a": "25939fd9f3cb53628d90cf3f4f9a026a",
".git/objects/18/d1d98768083b737c308abe6f0526f1883391b6": "703ead40dcea8031fe71341007ff96c2",
".git/objects/1a/037901546a3f5e97b6752154f757f3d5ed0011": "c01a7806d33b68b2203f32e202354973",
".git/objects/1a/1ba8bc676599e9c9ef00917f64137d910f18c9": "c1a775f8f88daf92ca0209fce9c3638d",
".git/objects/1a/cf28c1ef34bc19ab6205faaf54298d35d8bbaf": "63a32fe66a5758a06248d88c83530b42",
".git/objects/1b/c7854e85e7425ff39154278be5dc2b14b9d812": "a93c5555de49f92555e2bc7fc45c793b",
".git/objects/1f/b7c1d59ef1471cc3f141b8e0523857d0903f21": "328570a45baee393d8723e3d02a3d628",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/20/f1986609b11913e058d85bc3c8a240d81481c2": "f02a8cf03917ec495a8740291617eb9d",
".git/objects/21/e2aa36edb8c5647c2aafcb4b5fd1ea384635b5": "38c872d24efc1687e7286ab4c52cce40",
".git/objects/23/8f84f963346bb08d17cac7db90877947f7de15": "d6b8eaa30e8165a786050a1a191b4714",
".git/objects/28/23cb0cc16aa14298396d436a61dba7809af739": "770267a2cf4d4aa44352156501b86dd0",
".git/objects/2b/e39c7fd3da441ddac9bea54fd12621dd39960a": "24031b20667d22ca8dba4debe8b9eab5",
".git/objects/2f/5cfe6c8dfdee21ed9ec03c52925cfb3cacd76e": "6b676c1f2ad30c0dfd180c13e3e8348a",
".git/objects/30/aca1f985d91ba40ddd7fc10b84d654e01c7d17": "e771cf9290588a50d1846883435e5ed8",
".git/objects/30/af74fef94d9aeccae4f0141c39cf4be36b02d8": "f6776d6f82a6562d6afc561b78c8b273",
".git/objects/31/aae4d7da4593d9f15baf0603340390598cd1d8": "eefb6e10c4dd444dab67ca40323a948b",
".git/objects/32/11a34f69d339308417ba46a10aec5528facaa0": "ce422466570918c14189efc539e1659c",
".git/objects/34/15b5d4f73386b6604dfda534c8933194b11cd7": "79f2ff088746c9cd08bb8cd864ac939e",
".git/objects/36/be691cfbbb92c3f7ccd99829958de16e2a60ad": "cd0b04c12979e73d4791886b813137ef",
".git/objects/37/884481632c609ade96a714acca171d35c54ea4": "ba489de4de53a0d69250b8495bd60a15",
".git/objects/3a/7795ce82e55d8f9c99e7beaa0c85141f8d2835": "8a5558c663d87709cb2353c1b35642f0",
".git/objects/3d/76b7f83b462f3bf2777c0e2d15e66d38659ddc": "dde69ff2be5a906dd57f2295bccfa2e0",
".git/objects/3e/a6758fbc9ad9c55574d4630114f725dab7350a": "a66d426297e89024e68aa802168db64e",
".git/objects/41/93ed8a5c716e9cdcc41768345e2ba11f6c8a18": "3b06248a70215f20203f74ffba4d8d86",
".git/objects/43/e946e398d96aee466fa0aabb625f0889c3a4bd": "ac34520dee747f675e6e0a15c0bbd2be",
".git/objects/45/5620c62f20553f0a4e8820efa1eb1c3a3a7e61": "96835c22bb7f5ecc058637b06e2ce455",
".git/objects/45/d51cfc8be4e454392cb645fb3ae2970c76619c": "1db45341e7d81ea2bfde35f039487356",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/48/33fcf9ba677d3df448c90e63368e50f8bfc8d6": "a5b926fccf641f8e2a09e52478c0d37a",
".git/objects/4a/65bbd709fea94e9249795850043592279e4f00": "7395aef37328438dcf58600e4b06d63b",
".git/objects/4b/f6275ead6cf51071ca9de8cd69665590a499a3": "179153592570d6748a9df2dfd31e601c",
".git/objects/4d/a171df756b24c4eaf7a65beecd8754e6e1560f": "f55048821bc23c3088eaccb1934214b7",
".git/objects/4f/d0e51f345ee398d4c56c9a2a36514cfdc54f3e": "d8e976b7b97437231f01681fc40815a3",
".git/objects/51/30133169a1878d7849559186b1b20ea6a3e592": "966cf9313f28b8ccdb4b133466962820",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "970aec5149a3dbe9370a9dc982cdd022",
".git/objects/5b/12338ffa52c62ffb9d1efde57a8ca8531a0607": "e8b81ecb1f0457de14e395c904b854ef",
".git/objects/5b/33c6bf52bb9af54d886207ca012e4c5bb91062": "531810eac448bee61dda0824f9c1766b",
".git/objects/63/ed6ffec1c69144dcb0d60f1b8ae57e823dec8d": "4d7b1c8b7695b7edc0dce0bb73e00d54",
".git/objects/6b/0e63dfe232f2d67fd98b3407ab465a37097b0c": "aec6fbd67157545053a214937fef5c59",
".git/objects/6d/b3380e00d1554d24b40b18a5ad583eb2badeaa": "d74b85dc0c6a8c9355757bf24ca8b682",
".git/objects/74/ccb2b30d2c1bdd944c279bbbc9e94992c45811": "e8c78c26f004487d677d955371a20e67",
".git/objects/84/991948d74abb24f97631f711c568f58cb77773": "c937ae065931e0b0daea583973e28f1a",
".git/objects/88/572295021b1abcf0feb9d36fb93396e38bc87e": "b720fe06305f724358772945c30df6f5",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/0aef978010ed95f003e4233aa25235c340a3f0": "f76bd4d0bd4f90a21ad1d0ab53a068f6",
".git/objects/8a/07816f905ede1b714227a5cb1ed231c4bc7782": "fd9c218748dc1aa12aa8a3aeec6b59ec",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/96305f584c8265edb13105c01ce26d618f68c7": "18200246ede936a6210387e2830322bf",
".git/objects/8d/6c44b4d456c5a33c9e4e74fd7fbe05c0a679b5": "95568a280d987d866c695cf60377fcf0",
".git/objects/8e/a1b58816bd9e31c01b85a106984969ade5fb83": "861aa2f7dcccc09e5b2563c7570d9e53",
".git/objects/8f/1df82c3241bb0c9a7d6c6fe1d9e4805178a042": "2752ec0914bf31970f474f48d3b8f822",
".git/objects/91/724b675f0dae27afbb2abbb6d0419ceaf6abe7": "dc8c8cb4cd3963c2bc8ecb9e03c35451",
".git/objects/94/b52e13bf7919ae4ea7235d78019b592dde8611": "b79fa5ca1cdbf72f253763797850f314",
".git/objects/9a/dad3817699b545ba0aad6fa881ce8307944983": "82df1151a80ea1580439c45dc57864d7",
".git/objects/9d/3721fe04c325c791d976d4d81edbe0871f2345": "438135c4f8c35313a68eef11ded66754",
".git/objects/a2/2b08e786b4887e46dc2814c9036b6d5d556f52": "072f20655c49df2e9982b401719bcaa2",
".git/objects/a8/fa5fb7c8e0232630b66adcad261d1672e825ba": "18a4d700f0b456bf074791187d539ba4",
".git/objects/b1/6d2c4e0aea091d5b2e91ee1fd8923f1dfa823d": "f7541e489312c8eb42c6f7b23c765b5b",
".git/objects/b2/5dc583ace245ad3411160c044a98beded90949": "9cf9c3ed3ad364ac71e75e71b1754a87",
".git/objects/b3/3819935179f94aac67ab19a9071348a81b620c": "0f91ce155cf7be20d5288d86cfa9a668",
".git/objects/b3/4b9cd019a2b3994a38ea7113dc34ec5fa1fe66": "2d8a856a191f22fa38db7c8c53cb70cc",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/8cb00dd5231f1a55de0205c16445926a696526": "be8592f9341c9b01b70890c8614c6cf7",
".git/objects/bb/3085876799532613a08c7ebe43f24f0cc46864": "1b6aa21800d948d5513c15e54d131215",
".git/objects/be/a55985ed61a67609e2570cf6f430d1f10f0d31": "55873290af59972bad0e50d789ecc1b7",
".git/objects/bf/0578e76c3af36922ed00e0c8bcce569ab1a187": "3c7f6067113fdd9c30e7e7dc293ac8e9",
".git/objects/c6/8568fad2178061577cf86e89f9983a3ef2d86e": "4f14ee2d44b6a1968a8d2ccbb26f08e0",
".git/objects/ca/125c35f6a07150c7526e73301217a744394c8f": "9b5e79389baffcb99d40ef0dc6992d18",
".git/objects/cc/75fbc62d05c06677645e586b9ef6c79f09e87c": "9653ee60485792c6cb18becba49145a5",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "d7280a766a5d6033f187d874a92b5ad6",
".git/objects/dc/971eccfd8705d9492cb64db90b5d605b740d64": "c19eb898bd8390d082630d2c2053aa59",
".git/objects/de/efa20a7a9035567df6cfcee0859ab8816741ad": "c07e92f654c6787cffab4091226ae960",
".git/objects/df/7d2dcb89ab89da87467c0e1059b38c8d8f9296": "a44162ff357b024e4638ab18a9bb01c7",
".git/objects/e1/03758ad8261ac153444d88b4ebab8569f70d73": "a8f18b6d7f9e0957c4b1ff642764d744",
".git/objects/e1/b64e5fa2969b6002df3934164f106d2739b7aa": "7b3b59f8522a73a49e62b05c87b6fbaa",
".git/objects/e5/46bce50bae498334384dfac2897eeeb4106983": "3ca7c5675e6394af885bee549ab1f64e",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "2933b2b2ca80c66b96cf80cd73d4cd16",
".git/objects/e6/f4cf184665b0022c5c7af09912994db73e979a": "e14d7aa15c75f87c711147ebd5738ede",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ef/6c363e356048a6c719fa0bedf9b00002cf4fd2": "91425e9bdcc29a664c7e87f55bf9d074",
".git/objects/f3/012dc2f7058387120d035a49f011a8fb65b841": "0eefaaf38d8bc983fea61a4e378c38bf",
".git/objects/f4/d825dab09d74df5a566b1156a90bee503d74db": "5a2893ed6ea36e79c439320c7e4c3c94",
".git/objects/fd/914a733c5d2c03abfae85db9259e911cf11eb3": "870ac0bd55b5584ae8bf55b27bdcd065",
".git/objects/ff/7cd2bd277c8994ec7eb7ac204cdb327492b210": "57be85fee8b0b9c6d2f32e10ddf06746",
".git/objects/ff/d1397075defad424a359d8debce246e720438a": "da80cc844f6c490b3b42310506038a64",
".git/objects/pack/pack-8a9880baab91dc9bf06ed64ce7dad1cd327d1e7f.idx": "69b5be9555b2e666959d2ff9ff7113e1",
".git/objects/pack/pack-8a9880baab91dc9bf06ed64ce7dad1cd327d1e7f.pack": "671b5e18f1a9771bfebed7b30ba54256",
".git/objects/pack/pack-ccf9752a1ef63539f9370ba56c043b4ffb2bc67b.idx": "9f3d17d55c59ab0ae6b2bf297d59249e",
".git/objects/pack/pack-ccf9752a1ef63539f9370ba56c043b4ffb2bc67b.pack": "27e62ad2a7df32fb2c088a90347d4675",
".git/ORIG_HEAD": "8db013d174704fc14708f5b88bea9df0",
".git/refs/heads/main": "d4c2e09ed65d342bf82452c26a5d07a9",
".git/refs/heads/master": "c27958c79f3e5be7971e7ee7b6155c63",
".git/refs/heads/upload": "b7aa73f1a943075794632e0580476b33",
".git/refs/remotes/origin/main": "d4c2e09ed65d342bf82452c26a5d07a9",
".git/refs/remotes/origin/master": "92904883cf4ce25ff594a598e56f23de",
".git/refs/remotes/origin/upload": "b7aa73f1a943075794632e0580476b33",
".github/workflows/publish.yml": "0f33e35fd8eac4d7a7221d701192aba1",
"analysis_options.yaml": "9e65f4b9beebb674c0dc252f70a5c177",
"android/app/build.gradle": "b7324f50dd8e83e2f2d860395e34beaa",
"android/app/src/debug/AndroidManifest.xml": "820c45a25b424dd5b7388330f7548d1f",
"android/app/src/main/AndroidManifest.xml": "18c14fb9882cf8039c94bd651ac426f1",
"android/app/src/main/kotlin/com/example/crochet_counter/MainActivity.kt": "415ac60731782290a81c5b20dd4f25ef",
"android/app/src/main/res/drawable/launch_background.xml": "12c379b886cbd7e72cfee6060a0947d4",
"android/app/src/main/res/drawable-v21/launch_background.xml": "bff4b9cd8e98754261159601bd94abd3",
"android/app/src/main/res/mipmap-hdpi/ic_launcher.png": "13e9c72ec37fac220397aa819fa1ef2d",
"android/app/src/main/res/mipmap-mdpi/ic_launcher.png": "6270344430679711b81476e29878caa7",
"android/app/src/main/res/mipmap-xhdpi/ic_launcher.png": "a0a8db5985280b3679d99a820ae2db79",
"android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png": "afe1b655b9f32da22f9a4301bb8e6ba8",
"android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png": "57838d52c318faff743130c3fcfae0c6",
"android/app/src/main/res/values/styles.xml": "f8b8cfbf977690d117f4dade5d27a789",
"android/app/src/main/res/values-night/styles.xml": "c22fb29c307f2a6ae4317b3a5e577688",
"android/app/src/profile/AndroidManifest.xml": "820c45a25b424dd5b7388330f7548d1f",
"android/build.gradle": "b909296dc47a058a5449609bf5a1887a",
"android/gradle/wrapper/gradle-wrapper.properties": "1868e63ebbc541e5bbb09fa921ef2349",
"android/gradle.properties": "25ea75fb6eca6e1362de4085a52623c0",
"android/settings.gradle": "843056e0a689963bee374a89f2bcff58",
"assets/AssetManifest.bin": "2e62000e874946b8fd3cc281c37ba737",
"assets/AssetManifest.bin.json": "a3a2ea950a48baf58cbcec5fbc6590f1",
"assets/AssetManifest.json": "6b542930fe9659e252beb1b5c432396d",
"assets/assets/images/sign.png": "f8c53ef76d5bff8104e288e0658c0d35",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "76134792c08be9a2892f73ebaaf22a77",
"assets/images/sign.png": "f8c53ef76d5bff8104e288e0658c0d35",
"assets/NOTICES": "ea145162e73564edc2cb08c1686d98e5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b5bdd0986d7aff5dfc409dc0fd217f50",
"/": "4ba92cc5776d933a5e65225d635c8c31",
"ios/Flutter/AppFrameworkInfo.plist": "d82fc62dcd081e420f43e71a31460b73",
"ios/Flutter/Debug.xcconfig": "e2f44c1946b223a1ce15cefc6ba9ad67",
"ios/Flutter/Release.xcconfig": "e2f44c1946b223a1ce15cefc6ba9ad67",
"ios/Runner/AppDelegate.swift": "b431e1eaead2cfc3718b75ba2c5f45aa",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json": "31a08e429403e265cabfb31b3d65f049",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png": "c785f8932297af4acd5f5ccb7630f01c",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png": "a2f8558fb1d42514111fbbb19fb67314",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png": "2247a840b6ee72b8a069208af170e5b1",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png": "1b3b1538136316263c7092951e923e9d",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png": "be8887071dd7ec39cb754d236aa9584f",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png": "043119ef4faa026ff82bd03f241e5338",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png": "2b1452c4c1bda6177b4fbbb832df217f",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png": "2247a840b6ee72b8a069208af170e5b1",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png": "8245359312aea1b0d2412f79a07b0ca5",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png": "5b3c0902200ce596e9848f22e1f0fe0e",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png": "5b3c0902200ce596e9848f22e1f0fe0e",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png": "e419d22a37bc40ba185aca1acb6d4ac6",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png": "36c0d7a7132bdde18898ffdfcfcdc4d2",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png": "643842917530acf4c5159ae851b0baf2",
"ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png": "665cb5e3c5729da6d639d26eff47a503",
"ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json": "b9e927ac17345f2d5f052fe68a3487f9",
"ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage.png": "978c1bee49d7ad5fc1a4d81099b13e18",
"ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@2x.png": "978c1bee49d7ad5fc1a4d81099b13e18",
"ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@3x.png": "978c1bee49d7ad5fc1a4d81099b13e18",
"ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md": "f7ee1b402881509d197f34963e569927",
"ios/Runner/Base.lproj/LaunchScreen.storyboard": "b428258a72232cdd2cc04136ec23e656",
"ios/Runner/Base.lproj/Main.storyboard": "2b4e6b099f6729340a5ecc272c06cff7",
"ios/Runner/Info.plist": "75490e88c04900d96c9f8893448869e8",
"ios/Runner/Runner-Bridging-Header.h": "7ad7b5cea096132de13ba526b2b9efbe",
"ios/Runner.xcodeproj/project.pbxproj": "a7b7710c16fabf1c0b5a00ca23fe786e",
"ios/Runner.xcodeproj/project.xcworkspace/contents.xcworkspacedata": "77d69f353bbf342ad71a24f69ec331ff",
"ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist": "7e8ed88ea03cf8357fe1c73ae979f345",
"ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings": "ecb41062214c654f65e47faa71e6b52e",
"ios/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme": "b806e02365fdff1ad43ff7acc0e41c9f",
"ios/Runner.xcworkspace/contents.xcworkspacedata": "ac9a90958f80f9cc1d0d5301144fb629",
"ios/Runner.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist": "7e8ed88ea03cf8357fe1c73ae979f345",
"ios/Runner.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings": "ecb41062214c654f65e47faa71e6b52e",
"ios/RunnerTests/RunnerTests.swift": "24e5d095048eb86c30423f4e04b6e57b",
"lib/main.dart": "f5b79ffb04e4e270310a02333390089f",
"lib/Roulette.dart": "f8093a9ec8e22b71acb4e4ff7f05bc1b",
"linux/CMakeLists.txt": "200a8ffed9a6c44f994fb47387f60b58",
"linux/flutter/CMakeLists.txt": "2195470ce31675d31db5a37590d011f6",
"linux/flutter/generated_plugins.cmake": "0e7b650ffba74743a265fc46c77c9919",
"linux/flutter/generated_plugin_registrant.cc": "afeb71bbe3a6f0d0a247d3cc97943d69",
"linux/flutter/generated_plugin_registrant.h": "0208db974972d7b29a0ac368be83644b",
"linux/main.cc": "539395bcd63dba20afed0838d136189f",
"linux/my_application.cc": "3f26c0664fb990ad88e9006a47c03cbf",
"linux/my_application.h": "f6b37d58752c8671078b6f660e33e8c1",
"macos/Flutter/Flutter-Debug.xcconfig": "f6991d7432e1664af118cc9531127016",
"macos/Flutter/Flutter-Release.xcconfig": "f6991d7432e1664af118cc9531127016",
"macos/Flutter/GeneratedPluginRegistrant.swift": "b59955bbfc76a1173c4cbca3606e179a",
"macos/Runner/AppDelegate.swift": "f35757566ef1832592cec47b89197f94",
"macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_1024.png": "c9becc9105f8cabce934d20c7bfb6aac",
"macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_128.png": "3ded30823804caaa5ccc944067c54a36",
"macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_16.png": "8bf511604bc6ed0a6aeb380c5113fdcf",
"macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_256.png": "dfe2c93d1536ae02f085cc63faa3430e",
"macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_32.png": "8e0ae58e362a6636bdfccbc04da2c58c",
"macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_512.png": "0ad44039155424738917502c69667699",
"macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_64.png": "04e7b6ef05346c70b663ca1d97de3ad5",
"macos/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json": "1d48e925145d4b573a3b5d7960a1c585",
"macos/Runner/Base.lproj/MainMenu.xib": "85bdf02ea39336686f2e0ff5f52137cc",
"macos/Runner/Configs/AppInfo.xcconfig": "d3166bd5c759440bec3c439a45a0d854",
"macos/Runner/Configs/Debug.xcconfig": "783e2b0e2aa72d8bc215462bb8d1569d",
"macos/Runner/Configs/Release.xcconfig": "709485d8ea7b78479bf23eb64281287d",
"macos/Runner/Configs/Warnings.xcconfig": "bbde97fb62099b5b9879fb2ffeb1a0a0",
"macos/Runner/DebugProfile.entitlements": "4ad77e84621dc5735c16180a0934fcde",
"macos/Runner/Info.plist": "9ffcbec0a18fdad9d3d606656fd46f9a",
"macos/Runner/MainFlutterWindow.swift": "93c22dae2d93f3dc1402e121901f582b",
"macos/Runner/Release.entitlements": "fc4ad575c1efec3d097fb9d40a0f702f",
"macos/Runner.xcodeproj/project.pbxproj": "f04fa7f13343d5c3ffa6e7e32c0547bd",
"macos/Runner.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist": "7e8ed88ea03cf8357fe1c73ae979f345",
"macos/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme": "cf58149dff3288e22a96fa9995b12457",
"macos/Runner.xcworkspace/contents.xcworkspacedata": "ac9a90958f80f9cc1d0d5301144fb629",
"macos/Runner.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist": "7e8ed88ea03cf8357fe1c73ae979f345",
"macos/RunnerTests/RunnerTests.swift": "491b4028786d09d80b109a6d3d775ef6",
"main.dart.js": "102d10ead9075c068f110213d3a37901",
"manifest.json": "a50c3dc8982557ce2186054af91293d9",
"pubspec.lock": "9641b0b5d43202851be6bb278ab31dd0",
"pubspec.yaml": "7dc023ba3668935167d918cc103a8506",
"README.md": "b6fa4878ca83c9c5d243385c8b0d3575",
"test/widget_test.dart": "024351527647c02d454b4c41324e5a24",
"version.json": "956bc5b24a32f701bebfb4c3502d5c02",
"web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"web/index.html": "4ba92cc5776d933a5e65225d635c8c31",
"web/manifest.json": "a50c3dc8982557ce2186054af91293d9",
"windows/CMakeLists.txt": "bcb6f489b0c6f948e534341348f24763",
"windows/flutter/CMakeLists.txt": "bbf66fed5180bd9ae8198b8d7c4a0001",
"windows/flutter/generated_plugins.cmake": "3310ee57f69a570266e0d87fdb0575df",
"windows/flutter/generated_plugin_registrant.cc": "c019bc00d9916233620f2e622922a708",
"windows/flutter/generated_plugin_registrant.h": "0c3df6700414e7f332dfa2582a1ae29e",
"windows/runner/CMakeLists.txt": "028602ab9754bffe716659ada7590d29",
"windows/runner/flutter_window.cpp": "2f463f9b7da67a2d692a012f9ea85e0c",
"windows/runner/flutter_window.h": "7defcc89d4a26d56e801241d624d48fb",
"windows/runner/main.cpp": "32f948fc6d2c5401fd49e0769b3a18a7",
"windows/runner/resource.h": "1ade5dd15e613479a15e8832ed276f2b",
"windows/runner/resources/app_icon.ico": "6ea04d80ca2a3fa92c7717c3c44ccc19",
"windows/runner/runner.exe.manifest": "cd3aafe81b2f278dffaf305373ee30b4",
"windows/runner/Runner.rc": "726fff346b1a691cecba98c05442c397",
"windows/runner/utils.cpp": "3d7ba99ef466af433ffd4ef72b7c5c35",
"windows/runner/utils.h": "fd81e143f5614eb6fd75efe539002853",
"windows/runner/win32_window.cpp": "571eb8234dbc2661be03aa5f2a4d2fca",
"windows/runner/win32_window.h": "7569387d58711ab975940f4df3b4bcda"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
