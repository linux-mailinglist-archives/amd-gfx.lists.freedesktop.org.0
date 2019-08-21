Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DFB98728
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF4189BD4;
	Wed, 21 Aug 2019 22:24:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4526EA1D
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:21 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m2so3326654qkd.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VeF07Arqr04m9XifdQeUU1zionWV0mjRy8w2TAU997E=;
 b=QuzEhxWK8owukzlOpdhLm5ZOyNpo2ZcsFB41ILRCSnvJXHKF6ZpjnVEmdXsnqCvndd
 AR8aY44BU6UUdg0bjZNc7KcK8f+n8/kEePAKP290/B9JSY1BSR6zSzjMH2vZ2pxTOUs8
 3Hk5iG+ZTSeTmcdojMWd9xnqCxQ8aGHlojulbVLYOGlgwHbAQwk+6WpGljRAjneTP5Tv
 yT3sBzFCo3pUwpRzP2oqdKc5ic/wFBMfBR9PV4SCEE9X9Tm7NowHQnJvj+HQ6ruPbuWm
 w/X1iYRgU+ahqblvG8Hf/P/9/QFcvi480pDhUeH7oPMHTKm+yeWJs9BKBSOc6AEQCU69
 PIYw==
X-Gm-Message-State: APjAAAXVVOILJW5bPBMh82A2eIiOuOw4Bp9eU8wVxdKweJvIjSYW8snt
 a1yVwPdRhadH/iu8ge4bbaNv17nc
X-Google-Smtp-Source: APXvYqwOdFdKcA+22+9KcjOwX3LAi6q8pl1d3brbCdHAIIwLrEsO45xODtiRQDmG8V1RpH4Hxwj5fQ==
X-Received: by 2002:a37:9d94:: with SMTP id
 g142mr33117951qke.209.1566426260320; 
 Wed, 21 Aug 2019 15:24:20 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/37] drm/amd/powerplay: udpate smu_v12_0_check_fw_version
 (v2)
Date: Wed, 21 Aug 2019 17:23:32 -0500
Message-Id: <20190821222359.13578-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VeF07Arqr04m9XifdQeUU1zionWV0mjRy8w2TAU997E=;
 b=LvS1x8kpW/fLZWAZJkwWE4qH1De+DKCR/1+xYSXyZOKbI/SH2HFc9FupLFrdikFrLk
 uqwKYCseeKe1vUcNkXj9XBWi0yBzaBrSjU9lrXILvSmsDu5KaSfKwdUnkjHM3l5mvoGZ
 E3AZs8mK2fpmv3GjXDoH1ZhNq47eY2TgpkxePesOOGOKOKkwyT1+CU+FWuXZMj1uSaKU
 BZQqfIwwl1OIMGb5GB6ZSU6nv1NNNL9WW/FVWhrBeNynxv0AwrR5k6cnhA+fHEibZ1j4
 iV2p9pi70Rkrtw2NYi+kLRI+9K+kgkaDAckizrHJPzMbzmf6hA9bxQmAcBXe8hDallDO
 B7VA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KClRoaXMgaW50ZXJmYWNlIHN1cHBv
