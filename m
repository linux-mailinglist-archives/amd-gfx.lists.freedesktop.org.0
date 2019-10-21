Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9805BDFE6E
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 09:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9331D6E415;
	Tue, 22 Oct 2019 07:40:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A13F6E14C
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 14:57:12 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by andre.telenet-ops.be with bizsmtp
 id GErr2100E05gfCL01Erri3; Mon, 21 Oct 2019 16:52:09 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2F-000767-52; Mon, 21 Oct 2019 16:51:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMZ2F-0008Fi-1d; Mon, 21 Oct 2019 16:51:51 +0200
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
Subject: [PATCH 5/5] ionic: Use debugfs_create_bool() to export bool
Date: Mon, 21 Oct 2019 16:51:49 +0200
Message-Id: <20191021145149.31657-6-geert+renesas@glider.be>
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

Q3VycmVudGx5IGJvb2wgaW9uaWNfY3EuZG9uZV9jb2xvciBpcyBleHBvcnRlZCB1c2luZwpkZWJ1
Z2ZzX2NyZWF0ZV91OCgpLCB3aGljaCByZXF1aXJlcyBhIGNhc3QsIHByZXZlbnRpbmcgZnVydGhl
ciBjb21waWxlcgpjaGVja3MuCgpGaXggdGhpcyBieSBzd2l0Y2hpbmcgdG8gZGVidWdmc19jcmVh
dGVfYm9vbCgpLCBhbmQgZHJvcHBpbmcgdGhlIGNhc3QuCgpTaWduZWQtb2ZmLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgotLS0KIGRyaXZlcnMvbmV0L2V0
aGVybmV0L3BlbnNhbmRvL2lvbmljL2lvbmljX2RlYnVnZnMuYyB8IDMgKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvcGVuc2FuZG8vaW9uaWMvaW9uaWNfZGVidWdmcy5jIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvcGVuc2FuZG8vaW9uaWMvaW9uaWNfZGVidWdmcy5jCmluZGV4IGJjMDNjZWNm
ODBjYzllYjQuLjViZWJhOTE1ZjY5ZDEyZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3BlbnNhbmRvL2lvbmljL2lvbmljX2RlYnVnZnMuYworKysgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9wZW5zYW5kby9pb25pYy9pb25pY19kZWJ1Z2ZzLmMKQEAgLTE3MCw4ICsxNzAsNyBAQCB2
b2lkIGlvbmljX2RlYnVnZnNfYWRkX3FjcShzdHJ1Y3QgaW9uaWNfbGlmICpsaWYsIHN0cnVjdCBp
b25pY19xY3EgKnFjcSkKIAlkZWJ1Z2ZzX2NyZWF0ZV94NjQoImJhc2VfcGEiLCAwNDAwLCBjcV9k
ZW50cnksICZjcS0+YmFzZV9wYSk7CiAJZGVidWdmc19jcmVhdGVfdTMyKCJudW1fZGVzY3MiLCAw
NDAwLCBjcV9kZW50cnksICZjcS0+bnVtX2Rlc2NzKTsKIAlkZWJ1Z2ZzX2NyZWF0ZV91MzIoImRl
c2Nfc2l6ZSIsIDA0MDAsIGNxX2RlbnRyeSwgJmNxLT5kZXNjX3NpemUpOwotCWRlYnVnZnNfY3Jl
YXRlX3U4KCJkb25lX2NvbG9yIiwgMDQwMCwgY3FfZGVudHJ5LAotCQkJICAodTggKikmY3EtPmRv
bmVfY29sb3IpOworCWRlYnVnZnNfY3JlYXRlX2Jvb2woImRvbmVfY29sb3IiLCAwNDAwLCBjcV9k
ZW50cnksICZjcS0+ZG9uZV9jb2xvcik7CiAKIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJ0YWlsIiwg
MDQwMCwgY3FfZGVudHJ5LCBjcSwgJmNxX3RhaWxfZm9wcyk7CiAKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
