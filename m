Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7D338E9F5
	for <lists+amd-gfx@lfdr.de>; Mon, 24 May 2021 16:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E476E879;
	Mon, 24 May 2021 14:50:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845C06E870;
 Mon, 24 May 2021 14:50:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8612B61585;
 Mon, 24 May 2021 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867839;
 bh=k5C6B80V97/999w9lzY6hsrf7kvKwJWQtz5GjPSoiEQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NW5XykB43nvs9YK2vOiQLnhR1Lk0YgFI6vyh/bSV64uHqFEfb3Q3teFeFV7i4mZX4
 Qpg4W81BjEZtj8uk47vq4a8ZetcPSG44M39jFeI9ysp45qNhMKI0of7iGOj3vN8nVP
 bfxEfVJqHejQhdMV/mqlCtDbD44Xit0Y9LxXof7E0TDZeQnmFMEL0Uj+ff/iZzSyaR
 c7+TdGAGeXUGrubv4MHUIE9nsjIXICSUeSQxeNmswmWKLWXWlrvXB91Dg8OX9hK3Lb
 iN6xpFmPLCOhonzgTKSx5cXBau05rfMHUlduxLPHVbvIVZVV5NPTEdrTF/ZdFSFeMd
 pVXohdo7VNS4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 25/25] drm/amdgpu: Fix a use-after-free
Date: Mon, 24 May 2021 10:50:08 -0400
Message-Id: <20210524145008.2499049-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524145008.2499049-1-sashal@kernel.org>
References: <20210524145008.2499049-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, xinhui pan <xinhui.pan@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
MWU1YzM3Mzg1MDk3YzM1OTExYjBmOGEwYzY3ZmZkMTBlZTFhZjlhMiBdCgpsb29rcyBsaWtlIHdl
IGZvcmdldCB0byBzZXQgdHRtLT5zZyB0byBOVUxMLgpIaXQgcGFuaWMgYmVsb3cKClsgMTIzNS44
NDQxMDRdIGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdCwgcHJvYmFibHkgZm9yIG5vbi1jYW5vbmlj
YWwgYWRkcmVzcyAweDZiNmI2YjZiNmI2YjdiNGI6IDAwMDAgWyMxXSBTTVAgREVCVUdfUEFHRUFM
TE9DIE5PUFRJClsgMTIzNS45ODkwNzRdIENhbGwgVHJhY2U6ClsgMTIzNS45OTE3NTFdICBzZ19m
cmVlX3RhYmxlKzB4MTcvMHgyMApbIDEyMzUuOTk1NjY3XSAgYW1kZ3B1X3R0bV9iYWNrZW5kX3Vu
YmluZC5jb2xkKzB4NGQvMHhmNyBbYW1kZ3B1XQpbIDEyMzYuMDAyMjg4XSAgYW1kZ3B1X3R0bV9i
YWNrZW5kX2Rlc3Ryb3krMHgyOS8weDEzMCBbYW1kZ3B1XQpbIDEyMzYuMDA4NDY0XSAgdHRtX3R0
X2Rlc3Ryb3krMHgxZS8weDMwIFt0dG1dClsgMTIzNi4wMTMwNjZdICB0dG1fYm9fY2xlYW51cF9t
ZW10eXBlX3VzZSsweDUxLzB4YTAgW3R0bV0KWyAxMjM2LjAxODc4M10gIHR0bV9ib19yZWxlYXNl
KzB4MjYyLzB4YTUwIFt0dG1dClsgMTIzNi4wMjM1NDddICB0dG1fYm9fcHV0KzB4ODIvMHhkMCBb
dHRtXQpbIDEyMzYuMDI3NzY2XSAgYW1kZ3B1X2JvX3VucmVmKzB4MjYvMHg1MCBbYW1kZ3B1XQpb
IDEyMzYuMDMyODA5XSAgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KzB4
N2FhLzB4ZDkwIFthbWRncHVdClsgMTIzNi4wNDA0MDBdICBrZmRfaW9jdGxfYWxsb2NfbWVtb3J5
X29mX2dwdSsweGUyLzB4MzMwIFthbWRncHVdClsgMTIzNi4wNDY5MTJdICBrZmRfaW9jdGwrMHg0
NjMvMHg2OTAgW2FtZGdwdV0KClNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhpbmh1aS5wYW5A
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMKaW5kZXggNzU3ZmE0ODZhYWM0Li41MDgwN2Q2MjFlY2EgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTEyNzcsNiArMTI3Nyw3IEBAIHN0YXRpYyB2b2lk
IGFtZGdwdV90dG1fdHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX3R0ICp0dG0pCiAJaWYgKGd0dCAm
JiBndHQtPnVzZXJwdHIpIHsKIAkJYW1kZ3B1X3R0bV90dF9zZXRfdXNlcl9wYWdlcyh0dG0sIE5V
TEwpOwogCQlrZnJlZSh0dG0tPnNnKTsKKwkJdHRtLT5zZyA9IE5VTEw7CiAJCXR0bS0+cGFnZV9m
bGFncyAmPSB+VFRNX1BBR0VfRkxBR19TRzsKIAkJcmV0dXJuOwogCX0KLS0gCjIuMzAuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
