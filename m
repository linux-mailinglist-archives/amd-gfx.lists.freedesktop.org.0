Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CBF6701C
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 15:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B331E6E02B;
	Fri, 12 Jul 2019 13:32:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54F96E33A;
 Fri, 12 Jul 2019 09:37:28 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MdNLi-1iLCk53jKC-00ZPIO; Fri, 12 Jul 2019 11:37:21 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Support clang option for stack alignment
Date: Fri, 12 Jul 2019 11:37:00 +0200
Message-Id: <20190712093720.1461418-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:d225NHDmVD8iHvGnyul/A/ipRUep4hflYOdBban/FHrJgvhxnwv
 4MOV5qJc3d5lz4zwHGjhcNI0lO6YeTDm7VaRk9k1YAdyNbsflFi7qPCg/GwFqlbD0OrsWYN
 FzvL8RHmKRWR1k4HjLX5fBsO5NlMAPZrlHpxcA/UIv+Sl9Iv3G9E7bFJKG7hCU0MpdQvLtR
 oZHlNirSXwa7UbVjwnrTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lTHGrsZeWDM=:JXCj53bNX2jlA8G/jk8q9+
 ku8scKecqGHwd//M28KuzmF+Udem5qyLlHQV2zMS1Jg3rBvvg/cNt4x6RrCo5RH6PKIGrSu/i
 B/Bti/71s2AuQlWoXGqjfoFlxuug3UgBX91WMWnSENAN1bSjgZ0ZemyFsCYG5tvDjkOghoxGS
 /lDssxfXCq/AfHwMHdJajXPlEkIhVNxuUnssbH56PS2JISYB8pfKvyKYnymBNJcFBMUGvSVuy
 kqrT+3lW6FHT25MyhMn2IkdYmyNKC70IIoY+rVkZ8YXDd2UDXKt2jvizqLEpk+9RFAxrR4S8B
 z8Ac0OgVJ+uBz/9k/yLMWNwMsnTp+XGzWX3qEr0PBnXU+JiI1yQzyZe9t0KzBrxqkgPvzL3ia
 zSePZ2s3kMktRQXEgA7hTXaxOi7u/HnGhkrK3rgKy0nnOji2+J+gIunq7HQoyZUpNKIXQJk8S
 Cp6eTKeARkhKlWgOF52HoJLP7NGu8FjXF3EuVOTgSSGDLRPpIquHuUDQYwIiWKYikXIP2NNN7
 wrnP3dPMWR9AL2YKmn/pVOchHMns4PVWViw8RiufYmdSP6uq3D8+5R7HhuBJYClSZ2mRmowMQ
 9VVEiEKk2z8iku0UcsJOZolAmOHxj/dd+7a8zB5dUSgvf/OSVonGiG7c+Zy+L5RzpMLu6RXd9
 g8TQse+9URd/yHET2bfxsVwbp/AF2e+qur4ac7cUDBd0VZCEj9YrMHtstMcgxWK0eWHD7BzmR
 FBtEJaNLWUDMuqMFssmtpEc9hsZPhizIMAx1Pw==