cnQgU01VX01TR19HZXREcml2ZXJJZlZlcnNpb24KYW5kIFNNVV9NU0dfR2V0U211VmVyc2lvbiBj
aGVja2luZy4KCnYyOiBzcXVhc2ggaW4gZHJpdmVyX2lmIGNoYW5nZXMgKEFsZXgpCgpTaWduZWQt
b2ZmLWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcg
UnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFu
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMg
fCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMl8wLmMgIHwgMzUg
KysrKysrKysrKysrKysrLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9yZW5vaXJfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJf
cHB0LmMKaW5kZXggZGQyNzA2MDA5NjJiLi5hZjhiYjFjYzVkOWEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMKQEAgLTI1LDYgKzI1LDcgQEAKICNpbmNsdWRl
ICJhbWRncHVfc211LmgiCiAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgiCiAjaW5jbHVkZSAic211
X3YxMl8wX3Bwc21jLmgiCisjaW5jbHVkZSAic211MTJfZHJpdmVyX2lmLmgiCiAjaW5jbHVkZSAi
cmVub2lyX3BwdC5oIgogCiAKQEAgLTExOCw0ICsxMTksNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsKIHZvaWQgcmVub2lyX3NldF9wcHRf
ZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiB7CiAJc211LT5wcHRfZnVuY3MgPSAmcmVu
b2lyX3BwdF9mdW5jczsKKwlzbXUtPnNtY19pZl92ZXJzaW9uID0gU01VMTJfRFJJVkVSX0lGX1ZF
UlNJT047CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djEyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTJfMC5jCmluZGV4
IDU4M2ZlN2RhNGE0Yi4uNjk1YjlhZjg2NjJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9zbXVfdjEyXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9zbXVfdjEyXzAuYwpAQCAtMTQ0LDIwICsxNDQsMzUgQEAgc3RhdGljIGludCBzbXVfdjEy
XzBfY2hlY2tfZndfc3RhdHVzKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCiBzdGF0aWMgaW50
IHNtdV92MTJfMF9jaGVja19md192ZXJzaW9uKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogewot
CXVpbnQzMl90IHNtY19pZl92ZXJzaW9uID0gMHhmZjsKKwl1aW50MzJfdCBpZl92ZXJzaW9uID0g
MHhmZiwgc211X3ZlcnNpb24gPSAweGZmOworCXVpbnQxNl90IHNtdV9tYWpvcjsKKwl1aW50OF90
IHNtdV9taW5vciwgc211X2RlYnVnOwogCWludCByZXQgPSAwOwogCi0JcmV0ID0gc211X3NlbmRf
c21jX21zZyhzbXUsIFNNVV9NU0dfR2V0RHJpdmVySWZWZXJzaW9uKTsKKwlyZXQgPSBzbXVfZ2V0
X3NtY192ZXJzaW9uKHNtdSwgJmlmX3ZlcnNpb24sICZzbXVfdmVyc2lvbik7CiAJaWYgKHJldCkK
LQkJZ290byBlcnI7Ci0KLQlyZXQgPSBzbXVfcmVhZF9zbWNfYXJnKHNtdSwgJnNtY19pZl92ZXJz
aW9uKTsKLQlpZiAocmV0KQotCQlnb3RvIGVycjsKKwkJcmV0dXJuIHJldDsKKworCXNtdV9tYWpv
ciA9IChzbXVfdmVyc2lvbiA+PiAxNikgJiAweGZmZmY7CisJc211X21pbm9yID0gKHNtdV92ZXJz
aW9uID4+IDgpICYgMHhmZjsKKwlzbXVfZGVidWcgPSAoc211X3ZlcnNpb24gPj4gMCkgJiAweGZm
OworCisJLyoKKwkgKiAxLiBpZl92ZXJzaW9uIG1pc21hdGNoIGlzIG5vdCBjcml0aWNhbCBhcyBv
dXIgZncgaXMgZGVzaWduZWQKKwkgKiB0byBiZSBiYWNrd2FyZCBjb21wYXRpYmxlLgorCSAqIDIu
IE5ldyBmdyB1c3VhbGx5IGJyaW5ncyBzb21lIG9wdGltaXphdGlvbnMuIEJ1dCB0aGF0J3Mgdmlz
aWJsZQorCSAqIG9ubHkgb24gdGhlIHBhaXJlZCBkcml2ZXIuCisJICogQ29uc2lkZXJpbmcgYWJv
dmUsIHdlIGp1c3QgbGVhdmUgdXNlciBhIHdhcm5pbmcgbWVzc2FnZSBpbnN0ZWFkCisJICogb2Yg
aGFsdCBkcml2ZXIgbG9hZGluZy4KKwkgKi8KKwlpZiAoaWZfdmVyc2lvbiAhPSBzbXUtPnNtY19p
Zl92ZXJzaW9uKSB7CisJCXByX2luZm8oInNtdSBkcml2ZXIgaWYgdmVyc2lvbiA9IDB4JTA4eCwg
c211IGZ3IGlmIHZlcnNpb24gPSAweCUwOHgsICIKKwkJCSJzbXUgZncgdmVyc2lvbiA9IDB4JTA4
eCAoJWQuJWQuJWQpXG4iLAorCQkJc211LT5zbWNfaWZfdmVyc2lvbiwgaWZfdmVyc2lvbiwKKwkJ
CXNtdV92ZXJzaW9uLCBzbXVfbWFqb3IsIHNtdV9taW5vciwgc211X2RlYnVnKTsKKwkJcHJfd2Fy
bigiU01VIGRyaXZlciBpZiB2ZXJzaW9uIG5vdCBtYXRjaGVkXG4iKTsKKwl9CiAKLQlpZiAoc21j
X2lmX3ZlcnNpb24gIT0gc211LT5zbWNfaWZfdmVyc2lvbikKLQkJcmV0ID0gLUVJTlZBTDsKLWVy
cjoKIAlyZXR1cm4gcmV0OwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
