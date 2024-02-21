# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler@1.0.2
	aho-corasick@1.1.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.5
	anstyle@1.0.4
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anyhow@1.0.77
	arc-swap@1.6.0
	arrayvec@0.7.4
	async-broadcast@0.5.1
	async-channel@2.1.1
	async-executor@1.8.0
	async-fs@1.6.0
	async-io@1.13.0
	async-io@2.2.2
	async-lock@2.8.0
	async-lock@3.2.0
	async-process@1.8.1
	async-recursion@1.0.5
	async-signal@0.2.5
	async-task@4.6.0
	async-trait@0.1.75
	atomic-waker@1.1.2
	autocfg@1.1.0
	base64@0.13.1
	bitflags@1.3.2
	bitflags@2.4.1
	block@0.1.6
	block-buffer@0.9.0
	block-buffer@0.10.4
	blocking@1.5.1
	bstr@1.9.0
	btoi@0.4.3
	bumpalo@3.14.0
	byteorder@1.5.0
	bytesize@1.3.0
	cc@1.0.83
	cfg-if@1.0.0
	chrono@0.4.31
	clap@4.4.12
	clap_builder@4.4.12
	clap_complete@4.4.5
	clap_derive@4.4.7
	clap_lex@0.6.0
	clru@0.6.1
	cmake@0.1.50
	colorchoice@1.0.0
	concurrent-queue@2.4.0
	const-random@0.1.17
	const-random-macro@0.1.16
	const_format@0.2.32
	const_format_proc_macros@0.2.32
	core-foundation@0.9.4
	core-foundation-sys@0.8.6
	cpufeatures@0.2.11
	crc32fast@1.3.2
	crossbeam@0.8.3
	crossbeam-channel@0.5.10
	crossbeam-deque@0.8.4
	crossbeam-epoch@0.9.17
	crossbeam-queue@0.3.10
	crossbeam-utils@0.8.18
	crunchy@0.2.2
	crypto-common@0.1.6
	deelevate@0.2.0
	deranged@0.3.10
	derivative@2.2.0
	digest@0.9.0
	digest@0.10.7
	dirs@4.0.0
	dirs-next@2.0.0
	dirs-sys@0.3.7
	dirs-sys-next@0.1.2
	dlv-list@0.5.2
	downcast@0.11.0
	dunce@1.0.4
	dyn-clone@1.0.16
	either@1.9.0
	enumflags2@0.7.8
	enumflags2_derive@0.7.8
	equivalent@1.0.1
	errno@0.2.8
	errno@0.3.8
	errno-dragonfly@0.1.2
	event-listener@2.5.3
	event-listener@3.1.0
	event-listener@4.0.1
	event-listener-strategy@0.4.0
	faster-hex@0.9.0
	fastrand@1.9.0
	fastrand@2.0.1
	filedescriptor@0.8.2
	filetime@0.2.23
	flate2@1.0.28
	fnv@1.0.7
	form_urlencoded@1.2.1
	fragile@2.0.0
	futures-core@0.3.30
	futures-io@0.3.30
	futures-lite@1.13.0
	futures-lite@2.1.0
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.11
	gix@0.57.1
	gix-actor@0.29.1
	gix-bitmap@0.2.10
	gix-chunk@0.4.7
	gix-commitgraph@0.23.1
	gix-config@0.33.1
	gix-config-value@0.14.3
	gix-date@0.8.3
	gix-diff@0.39.1
	gix-discover@0.28.1
	gix-features@0.37.1
	gix-fs@0.9.1
	gix-glob@0.15.1
	gix-hash@0.14.1
	gix-hashtable@0.5.1
	gix-index@0.28.1
	gix-lock@12.0.1
	gix-macros@0.1.3
	gix-object@0.40.1
	gix-odb@0.56.1
	gix-pack@0.46.1
	gix-path@0.10.3
	gix-quote@0.4.10
	gix-ref@0.40.1
	gix-refspec@0.21.1
	gix-revision@0.25.1
	gix-revwalk@0.11.1
	gix-sec@0.10.3
	gix-tempfile@12.0.1
	gix-trace@0.1.6
	gix-traverse@0.36.1
	gix-url@0.26.1
	gix-utils@0.1.8
	gix-validate@0.8.3
	guess_host_triple@0.1.3
	hashbrown@0.12.3
	hashbrown@0.14.3
	heck@0.4.1
	hermit-abi@0.3.3
	hex@0.4.3
	home@0.5.9
	iana-time-zone@0.1.58
	iana-time-zone-haiku@0.1.2
	idna@0.5.0
	indexmap@1.9.3
	indexmap@2.1.0
	instant@0.1.12
	io-lifetimes@1.0.11
	is-docker@0.2.0
	is-wsl@0.4.0
	is_debug@1.0.1
	itertools@0.11.0
	itertools@0.12.0
	itoa@1.0.10
	js-sys@0.3.66
	jwalk@0.8.1
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.151
	libredox@0.0.1
	libz-ng-sys@1.1.12
	libz-sys@1.1.12
	linked-hash-map@0.5.6
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.12
	lock_api@0.4.11
	log@0.4.20
	mac-notification-sys@0.6.1
	mach2@0.4.2
	malloc_buf@0.0.6
	memchr@2.7.1
	memmap2@0.9.3
	memmem@0.1.1
	memoffset@0.7.1
	memoffset@0.9.0
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mockall@0.12.1
	mockall_derive@0.12.1
	nix@0.26.4
	nix@0.27.1
	nom@5.1.3
	nom@7.1.3
	notify-rust@4.10.0
	nu-ansi-term@0.49.0
	num-derive@0.3.3
	num-traits@0.2.17
	num_threads@0.1.6
	objc@0.2.7
	objc-foundation@0.1.1
	objc_id@0.1.1
	once_cell@1.19.0
	opaque-debug@0.3.0
	open@5.0.1
	ordered-float@2.10.1
	ordered-multimap@0.7.1
	ordered-stream@0.2.0
	os_info@3.7.0
	parking@2.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	path-slash@0.2.1
	pathdiff@0.2.1
	pathsearch@0.2.0
	percent-encoding@2.3.1
	pest@2.7.5
	pest_derive@2.7.5
	pest_generator@2.7.5
	pest_meta@2.7.5
	phf@0.11.2
	phf_codegen@0.11.2
	phf_generator@0.11.2
	phf_shared@0.11.2
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	piper@0.2.1
	pkg-config@0.3.28
	polling@2.8.0
	polling@3.3.1
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	predicates@3.0.4
	predicates-core@1.0.6
	predicates-tree@1.0.9
	proc-macro-crate@1.3.1
	proc-macro2@1.0.74
	process_control@4.0.3
	prodash@28.0.0
	quick-xml@0.30.0
	quick-xml@0.31.0
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon@1.8.0
	rayon-core@1.12.0
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex@1.10.2
	regex-automata@0.4.3
	regex-syntax@0.8.2
	rust-ini@0.20.0
	rustix@0.37.27
	rustix@0.38.28
	ryu@1.0.16
	same-file@1.0.6
	schemars@0.8.16
	schemars_derive@0.8.16
	scopeguard@1.2.0
	semver@0.11.0
	semver@1.0.20
	semver-parser@0.10.2
	serde@1.0.194
	serde_derive@1.0.194
	serde_derive_internals@0.26.0
	serde_json@1.0.109
	serde_repr@0.1.17
	serde_spanned@0.6.5
	sha1@0.10.6
	sha1-asm@0.5.2
	sha1_smol@1.0.0
	sha2@0.9.9
	sha2@0.10.8
	shadow-rs@0.26.0
	shared_library@0.1.9
	shell-words@1.1.0
	signal-hook@0.1.17
	signal-hook@0.3.17
	signal-hook-registry@1.4.1
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.11.2
	socket2@0.4.10
	starship@1.17.1
	starship-battery@0.8.2
	static_assertions@1.1.0
	strsim@0.10.0
	syn@1.0.109
	syn@2.0.46
	systemstat@0.2.3
	tauri-winrt-notification@0.1.3
	tempfile@3.9.0
	terminal_size@0.3.0
	terminfo@0.7.5
	termios@0.3.3
	termtree@0.4.1
	termwiz@0.15.0
	thiserror@1.0.52
	thiserror-impl@1.0.52
	time@0.3.31
	time-core@0.1.2
	time-macros@0.2.16
	tiny-keccak@2.0.2
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	toml@0.5.11
	toml@0.8.8
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.21.0
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	typenum@1.17.0
	ucd-trie@0.1.6
	uds_windows@1.1.0
	uluru@3.0.0
	unicase@2.7.0
	unicode-bidi@0.3.14
	unicode-bom@2.0.3
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.11
	unicode-xid@0.2.4
	uom@0.35.0
	url@2.5.0
	urlencoding@2.1.3
	utf8parse@0.2.1
	vcpkg@0.2.15
	version_check@0.9.4
	versions@6.0.0
	vtparse@0.6.2
	waker-fn@1.1.1
	walkdir@2.4.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.89
	wasm-bindgen-backend@0.2.89
	wasm-bindgen-macro@0.2.89
	wasm-bindgen-macro-support@0.2.89
	wasm-bindgen-shared@0.2.89
	which@5.0.0
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.48.0
	windows@0.51.1
	windows@0.52.0
	windows-core@0.51.1
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.31
	winres@0.1.12
	xdg-home@1.0.0
	yaml-rust@0.4.5
	zbus@3.14.1
	zbus_macros@3.14.1
	zbus_names@2.6.0
	zvariant@3.15.0
	zvariant_derive@3.15.0
	zvariant_utils@1.0.1
"

inherit cargo

DESCRIPTION="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
HOMEPAGE="https://starship.rs/"
SRC_URI="
	https://github.com/starship/starship/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 ISC MIT MIT-0 MPL-2.0 Unicode-DFS-2016 Unlicense WTFPL-2 ZLIB"

SLOT="0"
KEYWORDS="amd64 ~arm64"

BDEPEND="dev-build/cmake
	>=virtual/rust-1.65"

PATCHES=(
	# https://bugs.gentoo.org/866133
	"${FILESDIR}"/${PN}-1.17.1-no-strip.patch
)

QA_FLAGS_IGNORED="usr/bin/starship"

src_configure() {
	export PKG_CONFIG_ALLOW_CROSS=1
	export OPENSSL_NO_VENDOR=true

	cargo_src_configure
}

src_install() {
	cargo_src_install
	dodoc README.md CHANGELOG.md
}

pkg_postinst() {
	local v
	for v in ${REPLACING_VERSIONS}; do
		if ver_test "${v}" -lt "1.9.0"; then
			einfo "Note that vicmd_symbol config option was renamed to vimcmd_symbol in version 1.9"
		fi
	done
}
