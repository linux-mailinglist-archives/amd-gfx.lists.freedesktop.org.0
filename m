Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A18DDFE72
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 09:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1EF6E41A;
	Tue, 22 Oct 2019 07:40:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5996E14B
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 14:57:14 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by baptiste.telenet-ops.be with bizsmtp
 id GErr2100805gfCL01Err8s; Mon, 21 Oct 2019 16:52:11 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2F-00075l-0P; Mon, 21 Oct 2019 16:51:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2E-0008FT-V5; Mon, 21 Oct 2019 16:51:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David@rox.of.borg, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Casey Leedom <leedom@chelsio.com>,
 Shannon Nelson <snelson@pensando.io>,
 Pensando Drivers <drivers@pensando.io>, Kevin Hilman <khilman@kernel.org>,
 Nishanth Menon <nm@ti.com>
Subject: [PATCH 2/5] cxgb4/cxgb4vf: Remove superfluous void * cast in
 debugfs_create_file() call
Date: Mon, 21 Oct 2019 16:51:46 +0200
Message-Id: <20191021145149.31657-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021145149.31657-1-geert+renesas@glider.be>
References: <20191021145149.31657-1-geert+renesas@glider.be>
X-Mailman-Approved-At: Tue, 22 Oct 2019 07:40:30 +0000
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
Cc: amd-gfx@lists.freedesktop.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gbmVlZCB0byBjYXN0IGEgdHlwZWQgcG9pbnRlciB0byBhIHZvaWQgcG9pbnRl
ciB3aGVuIGNhbGxpbmcKYSBmdW5jdGlvbiB0aGF0IGFjY2VwdHMgdGhlIGxhdHRlci4gIFJlbW92
ZSBpdCwgYXMgdGhlIGNhc3QgcHJldmVudHMKZnVydGhlciBjb21waWxlciBjaGVja3MuCgpTaWdu
ZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgot
LS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjR2Zi9jeGdiNHZmX21haW4uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjR2Zi9jeGdiNHZmX21h
aW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjR2Zi9jeGdiNHZmX21haW4u
YwppbmRleCBmNmZjMDg3NWQ1YjBhMjg1Li40YTA3YTczYzY3MmI1OTk2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9jaGVsc2lvL2N4Z2I0dmYvY3hnYjR2Zl9tYWluLmMKKysrIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiNHZmL2N4Z2I0dmZfbWFpbi5jCkBAIC0y
NDgwLDcgKzI0ODAsNyBAQCBzdGF0aWMgaW50IHNldHVwX2RlYnVnZnMoc3RydWN0IGFkYXB0ZXIg
KmFkYXB0ZXIpCiAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZGVidWdmc19maWxlcyk7IGkr
KykKIAkJZGVidWdmc19jcmVhdGVfZmlsZShkZWJ1Z2ZzX2ZpbGVzW2ldLm5hbWUsCiAJCQkJICAg
IGRlYnVnZnNfZmlsZXNbaV0ubW9kZSwKLQkJCQkgICAgYWRhcHRlci0+ZGVidWdmc19yb290LCAo
dm9pZCAqKWFkYXB0ZXIsCisJCQkJICAgIGFkYXB0ZXItPmRlYnVnZnNfcm9vdCwgYWRhcHRlciwK
IAkJCQkgICAgZGVidWdmc19maWxlc1tpXS5mb3BzKTsKIAogCXJldHVybiAwOwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
