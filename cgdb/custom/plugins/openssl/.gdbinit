# gdb macros which may be useful for folks using gdb to debug
# openssl.  Delete it if it bothers you.
directory /root/card/PlxSdk/Linux/PlxApi
source /root/.dotfiles/cgdb/custom/plugins/openssl/breakpoint_for_jd_engine

define dump_bio
    set $i = $arg0

    print *((BUF_MEM *)$i->ptr)
end
document dump_bio
    Print the bio.
end

define dump_x509
    set $i = $arg0

    print X509_print_fp(stdout,$i)
end
document dump_x509
    Print the X509 certificate.
end

define dump_evp_pkey_public
    set $i = $arg0

    print EVP_PKEY_print_public (BIO_new_fp (stdout, 0), $i, 0, 0)
end
document dump_evp_pkey_public
    Print the Public Key of EVP_PKEY.
end

define dump_evp_pkey_private
    set $i = $arg0

    print EVP_PKEY_print_private (BIO_new_fp (stdout, 0), $i, 0, 0)
end
document dump_evp_pkey_private
    Print the Private Key of EVP_PKEY.
end

define dump_evp_pkey_params
    set $i = $arg0

    print EVP_PKEY_print_params (BIO_new_fp (stdout, 0), $i, 0, 0)
end
document dump_evp_pkey_params
    Print the params of EVP_PKEY.
end

