Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A516DFE6B
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 09:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754FD6E40F;
	Tue, 22 Oct 2019 07:40:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 21 Oct 2019 14:57:12 UTC
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775508921E
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 14:57:12 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by xavier.telenet-ops.be with bizsmtp
 id GErr2100B05gfCL01ErrRZ; Mon, 21 Oct 2019 16:52:08 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2E-00075h-Vs; Mon, 21 Oct 2019 16:51:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2E-0008FR-UG; Mon, 21 Oct 2019 16:51:50 +0200
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
Subject: [PATCH 1/5] crypto: nx - Improve debugfs_create_u{32,
 64}() handling for atomics
Date: Mon, 21 Oct 2019 16:51:45 +0200
Message-Id: <20191021145149.31657-2-geert+renesas@glider.be>
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

VmFyaWFibGVzIG9mIHR5cGUgYXRvbWljeyw2NH1fdCBjYW4gYmUgdXNlZCBmaW5lIHdpdGgKZGVi
dWdmc19jcmVhdGVfdXszMiw2NH0sIHdoZW4gcGFzc2luZyBhIHBvaW50ZXIgdG8gdGhlIGVtYmVk
ZGVkIGNvdW50ZXIuClRoaXMgYWxsb3dzIHRvIGdldCByaWQgb2YgdGhlIGNhc3RzLCB3aGljaCBw
cmV2ZW50ZWQgY29tcGlsZXIgY2hlY2tzLgoKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KLS0tCiBkcml2ZXJzL2NyeXB0by9ueC9ueF9k
ZWJ1Z2ZzLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vbngv
bnhfZGVidWdmcy5jIGIvZHJpdmVycy9jcnlwdG8vbngvbnhfZGVidWdmcy5jCmluZGV4IGUwZDQ0
YTU1MTJhYjQ1NWIuLjE5NzViY2JlZTk5NzQ4MWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRv
L254L254X2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2NyeXB0by9ueC9ueF9kZWJ1Z2ZzLmMKQEAg
LTM4LDIzICszOCwyMyBAQCB2b2lkIG54X2RlYnVnZnNfaW5pdChzdHJ1Y3QgbnhfY3J5cHRvX2Ry
aXZlciAqZHJ2KQogCWRydi0+ZGZzX3Jvb3QgPSByb290OwogCiAJZGVidWdmc19jcmVhdGVfdTMy
KCJhZXNfb3BzIiwgU19JUlVTUiB8IFNfSVJHUlAgfCBTX0lST1RILAotCQkJICAgcm9vdCwgKHUz
MiAqKSZkcnYtPnN0YXRzLmFlc19vcHMpOworCQkJICAgcm9vdCwgJmRydi0+c3RhdHMuYWVzX29w
cy5jb3VudGVyKTsKIAlkZWJ1Z2ZzX2NyZWF0ZV91MzIoInNoYTI1Nl9vcHMiLCBTX0lSVVNSIHwg
U19JUkdSUCB8IFNfSVJPVEgsCi0JCQkgICByb290LCAodTMyICopJmRydi0+c3RhdHMuc2hhMjU2
X29wcyk7CisJCQkgICByb290LCAmZHJ2LT5zdGF0cy5zaGEyNTZfb3BzLmNvdW50ZXIpOwogCWRl
YnVnZnNfY3JlYXRlX3UzMigic2hhNTEyX29wcyIsIFNfSVJVU1IgfCBTX0lSR1JQIHwgU19JUk9U
SCwKLQkJCSAgIHJvb3QsICh1MzIgKikmZHJ2LT5zdGF0cy5zaGE1MTJfb3BzKTsKKwkJCSAgIHJv
b3QsICZkcnYtPnN0YXRzLnNoYTUxMl9vcHMuY291bnRlcik7CiAJZGVidWdmc19jcmVhdGVfdTY0
KCJhZXNfYnl0ZXMiLCBTX0lSVVNSIHwgU19JUkdSUCB8IFNfSVJPVEgsCi0JCQkgICByb290LCAo
dTY0ICopJmRydi0+c3RhdHMuYWVzX2J5dGVzKTsKKwkJCSAgIHJvb3QsICZkcnYtPnN0YXRzLmFl
c19ieXRlcy5jb3VudGVyKTsKIAlkZWJ1Z2ZzX2NyZWF0ZV91NjQoInNoYTI1Nl9ieXRlcyIsIFNf
SVJVU1IgfCBTX0lSR1JQIHwgU19JUk9USCwKLQkJCSAgIHJvb3QsICh1NjQgKikmZHJ2LT5zdGF0
cy5zaGEyNTZfYnl0ZXMpOworCQkJICAgcm9vdCwgJmRydi0+c3RhdHMuc2hhMjU2X2J5dGVzLmNv
dW50ZXIpOwogCWRlYnVnZnNfY3JlYXRlX3U2NCgic2hhNTEyX2J5dGVzIiwgU19JUlVTUiB8IFNf
SVJHUlAgfCBTX0lST1RILAotCQkJICAgcm9vdCwgKHU2NCAqKSZkcnYtPnN0YXRzLnNoYTUxMl9i
eXRlcyk7CisJCQkgICByb290LCAmZHJ2LT5zdGF0cy5zaGE1MTJfYnl0ZXMuY291bnRlcik7CiAJ
ZGVidWdmc19jcmVhdGVfdTMyKCJlcnJvcnMiLCBTX0lSVVNSIHwgU19JUkdSUCB8IFNfSVJPVEgs
Ci0JCQkgICByb290LCAodTMyICopJmRydi0+c3RhdHMuZXJyb3JzKTsKKwkJCSAgIHJvb3QsICZk
cnYtPnN0YXRzLmVycm9ycy5jb3VudGVyKTsKIAlkZWJ1Z2ZzX2NyZWF0ZV91MzIoImxhc3RfZXJy
b3IiLCBTX0lSVVNSIHwgU19JUkdSUCB8IFNfSVJPVEgsCi0JCQkgICByb290LCAodTMyICopJmRy
di0+c3RhdHMubGFzdF9lcnJvcik7CisJCQkgICByb290LCAmZHJ2LT5zdGF0cy5sYXN0X2Vycm9y
LmNvdW50ZXIpOwogCWRlYnVnZnNfY3JlYXRlX3UzMigibGFzdF9lcnJvcl9waWQiLCBTX0lSVVNS
IHwgU19JUkdSUCB8IFNfSVJPVEgsCi0JCQkgICByb290LCAodTMyICopJmRydi0+c3RhdHMubGFz
dF9lcnJvcl9waWQpOworCQkJICAgcm9vdCwgJmRydi0+c3RhdHMubGFzdF9lcnJvcl9waWQuY291
bnRlcik7CiB9CiAKIHZvaWQKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
