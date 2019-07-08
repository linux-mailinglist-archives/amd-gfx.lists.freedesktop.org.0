Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203D6204C
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 16:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EB389E5F;
	Mon,  8 Jul 2019 14:17:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86D689DB5
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 14:13:42 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M89P3-1ho4wp0FFr-005MGd; Mon, 08 Jul 2019 16:08:28 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/amd/powerplay: vega20: fix uninitialized variable use
Date: Mon,  8 Jul 2019 16:07:59 +0200
Message-Id: <20190708140816.1334640-2-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190708140816.1334640-1-arnd@arndb.de>
References: <20190708140816.1334640-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:NyfhK5Y4jz7Zauo0keyLsO1GaKfDaYS9PZtk4wBhZX4qB8ZPG7o
 XAcUVBB10BKXLj+ZVSeTI0D/l0efVGJTE5jS5oIEgaFpES91kHGCZp7xFl+VVFnyf2qjvYb
 2fB+TOUjE1u/eR4fhGyZ2JdQcYLO2UnbqY0jmhrnxJuGyQOSHKgFFx/hNbUk/9FeK4dtLtA
 Oxe6uhkvKx0J1PnP+d+xQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:slBYKL2Vbak=:vsqh45N8IvghXos5EQOMzT
 +unS+ofsAKElcQ1xelkddvZhR3x2osZPggATfGgjG7zYpaGNf5+6diB++yscreEVS53txXS6X
 oY9me7vYQNy4XvAmhmVGr/ty9pLMJiCsKj/eAaM7SqH3tYsorwfJUt1RBB2lvy0PT2QYM7JuH
 d7KZt8lpulvvyhTSciKZZ0SWnOk/9T4u6a9WPwD2thK96Ld45hGTzv98jiXzz0VTWfQV8M9ea
 SRcDFi+d40dgq6pcB5huQzGA7vbQj057+QGq6dqjpSZirpiGz0NGzLx0Kf7I0qg5+Yaf/kEPl
 PVe822BVD9Bqil/Rlysd5wPcgjPthlat06N6DQ1FAOuhJIiN0P3QP1Tmc+BqcjJbVulnNnN6g
 fVi8HzDxULcnng6gA5gb0Ma70nqbtAPMVFCCW2QzWlUX4IFYqqHxd9IxQ4KNQLU+TGZj4t3t8
 atqSZbsbgQPD590sooNmpWAr7++aLMSIpLs52dwQKw2hLZpt2Moqz8Nu0btdRHAN368fbybyH
 wCGCdOnBMvMgzF09k1P/6M15fIJIKJpULxNc2xswIvjvz9GG26ScbBU2CdXcaDTeKMYx2CzJV
 f3V1DTuLd2C6VYi6fcr4sjP0KKwu7RjhVrCcAmV2vwevEjCI+UNMxeRhc62vQzJxTWDDzjPLx
 C2gKTgKFP9Y1YPy6TTvhMHDqMyMUd8v7VPBujh9z9la+ztiFp3nrPgk7LIBjL8UHMpy6uNfPT
 afHtq69zc3KVGfh8FSz7TlSYKWMeRPSL8RVkXA==
