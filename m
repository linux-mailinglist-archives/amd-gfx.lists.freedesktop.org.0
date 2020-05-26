Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C32CA1DF014
	for <lists+amd-gfx@lfdr.de>; Fri, 22 May 2020 21:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3076E0F0;
	Fri, 22 May 2020 19:38:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930326E0F2
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 May 2020 19:38:38 +0000 (UTC)
Date: Fri, 22 May 2020 19:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1590176316;
 bh=seeoXG1zw3S/VoA8bFU/DK3++zcIM//jtC1nVg/wiI0=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=A4n0GvHhB6H2tMhc6sFnxayj8Re23MIcUVt6p0hgXXiAx6ru/xuYLg6HLcflWjvVF
 CNAXyGvqjzyP2n2ybXPGzDVpOL9rx2BkW3D3zd7GnZ/p0wzlcEaphBXisen9yruPbx
 70yXuxqeZ4jKDzV6V4Qaq2P1ZvcxKFSgleEEIgPk=
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/amdgpu: fix leftover drm_gem_object_put_unlocked call
Message-ID: <yNYwUfXpw0k-V5poEVGOZXgeP4zwnuUn8MEJYolwxL7VXfEa99STFAtLPlqlbElXGpqH5a5oyozz4XfnSRg1DCFzqYFbEHTiF5UtwGAmviA=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: Alex Deucher <alexander.deucher@amd.com>, David Zhou <David1.Zhou@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkIGhhcyBiZWVuIHJlbmFtZWQgdG8gZHJtX2dlbV9v
YmplY3RfcHV0LgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZy
PgpGaXhlczogZTA3ZGRiMGNlN2NkICgiZHJtL2FtZDogcmVtb3ZlIF91bmxvY2tlZCBzdWZmaXgg
aW4gZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkIikKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IERhdmlkIChDaHVuTWluZykgWmhvdSA8RGF2aWQxLlpob3VAYW1kLmNv
bT4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IGRhOGIzMWE1
MzI5MS4uYzk5ZmI5MmFlOTkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jCkBAIC0xMzU0LDcgKzEzNTQsNyBAQCBpbnQgYW1kZ3B1X2Ft
ZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHUoCiAJfQogCiAJLyogRnJlZSB0aGUgQk8qLwot
CWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgmbWVtLT5iby0+dGJvLmJhc2UpOworCWRybV9n
ZW1fb2JqZWN0X3B1dCgmbWVtLT5iby0+dGJvLmJhc2UpOwogCW11dGV4X2Rlc3Ryb3koJm1lbS0+
bG9jayk7CiAJa2ZyZWUobWVtKTsKIAotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4Cg==
