Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA39A3E6B
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 21:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F87F6E12A;
	Fri, 30 Aug 2019 19:32:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787B56E375;
 Fri, 30 Aug 2019 16:33:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 233AFACEC;
 Fri, 30 Aug 2019 16:15:33 +0000 (UTC)
Date: Fri, 30 Aug 2019 18:15:41 +0200
From: Jean Delvare <jdelvare@suse.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/edid: don't log errors on absent CEA SAD blocks
Message-ID: <20190830181541.7d2be23d@endymion>
In-Reply-To: <20190830181423.4f31a28f@endymion>
References: <20190830181423.4f31a28f@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 19:32:17 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Christian =?UTF-8?B?S8O2?=
 =?UTF-8?B?bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQgaXMgZmluZSBmb3IgZGlzcGxheXMgd2l0aG91dCBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIG5v
dCBwcm92aWRlCmFueSBTQUQgYmxvY2sgaW4gdGhlaXIgRURJRC4gRG8gbm90IGxvZyBhbiBlcnJv
ciBpbiB0aGF0IGNhc2UsCmp1c3QgcmV0dXJuIHF1aWV0bHkuCgpJbnNwaXJlZCBieSBhIHNpbWls
YXIgZml4IHRvIHRoZSBhbWRncHUgZHJpdmVyIGluIHRoZSBjb250ZXh0IG9mIGJ1ZwpmZG8jMTA3
ODI1OgpodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDc4MjUK
ClNpZ25lZC1vZmYtYnk6IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5kZT4KQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogIkRhdmlkIChDaHVuTWluZykgWmhvdSIg
PERhdmlkMS5aaG91QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fYXVkaW8uYyB8ICAgIDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tLSBsaW51eC01LjIub3JpZy9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jCTIwMTktMDgtMzAgMTg6MDQ6MTUuMTI1MDU2Njk3
ICswMjAwCisrKyBsaW51eC01LjIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8u
YwkyMDE5LTA4LTMwIDE4OjA0OjM1LjA3ODMxMTM0NyArMDIwMApAQCAtMzY3LDEwICszNjcsMTAg
QEAgc3RhdGljIHZvaWQgcmFkZW9uX2F1ZGlvX3dyaXRlX3NhZF9yZWdzKAogCQlyZXR1cm47CiAK
IAlzYWRfY291bnQgPSBkcm1fZWRpZF90b19zYWQocmFkZW9uX2Nvbm5lY3Rvcl9lZGlkKGNvbm5l
Y3RvciksICZzYWRzKTsKLQlpZiAoc2FkX2NvdW50IDw9IDApIHsKKwlpZiAoc2FkX2NvdW50IDwg
MCkKIAkJRFJNX0VSUk9SKCJDb3VsZG4ndCByZWFkIFNBRHM6ICVkXG4iLCBzYWRfY291bnQpOwor
CWlmIChzYWRfY291bnQgPD0gMCkKIAkJcmV0dXJuOwotCX0KIAlCVUdfT04oIXNhZHMpOwogCiAJ
aWYgKHJhZGVvbl9lbmNvZGVyLT5hdWRpbyAmJiByYWRlb25fZW5jb2Rlci0+YXVkaW8tPndyaXRl
X3NhZF9yZWdzKQoKLS0gCkplYW4gRGVsdmFyZQpTVVNFIEwzIFN1cHBvcnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
