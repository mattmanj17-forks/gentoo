# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{10..13} )

CRATES="
	ahash@0.8.11
	arrayvec@0.7.4
	associative-cache@2.0.0
	autocfg@1.3.0
	beef@0.5.2
	bytecount@0.6.8
	castaway@0.2.2
	cc@1.0.99
	cfg-if@1.0.0
	chrono@0.4.34
	compact_str@0.7.1
	const-random-macro@0.1.16
	const-random@0.1.18
	crunchy@0.2.2
	encoding_rs@0.8.34
	getrandom@0.2.15
	gimli@0.28.1
	half@2.4.1
	itoa@1.0.11
	itoap@1.0.1
	libc@0.2.155
	no-panic@0.1.30
	num-traits@0.2.19
	once_cell@1.19.0
	proc-macro2@1.0.85
	pyo3-build-config@0.21.2
	pyo3-ffi@0.21.2
	quote@1.0.36
	rustversion@1.0.17
	ryu@1.0.18
	serde@1.0.203
	serde_derive@1.0.203
	serde_json@1.0.117
	simdutf8@0.1.4
	smallvec@1.13.2
	static_assertions@1.1.0
	syn@2.0.66
	target-lexicon@0.12.14
	tiny-keccak@2.0.2
	unicode-ident@1.0.12
	unwinding@0.2.1
	version_check@0.9.4
	wasi@0.11.0+wasi-snapshot-preview1
	zerocopy-derive@0.7.34
	zerocopy@0.7.34
"

inherit cargo distutils-r1 pypi

DESCRIPTION="Fast, correct Python JSON library supporting dataclasses, datetimes, and numpy"
HOMEPAGE="
	https://github.com/ijl/orjson/
	https://pypi.org/project/orjson/
"
SRC_URI+="
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+="
	Apache-2.0-with-LLVM-exceptions BSD CC0-1.0 MIT Unicode-DFS-2016
	|| ( Apache-2.0 Boost-1.0 )
"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~loong ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

BDEPEND="
	>=virtual/rust-1.72
	test? (
		dev-python/arrow[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/numpy[${PYTHON_USEDEP}]
		' 'python3*')
	)
"

QA_FLAGS_IGNORED=".*"

distutils_enable_tests pytest

export UNSAFE_PYO3_SKIP_VERSION_CHECK=1

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}
