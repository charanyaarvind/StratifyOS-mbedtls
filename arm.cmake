

#Add sources to the project
set(SOURCES_PREFIX ${CMAKE_SOURCE_DIR}/mbedtls/library)

set(SOURCES
    ${SOURCES_PREFIX}/aes.c
    ${SOURCES_PREFIX}/aesni.c
    ${SOURCES_PREFIX}/arc4.c
    ${SOURCES_PREFIX}/aria.c
    ${SOURCES_PREFIX}/asn1parse.c
    ${SOURCES_PREFIX}/asn1write.c
    ${SOURCES_PREFIX}/base64.c
    ${SOURCES_PREFIX}/bignum.c
    ${SOURCES_PREFIX}/blowfish.c
    ${SOURCES_PREFIX}/camellia.c
    ${SOURCES_PREFIX}/ccm.c
    ${SOURCES_PREFIX}/chacha20.c
    ${SOURCES_PREFIX}/chachapoly.c
    ${SOURCES_PREFIX}/cipher.c
    ${SOURCES_PREFIX}/cipher_wrap.c
    ${SOURCES_PREFIX}/cmac.c
    ${SOURCES_PREFIX}/ctr_drbg.c
    ${SOURCES_PREFIX}/des.c
    ${SOURCES_PREFIX}/dhm.c
    ${SOURCES_PREFIX}/ecdh.c
    ${SOURCES_PREFIX}/ecdsa.c
    ${SOURCES_PREFIX}/ecjpake.c
    ${SOURCES_PREFIX}/ecp.c
    ${SOURCES_PREFIX}/ecp_curves.c
    ${SOURCES_PREFIX}/entropy.c
    ${SOURCES_PREFIX}/entropy_poll.c
    ${SOURCES_PREFIX}/error.c
    ${SOURCES_PREFIX}/gcm.c
    ${SOURCES_PREFIX}/havege.c
    ${SOURCES_PREFIX}/hkdf.c
    ${SOURCES_PREFIX}/hmac_drbg.c
    ${SOURCES_PREFIX}/md.c
    ${SOURCES_PREFIX}/md2.c
    ${SOURCES_PREFIX}/md4.c
    ${SOURCES_PREFIX}/md5.c
    ${SOURCES_PREFIX}/md_wrap.c
    ${SOURCES_PREFIX}/memory_buffer_alloc.c
    ${SOURCES_PREFIX}/nist_kw.c
    ${SOURCES_PREFIX}/oid.c
    ${SOURCES_PREFIX}/padlock.c
    ${SOURCES_PREFIX}/pem.c
    ${SOURCES_PREFIX}/pk.c
    ${SOURCES_PREFIX}/pk_wrap.c
    ${SOURCES_PREFIX}/pkcs12.c
    ${SOURCES_PREFIX}/pkcs5.c
    ${SOURCES_PREFIX}/pkparse.c
    ${SOURCES_PREFIX}/pkwrite.c
    ${SOURCES_PREFIX}/platform.c
    ${SOURCES_PREFIX}/platform_util.c
    ${SOURCES_PREFIX}/poly1305.c
    ${SOURCES_PREFIX}/ripemd160.c
    ${SOURCES_PREFIX}/rsa.c
    ${SOURCES_PREFIX}/rsa_internal.c
    ${SOURCES_PREFIX}/sha1.c
    ${SOURCES_PREFIX}/sha256.c
    ${SOURCES_PREFIX}/sha512.c
    ${SOURCES_PREFIX}/threading.c
    ${SOURCES_PREFIX}/timing.c
    ${SOURCES_PREFIX}/version.c
    ${SOURCES_PREFIX}/version_features.c
    ${SOURCES_PREFIX}/xtea.c
)

set(X509_SOURCES
    ${SOURCES_PREFIX}/certs.c
    ${SOURCES_PREFIX}/pkcs11.c
    ${SOURCES_PREFIX}/x509.c
    ${SOURCES_PREFIX}/x509_create.c
    ${SOURCES_PREFIX}/x509_crl.c
    ${SOURCES_PREFIX}/x509_crt.c
    ${SOURCES_PREFIX}/x509_csr.c
    ${SOURCES_PREFIX}/x509write_crt.c
    ${SOURCES_PREFIX}/x509write_csr.c
)

set(TLS_SOURCES
    ${SOURCES_PREFIX}/debug.c
 #   ${SOURCES_PREFIX}/net_sockets.c
    ${SOURCES_PREFIX}/ssl_cache.c
    ${SOURCES_PREFIX}/ssl_ciphersuites.c
    ${SOURCES_PREFIX}/ssl_cli.c
    ${SOURCES_PREFIX}/ssl_cookie.c
    ${SOURCES_PREFIX}/ssl_srv.c
    ${SOURCES_PREFIX}/ssl_ticket.c
    ${SOURCES_PREFIX}/ssl_tls.c
)

file(GLOB_RECURSE HEADERS mbedtls/include/*)

set(SOS_LIB_SOURCELIST
	${TLS_SOURCES}
	${X509_SOURCES}
	${SOURCES}
	${HEADERS}
	sos_config.h
	sos_config.c
	net_sockets.c
	timing_alt.h
	mbedtls_api.h
	mbedtls_api.c)


# kernel release and debug configurations
set(SOS_LIB_TYPE release)
set(SOS_LIB_OPTION kernel)
set(SOS_LIB_INCLUDE_DIRECTORIES mbedtls/include ${CMAKE_SOURCE_DIR})
set(SOS_LIB_DEFINITIONS -DMBEDTLS_CONFIG_FILE="sos_config.h" -DHAVE_LWIP_SOCKETS_H)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

set(SOS_LIB_TYPE debug)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

