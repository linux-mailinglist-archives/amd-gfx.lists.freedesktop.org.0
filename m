Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B80E371ACF
	for <lists+amd-gfx@lfdr.de>; Mon,  3 May 2021 18:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749E46E9B2;
	Mon,  3 May 2021 16:41:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EEE6E9B2;
 Mon,  3 May 2021 16:40:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DA956193F;
 Mon,  3 May 2021 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620060059;
 bh=xaY0MHIR9143KmI75c50pWTwSZOaC+O3togLGV+jeGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n+ckPV/3xMxVFYnNqD/XSRGzCnC0uJLw8HQFYSDH7eK9CsEmXWCcdy3lnHP0RW7+J
 itXPXCDzFFP5d8cYiRg2XEItN11/2d+dG8q/rQRrEs48put0mKR/Pv4iqAA9pxEWBp
 LygVnXvT8YA6KzdZWHfhbtklju550TWddyGa/f+bBAwoSu61Sl0wPQ9/eVnrAwUxo8
 qBpiACw2PZGkd/dwIi1DjEajnHTvdVSa9RO2fXH4/A5658bix8j87NJkAHuq7P/xTm
 Pfwdz/HeopGgxA8+CTvizVcCw+JzIDu6JXE8QHOf5BFAFgaxJAvg4V6exCrp/dDSM7
 vF0+flCV4z4hQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 51/57] drm/amdgpu: fix NULL pointer dereference
Date: Mon,  3 May 2021 12:39:35 -0400
Message-Id: <20210503163941.2853291-51-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163941.2853291-1-sashal@kernel.org>
References: <20210503163941.2853291-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Guchun Chen <guchun.chen@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCAzYzNkYzY1NDMzM2Y2Mzg5ODAzY2RjYWYwMzkxMmU5NDE3M2FlNTEwIF0KCnR0bS0+c2cgbmVl
ZHMgdG8gYmUgY2hlY2tlZCBiZWZvcmUgYWNjZXNzaW5nIGl0cyBjaGlsZCBtZW1iZXIuCgpDYWxs
IFRyYWNlOgogYW1kZ3B1X3R0bV9iYWNrZW5kX2Rlc3Ryb3krMHgxMi8weDcwIFthbWRncHVdCiB0
dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZSsweDNhLzB4NjAgW3R0bV0KIHR0bV9ib19yZWxlYXNl
KzB4MTdkLzB4MzAwIFt0dG1dCiBhbWRncHVfYm9fdW5yZWYrMHgxYS8weDMwIFthbWRncHVdCiBh
bWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9ncHUrMHg3OGIvMHg4YjAgW2FtZGdw
dV0KIGtmZF9pb2N0bF9hbGxvY19tZW1vcnlfb2ZfZ3B1KzB4MTE4LzB4MjIwIFthbWRncHVdCiBr
ZmRfaW9jdGwrMHgyMjIvMHg0MDAgW2FtZGdwdV0KID8ga2ZkX2Rldl9pc19sYXJnZV9iYXIrMHg5
MC8weDkwIFthbWRncHVdCiBfX3g2NF9zeXNfaW9jdGwrMHg4ZS8weGQwCiA/IF9fY29udGV4dF90
cmFja2luZ19leGl0KzB4NTIvMHg5MAogZG9fc3lzY2FsbF82NCsweDMzLzB4ODAKIGVudHJ5X1NZ
U0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKUklQOiAwMDMzOjB4N2Y5N2YyNjRkMzE3
CkNvZGU6IGIzIDY2IDkwIDQ4IDhiIDA1IDcxIDRiIDJkIDAwIDY0IGM3IDAwIDI2IDAwIDAwIDAw
IDQ4IGM3IGMwIGZmIGZmIGZmIGZmIGMzIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGI4
IDEwIDAwIDAwIDAwIDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggOGIgMGQg
NDEgNGIgMmQgMDAgZjcgZDggNjQgODkgMDEgNDgKUlNQOiAwMDJiOjAwMDA3ZmZkYjQwMmMzMzgg
RUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDAxMApSQVg6IGZmZmZmZmZm
ZmZmZmZmZGEgUkJYOiAwMDAwN2Y5N2YzY2M2M2EwIFJDWDogMDAwMDdmOTdmMjY0ZDMxNwpSRFg6
IDAwMDA3ZmZkYjQwMmMzODAgUlNJOiAwMDAwMDAwMGMwMjg0YjE2IFJESTogMDAwMDAwMDAwMDAw
MDAwMwpSQlA6IDAwMDA3ZmZkYjQwMmMzODAgUjA4OiAwMDAwN2ZmZGI0MDJjNDI4IFIwOTogMDAw
MDAwMDBjNDAwMDAwNApSMTA6IDAwMDAwMDAwYzQwMDAwMDQgUjExOiAwMDAwMDAwMDAwMDAwMjQ2
IFIxMjogMDAwMDAwMDBjMDI4NGIxNgpSMTM6IDAwMDAwMDAwMDAwMDAwMDMgUjE0OiAwMDAwN2Y5
N2YzY2M2M2EwIFIxNTogMDAwMDdmODgzNjIwMDAwMAoKU2lnbmVkLW9mZi1ieTogR3VjaHVuIENo
ZW4gPGd1Y2h1bi5jaGVuQGFtZC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBr
ZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCBjNmExZGZlNzllODAuLjkx
ZTNhODdiMWRlOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAt
OTg0LDcgKzk4NCw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fdHRfdW5waW5fdXNlcnB0cihz
dHJ1Y3QgdHRtX3R0ICp0dG0pCiAJCURNQV9CSURJUkVDVElPTkFMIDogRE1BX1RPX0RFVklDRTsK
IAogCS8qIGRvdWJsZSBjaGVjayB0aGF0IHdlIGRvbid0IGZyZWUgdGhlIHRhYmxlIHR3aWNlICov
Ci0JaWYgKCF0dG0tPnNnLT5zZ2wpCisJaWYgKCF0dG0tPnNnIHx8ICF0dG0tPnNnLT5zZ2wpCiAJ
CXJldHVybjsKIAogCS8qIHVubWFwIHRoZSBwYWdlcyBtYXBwZWQgdG8gdGhlIGRldmljZSAqLwot
LSAKMi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
