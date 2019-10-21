Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9DDFE70
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 09:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91626E419;
	Tue, 22 Oct 2019 07:40:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7936B6E149
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 14:57:12 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by andre.telenet-ops.be with bizsmtp
 id GErr2100C05gfCL01Erri2; Mon, 21 Oct 2019 16:52:09 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2F-00075u-3G; Mon, 21 Oct 2019 16:51:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2F-0008Fa-0U; Mon, 21 Oct 2019 16:51:51 +0200
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
Subject: [PATCH 4/5] power: avs: smartreflex: Remove superfluous cast in
 debugfs_create_file() call
Date: Mon, 21 Oct 2019 16:51:48 +0200
Message-Id: <20191021145149.31657-5-geert+renesas@glider.be>
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
LS0KIGRyaXZlcnMvcG93ZXIvYXZzL3NtYXJ0cmVmbGV4LmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Bv
d2VyL2F2cy9zbWFydHJlZmxleC5jIGIvZHJpdmVycy9wb3dlci9hdnMvc21hcnRyZWZsZXguYwpp
bmRleCA0Njg0ZTdkZjgzM2E4MWU5Li41Mzc2ZjNkMjJmMzFlYWRlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3Bvd2VyL2F2cy9zbWFydHJlZmxleC5jCisrKyBiL2RyaXZlcnMvcG93ZXIvYXZzL3NtYXJ0
cmVmbGV4LmMKQEAgLTkwNSw3ICs5MDUsNyBAQCBzdGF0aWMgaW50IG9tYXBfc3JfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzcl9pbmZvLT5kYmdfZGlyID0gZGVidWdmc19j
cmVhdGVfZGlyKHNyX2luZm8tPm5hbWUsIHNyX2RiZ19kaXIpOwogCiAJZGVidWdmc19jcmVhdGVf
ZmlsZSgiYXV0b2NvbXAiLCBTX0lSVUdPIHwgU19JV1VTUiwgc3JfaW5mby0+ZGJnX2RpciwKLQkJ
CSAgICAodm9pZCAqKXNyX2luZm8sICZwbV9zcl9mb3BzKTsKKwkJCSAgICBzcl9pbmZvLCAmcG1f
c3JfZm9wcyk7CiAJZGVidWdmc19jcmVhdGVfeDMyKCJlcnJ3ZWlnaHQiLCBTX0lSVUdPLCBzcl9p
bmZvLT5kYmdfZGlyLAogCQkJICAgJnNyX2luZm8tPmVycl93ZWlnaHQpOwogCWRlYnVnZnNfY3Jl
YXRlX3gzMigiZXJybWF4bGltaXQiLCBTX0lSVUdPLCBzcl9pbmZvLT5kYmdfZGlyLAotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
