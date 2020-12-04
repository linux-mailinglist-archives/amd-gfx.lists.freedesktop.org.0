Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD62CF22A
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Dec 2020 17:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3666E1B1;
	Fri,  4 Dec 2020 16:49:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40616E1B1
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Dec 2020 16:49:08 +0000 (UTC)
Date: Fri, 04 Dec 2020 16:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607100546;
 bh=21iEPpxY+78E8uT+3OzBIEINyf+wuXIJUmpgfBbI62Y=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Zu2evajfoeVTVRBoOoSRdOf8BcZdDvCf67luNfLJclPUx7hL8QzVCxZCQrh4GSLyh
 FoVjJr9qXjslcHS04AIVhTP5sPWJZ1pmiVUcRI8CJJQZ+UaSAF6L1rvyOf+0RW4XDZ
 AfCbiZHZMO5RRCQAKFZfhFwOE4B+G9OmfxT53ikC2YdgszY259N+iJlqy/R7LX220j
 wGIFrxbArTc9nX0xPTnEsM+Pv33o7jJ1vzIck+bLCuaINglnyBIe2ZE1o2RY9iMj39
 TxhT+HfREdUyvDrNU5BKGsnVxATGmfO+CUvKlx3hiqrOLI580UR2nCSqI8Fo6izbEJ
 gbgYAIrMGPvLw==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/2] drm/amd: print error on convert_tiling_flags_to_modifier
 failure
Message-ID: <VzE0LPxcEehXwGUjgu3nUHOAd2MMYp2hKFqOo4BSJY@cp3-web-021.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SWYgdGhpcyBmdW5jdGlvbiBmYWlscywgaXQgbWVhbnMgdGhlIHRpbGluZyBmbGFncyBkaWRuJ3Qg
bWFrZSBzZW5zZS4KVGhpcyBsaWtlbHkgaW5kaWNhdGVzIGEgdXNlci1zcGFjZSBidWcuIExvZyB0
aGUgZXJyb3IgYWxvbmdzaWRlIHdpdGggdGhlCnByb3ZpZGVkIHRpbGluZyBmbGFncyB0byBtYWtl
IGRlYnVnZ2luZyBlYXNpZXIuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1l
cnNpb24uZnI+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNj
OiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KQ2M6IE5pY2hvbGFzIEthemxhdXNr
YXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KQ2M6IEJhcyBOaWV1d2VuaHVpemVuIDxi
YXNAYmFzbmlldXdlbmh1aXplbi5ubD4KQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnpl
ci5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYyB8
IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYwppbmRleCA3M2I4
NWRhMmNjYmYuLmU5MGJlMmU4ZWIyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGlzcGxheS5jCkBAIC05MDEsOCArOTAxLDExIEBAIGludCBhbWRncHVfZGlzcGxheV9m
cmFtZWJ1ZmZlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJaWYgKGRldi0+bW9kZV9j
b25maWcuYWxsb3dfZmJfbW9kaWZpZXJzICYmCiAJICAgICEocmZiLT5iYXNlLmZsYWdzICYgRFJN
X01PREVfRkJfTU9ESUZJRVJTKSkgewogCQlyZXQgPSBjb252ZXJ0X3RpbGluZ19mbGFnc190b19t
b2RpZmllcihyZmIpOwotCQlpZiAocmV0KQorCQlpZiAocmV0KSB7CisJCQlkcm1fZGJnX2ttcyhk
ZXYsICJGYWlsZWQgdG8gY29udmVydCB0aWxpbmcgZmxhZ3MgMHglbGxYIHRvIGEgbW9kaWZpZXIi
LAorCQkJCSAgICByZmItPnRpbGluZ19mbGFncyk7CiAJCQlnb3RvIGZhaWw7CisJCX0KIAl9CiAK
IAlmb3IgKGkgPSAxOyBpIDwgcmZiLT5iYXNlLmZvcm1hdC0+bnVtX3BsYW5lczsgKytpKSB7Ci0t
IAoyLjI5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
