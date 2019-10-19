Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4CDE000
	for <lists+amd-gfx@lfdr.de>; Sun, 20 Oct 2019 20:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B39B89A76;
	Sun, 20 Oct 2019 18:21:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 341 seconds by postgrey-1.36 at gabe;
 Sat, 19 Oct 2019 07:30:22 UTC
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98C189F5F
 for <amd-gfx@lists.freedesktop.org>; Sat, 19 Oct 2019 07:30:22 +0000 (UTC)
Received: from MTA-10-4.privateemail.com (mta-10.privateemail.com
 [68.65.122.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 788D38009B;
 Sat, 19 Oct 2019 03:24:40 -0400 (EDT)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 2144160038;
 Sat, 19 Oct 2019 03:24:39 -0400 (EDT)
Received: from wambui.zuku.co.ke (unknown [10.20.151.221])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id A45FA60033;
 Sat, 19 Oct 2019 07:24:35 +0000 (UTC)
From: Wambui Karuga <wambui@karuga.xyz>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/amdgpu: make undeclared variables static
Date: Sat, 19 Oct 2019 10:24:26 +0300
Message-Id: <20191019072426.20535-1-wambui@karuga.xyz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 20 Oct 2019 18:21:20 +0000
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
Cc: David1.Zhou@amd.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
 daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TWFrZSB0aGUgYGFtZGdwdV9sb2NrdXBfdGltZW91dGAgYW5kIGBhbWRncHVfZXhwX2h3X3N1cHBv
cnRgIHZhcmlhYmxlcwpzdGF0aWMgdG8gcmVtb3ZlIHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5p
bmdzOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmM6MTAzOjE5OiB3YXJu
aW5nOiBzeW1ib2wgJ2FtZGdwdV9sb2NrdXBfdGltZW91dCcgd2FzIG5vdCBkZWNsYXJlZC4gU2hv
dWxkIGl0IGJlIHN0YXRpYz8KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
OjExNzoxODogd2FybmluZzogc3ltYm9sICdhbWRncHVfZXhwX2h3X3N1cHBvcnQnIHdhcyBub3Qg
ZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpTaWduZWQtb2ZmLWJ5OiBXYW1idWkgS2Fy
dWdhIDx3YW1idWlAa2FydWdhLnh5ej4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4
IDNmYWUxMDA3MTQzZS4uYzViM2MwYzkxOTNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jCkBAIC0xMDAsNyArMTAwLDcgQEAgaW50IGFtZGdwdV9kaXNwX3ByaW9yaXR5
ID0gMDsKIGludCBhbWRncHVfaHdfaTJjID0gMDsKIGludCBhbWRncHVfcGNpZV9nZW4yID0gLTE7
CiBpbnQgYW1kZ3B1X21zaSA9IC0xOwotY2hhciBhbWRncHVfbG9ja3VwX3RpbWVvdXRbQU1ER1BV
X01BWF9USU1FT1VUX1BBUkFNX0xFTlRIXTsKK3N0YXRpYyBjaGFyIGFtZGdwdV9sb2NrdXBfdGlt
ZW91dFtBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1fTEVOVEhdOwogaW50IGFtZGdwdV9kcG0gPSAt
MTsKIGludCBhbWRncHVfZndfbG9hZF90eXBlID0gLTE7CiBpbnQgYW1kZ3B1X2FzcG0gPSAtMTsK
QEAgLTExNCw3ICsxMTQsNyBAQCBpbnQgYW1kZ3B1X3ZtX2Jsb2NrX3NpemUgPSAtMTsKIGludCBh
bWRncHVfdm1fZmF1bHRfc3RvcCA9IDA7CiBpbnQgYW1kZ3B1X3ZtX2RlYnVnID0gMDsKIGludCBh
bWRncHVfdm1fdXBkYXRlX21vZGUgPSAtMTsKLWludCBhbWRncHVfZXhwX2h3X3N1cHBvcnQgPSAw
Oworc3RhdGljIGludCBhbWRncHVfZXhwX2h3X3N1cHBvcnQ7CiBpbnQgYW1kZ3B1X2RjID0gLTE7
CiBpbnQgYW1kZ3B1X3NjaGVkX2pvYnMgPSAzMjsKIGludCBhbWRncHVfc2NoZWRfaHdfc3VibWlz
c2lvbiA9IDI7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