X-Mailman-Approved-At: Mon, 08 Jul 2019 14:17:21 +0000
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
Cc: Chengming Gui <Jack.Gui@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Wang <kevin1.wang@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SWYgc211X2dldF9jdXJyZW50X3JwbSgpIGZhaWxzLCB3ZSBjYW4ndCB1c2UgdGhlIG91dHB1dCwK
YXMgdGhhdCBtYXkgYmUgdW5pbml0aWFsaXplZDoKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL3Bvd2VycGxheS92ZWdhMjBfcHB0LmM6MzAyMzo4OiBlcnJvcjogdmFyaWFibGUgJ2N1cnJl
bnRfcnBtJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgd2hlbmV2ZXIgJz86JyBjb25kaXRpb24gaXMg
ZmFsc2UgWy1XZXJyb3IsLVdzb21ldGltZXMtdW5pbml0aWFsaXplZF0KICAgICAgICByZXQgPSBz
bXVfZ2V0X2N1cnJlbnRfcnBtKHNtdSwgJmN1cnJlbnRfcnBtKTsKICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaDo3MzU6Mzogbm90ZTogZXhwYW5kZWQg
ZnJvbSBtYWNybyAnc211X2dldF9jdXJyZW50X3JwbScKICAgICAgICAoKHNtdSktPmZ1bmNzLT5n
ZXRfY3VycmVudF9ycG0gPyAoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X3JwbSgoc211KSwgKHNw
ZWVkKSkgOiAwKQogICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jOjMwMjQ6MTI6IG5v
dGU6IHVuaW5pdGlhbGl6ZWQgdXNlIG9jY3VycyBoZXJlCiAgICAgICAgcGVyY2VudCA9IGN1cnJl
bnRfcnBtICogMTAwIC8gcHB0YWJsZS0+RmFuTWF4aW11bVJwbTsKICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn4KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3ZlZ2Ey
MF9wcHQuYzozMDIzOjg6IG5vdGU6IHJlbW92ZSB0aGUgJz86JyBpZiBpdHMgY29uZGl0aW9uIGlz
IGFsd2F5cyB0cnVlCiAgICAgICAgcmV0ID0gc211X2dldF9jdXJyZW50X3JwbShzbXUsICZjdXJy
ZW50X3JwbSk7CiAgICAgICAgICAgICAgXgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9w
b3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaDo3MzU6Mzogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNy
byAnc211X2dldF9jdXJyZW50X3JwbScKICAgICAgICAoKHNtdSktPmZ1bmNzLT5nZXRfY3VycmVu
dF9ycG0gPyAoc211KS0+ZnVuY3MtPmdldF9jdXJyZW50X3JwbSgoc211KSwgKHNwZWVkKSkgOiAw
KQogICAgICAgICBeCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS92ZWdh
MjBfcHB0LmM6MzAyMDoyMjogbm90ZTogaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgJ2N1cnJlbnRf
cnBtJyB0byBzaWxlbmNlIHRoaXMgd2FybmluZwogICAgICAgIHVpbnQzMl90IGN1cnJlbnRfcnBt
OwoKUHJvcGFnYXRlIHRoZSBlcnJvciBjb2RlIGluIHRoYXQgY2FzZS4KCkZpeGVzOiBlZTBkYjgy
MDI3ZWUgKCJkcm0vYW1kL3Bvd2VycGxheTogbW92ZSBQUFRhYmxlX3QgdXNlcyBpbnRvIGFzaWMg
bGV2ZWwiKQpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyB8IDUgKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKaW5kZXggOWNlM2YxYzhhZTBmLi4yMGQ0
NzdmOGRjODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2Ey
MF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMK
QEAgLTMwMjEsMTAgKzMwMjEsMTMgQEAgc3RhdGljIGludCB2ZWdhMjBfZ2V0X2Zhbl9zcGVlZF9w
ZXJjZW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCVBQVGFibGVfdCAqcHB0YWJsZSA9IHNt
dS0+c211X3RhYmxlLmRyaXZlcl9wcHRhYmxlOwogCiAJcmV0ID0gc211X2dldF9jdXJyZW50X3Jw
bShzbXUsICZjdXJyZW50X3JwbSk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwogCXBlcmNl
bnQgPSBjdXJyZW50X3JwbSAqIDEwMCAvIHBwdGFibGUtPkZhbk1heGltdW1ScG07CiAJKnNwZWVk
ID0gcGVyY2VudCA+IDEwMCA/IDEwMCA6IHBlcmNlbnQ7CiAKLQlyZXR1cm4gcmV0OworCXJldHVy
biAwOwogfQogCiBzdGF0aWMgaW50IHZlZ2EyMF9nZXRfZ3B1X3Bvd2VyKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LCB1aW50MzJfdCAqdmFsdWUpCi0tIAoyLjIwLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
