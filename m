Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D74A62EA
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 09:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDB6896E5;
	Tue,  3 Sep 2019 07:43:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884AD8997E;
 Mon,  2 Sep 2019 08:33:50 +0000 (UTC)
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1i4hmV-0001ln-NX; Mon, 02 Sep 2019 08:33:48 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com
Subject: [PATCH] drm/amd/display: Restore backlight brightness after system
 resume
Date: Mon,  2 Sep 2019 16:33:42 +0800
Message-Id: <20190902083342.27393-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 03 Sep 2019 07:43:23 +0000
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
Cc: stable@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TGFwdG9wcyB3aXRoIEFNRCBBUFUgZG9lc24ndCByZXN0b3JlIGRpc3BsYXkgYmFja2xpZ2h0IGJy
aWdodG5lc3MgYWZ0ZXIKc3lzdGVtIHJlc3VtZS4KClRoaXMgaXNzdWUgc3RhcnRlZCB3aGVuIERD
IHdhcyBpbnRyb2R1Y2VkLgoKTGV0J3MgdXNlIEJMX0NPUkVfU1VTUEVORFJFU1VNRSBzbyB0aGUg
YmFja2xpZ2h0IGNvcmUgY2FsbHMKdXBkYXRlX3N0YXR1cyBjYWxsYmFjayBhZnRlciBzeXN0ZW0g
cmVzdW1lIHRvIHJlc3RvcmUgdGhlIGJhY2tsaWdodApsZXZlbC4KClRlc3RlZCBvbiBEZWxsIElu
c3Bpcm9uIDMxODAgKFN0b25leSBSaWRnZSkgYW5kIERlbGwgTGF0aXR1ZGUgNTQ5NQooUmF2ZW4g
UmlkZ2UpLgoKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBLYWkt
SGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggMWIwOTQ5ZGQ3ODA4Li4xODNlZjE4YWM2ZjMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwpAQCAtMjExMSw2ICsyMTExLDcgQEAgc3RhdGljIGludCBhbWRncHVfZG1fYmFja2xpZ2h0X2dl
dF9icmlnaHRuZXNzKHN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpiZCkKIH0KIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGFtZGdwdV9kbV9iYWNrbGlnaHRfb3BzID0geworCS5v
cHRpb25zID0gQkxfQ09SRV9TVVNQRU5EUkVTVU1FLAogCS5nZXRfYnJpZ2h0bmVzcyA9IGFtZGdw
dV9kbV9iYWNrbGlnaHRfZ2V0X2JyaWdodG5lc3MsCiAJLnVwZGF0ZV9zdGF0dXMJPSBhbWRncHVf
ZG1fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMsCiB9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