X-Mailman-Approved-At: Fri, 12 Jul 2019 13:32:27 +0000
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
Cc: Charlene Liu <charlene.liu@amd.com>, Duke Du <Duke.Du@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXMgcHJldmlvdXNseSBmaXhlZCBmb3IgZG1sIGluIGNvbW1pdCA0NzY5Mjc4ZTVjN2YgKCJhbWRn
cHUvZGMvZG1sOgpTdXBwb3J0IGNsYW5nIG9wdGlvbiBmb3Igc3RhY2sgYWxpZ25tZW50IikgYW5k
IGNhbGNzIGluIGNvbW1pdApjYzMyYWQ4ZjU1OWMgKCJhbWRncHUvZGMvY2FsY3M6IFN1cHBvcnQg
Y2xhbmcgb3B0aW9uIGZvciBzdGFjawphbGlnbm1lbnQiKSwgZGNuMjAgdXNlcyBhbiBvcHRpb24g
dGhhdCBpcyBub3QgYXZhaWxhYmxlIHdpdGggY2xhbmc6CgpjbGFuZzogZXJyb3I6IHVua25vd24g
YXJndW1lbnQ6ICctbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00JwpzY3JpcHRzL01ha2VmaWxl
LmJ1aWxkOjI4MTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UubycgZmFpbGVkCgpVc2UgdGhlIHNh
bWUgdHJpY2sgdGhhdCB3ZSBoYXZlIGluIHRoZSBvdGhlciB0d28gZmlsZXMuCgpGaXhlczogN2Vk
NGU2MzUyYzE2ICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgRENOMiBIVyBTZXF1ZW5jZXIgYW5kIFJl
c291cmNlIikKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvTWFrZWZpbGUgfCAgOCArKysr
KysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9NYWtlZmlsZSAgIHwgMTYg
KysrKysrKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9NYWtl
ZmlsZQppbmRleCAxYjY4ZGUyN2JhNzQuLmU5NzIxYTkwNjU5MiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9NYWtlZmlsZQpAQCAtMTAsNyArMTAsMTMgQEAgaWZk
ZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKIERDTjIwICs9IGRjbjIwX2RzYy5vCiBl
bmRpZgogCi1DRkxBR1NfZGNuMjBfcmVzb3VyY2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgLW1w
cmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NAoraWZuZXEgKCQoY2FsbCBjYy1vcHRpb24sIC1tcHJl
ZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQpLCkKKwljY19zdGFja19hbGlnbiA6PSAtbXByZWZlcnJl
ZC1zdGFjay1ib3VuZGFyeT00CitlbHNlIGlmbmVxICgkKGNhbGwgY2Mtb3B0aW9uLCAtbXN0YWNr
LWFsaWdubWVudD0xNiksKQorCWNjX3N0YWNrX2FsaWduIDo9IC1tc3RhY2stYWxpZ25tZW50PTE2
CitlbmRpZgorCitDRkxBR1NfZGNuMjBfcmVzb3VyY2UubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2Ug
JChjY19zdGFja19hbGlnbikKIAogQU1EX0RBTF9EQ04yMCA9ICQoYWRkcHJlZml4ICQoQU1EREFM
UEFUSCkvZGMvZGNuMjAvLCQoRENOMjApKQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZHNjL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RzYy9NYWtlZmlsZQppbmRleCBjNWQ1Yjk0ZTI2MDQuLmUwMTljZDk0NDdlOCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9NYWtlZmlsZQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL01ha2VmaWxlCkBAIC0xLDEwICsxLDE4
IEBACiAjCiAjIE1ha2VmaWxlIGZvciB0aGUgJ2RzYycgc3ViLWNvbXBvbmVudCBvZiBEQUwuCiAK
LUNGTEFHU19yY19jYWxjLm8gOj0gLW1oYXJkLWZsb2F0IC1tc3NlIC1tcHJlZmVycmVkLXN0YWNr
LWJvdW5kYXJ5PTQKLUNGTEFHU19yY19jYWxjX2RwaS5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAt
bXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00Ci1DRkxBR1NfY29kZWNfbWFpbl9hbWQubyA6PSAt
bWhhcmQtZmxvYXQgLW1zc2UgLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NAotQ0ZMQUdTX2Rj
X2RzYy5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00
CitpZm5lcSAoJChjYWxsIGNjLW9wdGlvbiwgLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NCks
KQorCWNjX3N0YWNrX2FsaWduIDo9IC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTQKK2Vsc2Ug
aWZuZXEgKCQoY2FsbCBjYy1vcHRpb24sIC1tc3RhY2stYWxpZ25tZW50PTE2KSwpCisJY2Nfc3Rh
Y2tfYWxpZ24gOj0gLW1zdGFjay1hbGlnbm1lbnQ9MTYKK2VuZGlmCisKK2RzY19jY2ZsYWdzIDo9
IC1taGFyZC1mbG9hdCAtbXNzZSAkKGNjX3N0YWNrX2FsaWduKQorCitDRkxBR1NfcmNfY2FsYy5v
IDo9ICQoZHNjX2NjZmxhZ3MpCitDRkxBR1NfcmNfY2FsY19kcGkubyA6PSAkKGRzY19jY2ZsYWdz
KQorQ0ZMQUdTX2NvZGVjX21haW5fYW1kLm8gOj0gJChkc2NfY2NmbGFncykKK0NGTEFHU19kY19k
c2MubyA6PSAkKGRzY19jY2ZsYWdzKQogCiBEU0MgPSBkY19kc2MubyByY19jYWxjLm8gcmNfY2Fs
Y19kcGkubwogCi0tIAoyLjIwLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
