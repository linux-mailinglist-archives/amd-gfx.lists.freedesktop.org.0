Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F5C9FF4
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09D16E9E4;
	Thu,  3 Oct 2019 14:00:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4506E122
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 08:22:37 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iFwNe-0003sm-7R; Thu, 03 Oct 2019 08:22:34 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.or
Subject: [PATCH][drm-next] drm/amd/display: fix spelling mistake AUTHENICATED
 -> AUTHENTICATED
Date: Thu,  3 Oct 2019 09:22:32 +0100
Message-Id: <20191003082232.4136-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Oct 2019 14:00:43 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGEgc3BlbGxpbmcgbWlzdGFrZSBpbiB0aGUgbWFjcm9zIEgxX0E0NV9BVVRIRU5JQ0FURUQgYW5k
CkQxX0E0X0FVVEhFTklDQVRFRCwgZml4IHRoZXNlIGJ5IGFkZGluZyB0aGUgbWlzc2luZyBULgoK
U2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AuaCAgICAg
IHwgIDQgKystLQogLi4uL2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfZXhlY3V0
aW9uLmMgICB8ICA0ICsrLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3Ax
X3RyYW5zaXRpb24uYyAgfCAxMiArKysrKystLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL2hkY3AvaGRjcF9sb2cuYyAgfCAgOCArKysrLS0tLQogNCBmaWxlcyBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5oCmluZGV4IDQwMmJiNzk5OTA5My4u
NTY2NGJjMGI1YmQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9k
dWxlcy9oZGNwL2hkY3AuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxl
cy9oZGNwL2hkY3AuaApAQCAtMTc2LDcgKzE3Niw3IEBAIGVudW0gbW9kX2hkY3BfaGRjcDFfc3Rh
dGVfaWQgewogCUgxX0EwX1dBSVRfRk9SX0FDVElWRV9SWCwKIAlIMV9BMV9FWENIQU5HRV9LU1ZT
LAogCUgxX0EyX0NPTVBVVEFUSU9OU19BM19WQUxJREFURV9SWF9BNl9URVNUX0ZPUl9SRVBFQVRF
UiwKLQlIMV9BNDVfQVVUSEVOSUNBVEVELAorCUgxX0E0NV9BVVRIRU5USUNBVEVELAogCUgxX0E4
X1dBSVRfRk9SX1JFQURZLAogCUgxX0E5X1JFQURfS1NWX0xJU1QsCiAJSERDUDFfU1RBVEVfRU5E
ID0gSDFfQTlfUkVBRF9LU1ZfTElTVApAQCAtMTg4LDcgKzE4OCw3IEBAIGVudW0gbW9kX2hkY3Bf
aGRjcDFfZHBfc3RhdGVfaWQgewogCUQxX0ExX0VYQ0hBTkdFX0tTVlMsCiAJRDFfQTIzX1dBSVRf
Rk9SX1IwX1BSSU1FLAogCUQxX0EyX0NPTVBVVEFUSU9OU19BM19WQUxJREFURV9SWF9BNV9URVNU
X0ZPUl9SRVBFQVRFUiwKLQlEMV9BNF9BVVRIRU5JQ0FURUQsCisJRDFfQTRfQVVUSEVOVElDQVRF
RCwKIAlEMV9BNl9XQUlUX0ZPUl9SRUFEWSwKIAlEMV9BN19SRUFEX0tTVl9MSVNULAogCUhEQ1Ax
X0RQX1NUQVRFX0VORCA9IEQxX0E3X1JFQURfS1NWX0xJU1QsCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AxX2V4ZWN1dGlvbi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwMV9leGVjdXRpb24uYwpp
bmRleCA5ZTczMDJlYWMyOTkuLjNkYjRhN2RhNDE0ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwMV9leGVjdXRpb24uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AxX2V4ZWN1dGlvbi5jCkBA
IC00NzYsNyArNDc2LDcgQEAgZW51bSBtb2RfaGRjcF9zdGF0dXMgbW9kX2hkY3BfaGRjcDFfZXhl
Y3V0aW9uKHN0cnVjdCBtb2RfaGRjcCAqaGRjcCwKIAkJc3RhdHVzID0gY29tcHV0YXRpb25zX3Zh
bGlkYXRlX3J4X3Rlc3RfZm9yX3JlcGVhdGVyKGhkY3AsCiAJCQkJZXZlbnRfY3R4LCBpbnB1dCk7
CiAJCWJyZWFrOwotCWNhc2UgSDFfQTQ1X0FVVEhFTklDQVRFRDoKKwljYXNlIEgxX0E0NV9BVVRI
RU5USUNBVEVEOgogCQlzdGF0dXMgPSBhdXRoZW50aWNhdGVkKGhkY3AsIGV2ZW50X2N0eCwgaW5w
dXQpOwogCQlicmVhazsKIAljYXNlIEgxX0E4X1dBSVRfRk9SX1JFQURZOgpAQCAtNTEzLDcgKzUx
Myw3IEBAIGV4dGVybiBlbnVtIG1vZF9oZGNwX3N0YXR1cyBtb2RfaGRjcF9oZGNwMV9kcF9leGVj
dXRpb24oc3RydWN0IG1vZF9oZGNwICpoZGNwLAogCQlzdGF0dXMgPSBjb21wdXRhdGlvbnNfdmFs
aWRhdGVfcnhfdGVzdF9mb3JfcmVwZWF0ZXIoCiAJCQkJaGRjcCwgZXZlbnRfY3R4LCBpbnB1dCk7
CiAJCWJyZWFrOwotCWNhc2UgRDFfQTRfQVVUSEVOSUNBVEVEOgorCWNhc2UgRDFfQTRfQVVUSEVO
VElDQVRFRDoKIAkJc3RhdHVzID0gYXV0aGVudGljYXRlZF9kcChoZGNwLCBldmVudF9jdHgsIGlu
cHV0KTsKIAkJYnJlYWs7CiAJY2FzZSBEMV9BNl9XQUlUX0ZPUl9SRUFEWToKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfdHJhbnNpdGlv
bi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwMV90cmFu
c2l0aW9uLmMKaW5kZXggMWQxODc4MDliNzA5Li4xMzZiODAxMWZmM2YgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfdHJhbnNpdGlvbi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcDFfdHJh
bnNpdGlvbi5jCkBAIC04MSwxMSArODEsMTEgQEAgZW51bSBtb2RfaGRjcF9zdGF0dXMgbW9kX2hk
Y3BfaGRjcDFfdHJhbnNpdGlvbihzdHJ1Y3QgbW9kX2hkY3AgKmhkY3AsCiAJCQlzZXRfc3RhdGVf
aWQoaGRjcCwgb3V0cHV0LCBIMV9BOF9XQUlUX0ZPUl9SRUFEWSk7CiAJCX0gZWxzZSB7CiAJCQlj
YWxsYmFja19pbl9tcygwLCBvdXRwdXQpOwotCQkJc2V0X3N0YXRlX2lkKGhkY3AsIG91dHB1dCwg
SDFfQTQ1X0FVVEhFTklDQVRFRCk7CisJCQlzZXRfc3RhdGVfaWQoaGRjcCwgb3V0cHV0LCBIMV9B
NDVfQVVUSEVOVElDQVRFRCk7CiAJCQlIRENQX0ZVTExfRERDX1RSQUNFKGhkY3ApOwogCQl9CiAJ
CWJyZWFrOwotCWNhc2UgSDFfQTQ1X0FVVEhFTklDQVRFRDoKKwljYXNlIEgxX0E0NV9BVVRIRU5U
SUNBVEVEOgogCQlpZiAoaW5wdXQtPmxpbmtfbWFpbnRlbmFuY2UgIT0gUEFTUykgewogCQkJLyog
MUEtMDc6IGNvbnNpZGVyIGludmFsaWQgcmknIGEgZmFpbHVyZSAqLwogCQkJLyogMUEtMDdhOiBj
b25zaWRlciByZWFkIHJpJyBub3QgcmV0dXJuZWQgYSBmYWlsdXJlICovCkBAIC0xMjksNyArMTI5
LDcgQEAgZW51bSBtb2RfaGRjcF9zdGF0dXMgbW9kX2hkY3BfaGRjcDFfdHJhbnNpdGlvbihzdHJ1
Y3QgbW9kX2hkY3AgKmhkY3AsCiAJCQlicmVhazsKIAkJfQogCQljYWxsYmFja19pbl9tcygwLCBv
dXRwdXQpOwotCQlzZXRfc3RhdGVfaWQoaGRjcCwgb3V0cHV0LCBIMV9BNDVfQVVUSEVOSUNBVEVE
KTsKKwkJc2V0X3N0YXRlX2lkKGhkY3AsIG91dHB1dCwgSDFfQTQ1X0FVVEhFTlRJQ0FURUQpOwog
CQlIRENQX0ZVTExfRERDX1RSQUNFKGhkY3ApOwogCQlicmVhazsKIAlkZWZhdWx0OgpAQCAtMjI0
LDExICsyMjQsMTEgQEAgZW51bSBtb2RfaGRjcF9zdGF0dXMgbW9kX2hkY3BfaGRjcDFfZHBfdHJh
bnNpdGlvbihzdHJ1Y3QgbW9kX2hkY3AgKmhkY3AsCiAJCQlzZXRfd2F0Y2hkb2dfaW5fbXMoaGRj
cCwgNTAwMCwgb3V0cHV0KTsKIAkJCXNldF9zdGF0ZV9pZChoZGNwLCBvdXRwdXQsIEQxX0E2X1dB
SVRfRk9SX1JFQURZKTsKIAkJfSBlbHNlIHsKLQkJCXNldF9zdGF0ZV9pZChoZGNwLCBvdXRwdXQs
IEQxX0E0X0FVVEhFTklDQVRFRCk7CisJCQlzZXRfc3RhdGVfaWQoaGRjcCwgb3V0cHV0LCBEMV9B
NF9BVVRIRU5USUNBVEVEKTsKIAkJCUhEQ1BfRlVMTF9ERENfVFJBQ0UoaGRjcCk7CiAJCX0KIAkJ
YnJlYWs7Ci0JY2FzZSBEMV9BNF9BVVRIRU5JQ0FURUQ6CisJY2FzZSBEMV9BNF9BVVRIRU5USUNB
VEVEOgogCQlpZiAoaW5wdXQtPmxpbmtfaW50ZWdpcnlfY2hlY2sgIT0gUEFTUyB8fAogCQkJCWlu
cHV0LT5yZWF1dGhfcmVxdWVzdF9jaGVjayAhPSBQQVNTKSB7CiAJCQkvKiAxQS0wNzogcmVzdGFy
dCBoZGNwIG9uIGEgbGluayBpbnRlZ3JpdHkgZmFpbHVyZSAqLwpAQCAtMjk1LDcgKzI5NSw3IEBA
IGVudW0gbW9kX2hkY3Bfc3RhdHVzIG1vZF9oZGNwX2hkY3AxX2RwX3RyYW5zaXRpb24oc3RydWN0
IG1vZF9oZGNwICpoZGNwLAogCQkJZmFpbF9hbmRfcmVzdGFydF9pbl9tcygwLCAmc3RhdHVzLCBv
dXRwdXQpOwogCQkJYnJlYWs7CiAJCX0KLQkJc2V0X3N0YXRlX2lkKGhkY3AsIG91dHB1dCwgRDFf
QTRfQVVUSEVOSUNBVEVEKTsKKwkJc2V0X3N0YXRlX2lkKGhkY3AsIG91dHB1dCwgRDFfQTRfQVVU
SEVOVElDQVRFRCk7CiAJCUhEQ1BfRlVMTF9ERENfVFJBQ0UoaGRjcCk7CiAJCWJyZWFrOwogCWRl
ZmF1bHQ6CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9o
ZGNwL2hkY3BfbG9nLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNw
L2hkY3BfbG9nLmMKaW5kZXggZDg2OGY1NTZkMTgwLi4zOTgyY2VkNWY5NjkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9sb2cuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfbG9nLmMKQEAg
LTEzNiw4ICsxMzYsOCBAQCBjaGFyICptb2RfaGRjcF9zdGF0ZV9pZF90b19zdHIoaW50MzJfdCBp
ZCkKIAkJcmV0dXJuICJIMV9BMV9FWENIQU5HRV9LU1ZTIjsKIAljYXNlIEgxX0EyX0NPTVBVVEFU
SU9OU19BM19WQUxJREFURV9SWF9BNl9URVNUX0ZPUl9SRVBFQVRFUjoKIAkJcmV0dXJuICJIMV9B
Ml9DT01QVVRBVElPTlNfQTNfVkFMSURBVEVfUlhfQTZfVEVTVF9GT1JfUkVQRUFURVIiOwotCWNh
c2UgSDFfQTQ1X0FVVEhFTklDQVRFRDoKLQkJcmV0dXJuICJIMV9BNDVfQVVUSEVOSUNBVEVEIjsK
KwljYXNlIEgxX0E0NV9BVVRIRU5USUNBVEVEOgorCQlyZXR1cm4gIkgxX0E0NV9BVVRIRU5USUNB
VEVEIjsKIAljYXNlIEgxX0E4X1dBSVRfRk9SX1JFQURZOgogCQlyZXR1cm4gIkgxX0E4X1dBSVRf
Rk9SX1JFQURZIjsKIAljYXNlIEgxX0E5X1JFQURfS1NWX0xJU1Q6CkBAIC0xNTAsOCArMTUwLDgg
QEAgY2hhciAqbW9kX2hkY3Bfc3RhdGVfaWRfdG9fc3RyKGludDMyX3QgaWQpCiAJCXJldHVybiAi
RDFfQTIzX1dBSVRfRk9SX1IwX1BSSU1FIjsKIAljYXNlIEQxX0EyX0NPTVBVVEFUSU9OU19BM19W
QUxJREFURV9SWF9BNV9URVNUX0ZPUl9SRVBFQVRFUjoKIAkJcmV0dXJuICJEMV9BMl9DT01QVVRB
VElPTlNfQTNfVkFMSURBVEVfUlhfQTVfVEVTVF9GT1JfUkVQRUFURVIiOwotCWNhc2UgRDFfQTRf
QVVUSEVOSUNBVEVEOgotCQlyZXR1cm4gIkQxX0E0X0FVVEhFTklDQVRFRCI7CisJY2FzZSBEMV9B
NF9BVVRIRU5USUNBVEVEOgorCQlyZXR1cm4gIkQxX0E0X0FVVEhFTlRJQ0FURUQiOwogCWNhc2Ug
RDFfQTZfV0FJVF9GT1JfUkVBRFk6CiAJCXJldHVybiAiRDFfQTZfV0FJVF9GT1JfUkVBRFkiOwog
CWNhc2UgRDFfQTdfUkVBRF9LU1ZfTElTVDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
