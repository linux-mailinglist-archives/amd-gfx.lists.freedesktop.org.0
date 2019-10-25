Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF08E4CE2
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Oct 2019 15:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A763F6E9D3;
	Fri, 25 Oct 2019 13:56:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A590D6E9D3;
 Fri, 25 Oct 2019 13:56:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DEF221D7F;
 Fri, 25 Oct 2019 13:56:24 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 12/37] drm/amdgpu/display: Fix reload driver error
Date: Fri, 25 Oct 2019 09:55:36 -0400
Message-Id: <20191025135603.25093-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025135603.25093-1-sashal@kernel.org>
References: <20191025135603.25093-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572011785;
 bh=N76CoPzdJ7FfQP3LJQW2Rr6UIbvii3tkzOHeMY72w/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1jOBBl0JOuNBqPn4fUmlZXGtcUhQuczROkcGu0/+oJbDzDNI5DT6Ml/5XB50V9UDb
 r7Wol/VlsNiXjRDmpLApQgvofKn48iKfP1JiOvJue3ozRx06Bg0CI9yiYmkn+T7a8b
 leR1CVfCCdn1sz7JHGbxgfHmd50b5I0oHiPqcaqI=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
NTI2YzY1NGE4YTA2NDFkNDI4OWJmNjVlZmZkZTRkNjA5NWJkODM4NCBdCgpJc3N1ZToKV2lsbCBo
YXZlIGZvbGxvdyBlcnJvciB3aGVuIHJlbG9hZCBkcml2ZXI6ClsgMzk4Ni41Njc3MzldIHN5c2Zz
OiBjYW5ub3QgY3JlYXRlIGR1cGxpY2F0ZSBmaWxlbmFtZSAnL2RldmljZXMvcGNpMDAwMDowMC8w
MDAwOjAwOjA3LjAvZHJtX2RwX2F1eF9kZXYnClsgMzk4Ni41Njc3NDNdIENQVTogNiBQSUQ6IDE3
NjcgQ29tbTogbW9kcHJvYmUgVGFpbnRlZDogRyAgICAgICAgICAgT0UgICAgIDUuMC4wLXJjMS1j
dXN0b20gIzEKWyAzOTg2LjU2Nzc0NV0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAo
aTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgVWJ1bnR1LTEuOC4yLTF1YnVudHUxIDA0LzAxLzIw
MTQKWyAzOTg2LjU2Nzc0Nl0gQ2FsbCBUcmFjZToKLi4uLi4uClsgMzk4Ni41Njc4MDhdICBkcm1f
ZHBfYXV4X3JlZ2lzdGVyX2Rldm5vZGUrMHhkYy8weDE0MCBbZHJtX2ttc19oZWxwZXJdCi4uLi4u
LgpbIDM5ODYuNTY5MDgxXSBrb2JqZWN0X2FkZF9pbnRlcm5hbCBmYWlsZWQgZm9yIGRybV9kcF9h
dXhfZGV2IHdpdGggLUVFWElTVCwgZG9uJ3QgdHJ5IHRvIHJlZ2lzdGVyIHRoaW5ncyB3aXRoIHRo
ZSBzYW1lIG5hbWUgaW4gdGhlIHNhbWUgZGlyZWN0b3J5LgoKUmVwcm9kdWNlIHNlcXVlbmNlczoK
MS5tb2Rwcm9iZSBhbWRncHUKMi5tb2Rwcm9iZSAtciBhbWRncHUKMy5tb2Rwcm9iZSBhbWRncHUK
ClJvb3QgY2F1c2U6CldoZW4gdW5sb2FkIGRyaXZlciwgaXQgZG9lc24ndCB1bnJlZ2lzdGVyIGF1
eC4KCnYyOiBEb24ndCB1c2UgaGFzX2F1eAoKU2lnbmVkLW9mZi1ieTogRW1pbHkgRGVuZyA8RW1p
bHkuRGVuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9s
YXMua2F6bGF1c2thc0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIHwgMTUgKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDNiMDdhMzE2NjgwYzIuLjUyMDliNzYyNjIz
MTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYwpAQCAtMjg3MCw2ICsyODcwLDEzIEBAIGludCBhbWRncHVfZG1fY29ubmVjdG9yX2F0
b21pY19nZXRfcHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAlyZXR1
cm4gcmV0OwogfQogCitzdGF0aWMgdm9pZCBhbWRncHVfZG1fY29ubmVjdG9yX3VucmVnaXN0ZXIo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nv
bm5lY3RvciAqYW1kZ3B1X2RtX2Nvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29u
bmVjdG9yKTsKKworCWRybV9kcF9hdXhfdW5yZWdpc3RlcigmYW1kZ3B1X2RtX2Nvbm5lY3Rvci0+
ZG1fZHBfYXV4LmF1eCk7Cit9CisKIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25uZWN0b3JfZGVz
dHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVjdCBhbWRncHVf
ZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0
b3IpOwpAQCAtMjg4OSw2ICsyODk2LDExIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25uZWN0
b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogI2VuZGlmCiAJZHJt
X2Nvbm5lY3Rvcl91bnJlZ2lzdGVyKGNvbm5lY3Rvcik7CiAJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVw
KGNvbm5lY3Rvcik7CisJaWYgKGFjb25uZWN0b3ItPmkyYykgeworCQlpMmNfZGVsX2FkYXB0ZXIo
JmFjb25uZWN0b3ItPmkyYy0+YmFzZSk7CisJCWtmcmVlKGFjb25uZWN0b3ItPmkyYyk7CisJfQor
CiAJa2ZyZWUoY29ubmVjdG9yKTsKIH0KIApAQCAtMjk0Miw3ICsyOTU0LDggQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGFtZGdwdV9kbV9jb25uZWN0b3JfZnVuY3Mg
PSB7CiAJLmF0b21pY19kdXBsaWNhdGVfc3RhdGUgPSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21p
Y19kdXBsaWNhdGVfc3RhdGUsCiAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19o
ZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsCiAJLmF0b21pY19zZXRfcHJvcGVydHkgPSBh
bWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19zZXRfcHJvcGVydHksCi0JLmF0b21pY19nZXRfcHJv
cGVydHkgPSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19nZXRfcHJvcGVydHkKKwkuYXRvbWlj
X2dldF9wcm9wZXJ0eSA9IGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWljX2dldF9wcm9wZXJ0eSwK
KwkuZWFybHlfdW5yZWdpc3RlciA9IGFtZGdwdV9kbV9jb25uZWN0b3JfdW5yZWdpc3RlcgogfTsK
IAogc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqYmVzdF9lbmNvZGVyKHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
