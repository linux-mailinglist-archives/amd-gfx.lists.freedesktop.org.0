Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AEC8EFAA
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 17:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7A76E9ED;
	Thu, 15 Aug 2019 15:44:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736D66E9ED
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 15:44:37 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g17so2156746qkk.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 08:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OO8c1WRfcfJqcgOszxdHcsA8YKiqvDRPK5v83aqWVj0=;
 b=MwrHgrIY2Df3fNDdXq39dEss0S1VHSbJEaq0T2q2FazoBqQooEMccKwZYw70gFWrUf
 +RU5+2u7YLmEh9Ojx073DGFrajlV59qenMOZt+ZeXGs9fNJTEhAevJqPcITqF4aPA9ZL
 0nnWdV3YrQPijLd1xDG2Zx1EfHwyJsjymh+WnwZLMStX3nOFnZEAkrjdtjrqy0XmGFYm
 DhOfzPijz5W5mn4KXH9IpSb12PAaUIZG51U8A1ejGcG85hjDpl2+o5WkIyVX20L2HhDZ
 mw29QgFBDry4md5wM7Ycm7RS3+35356aLIIVBitqVb/z6Z+B8L5OA53HRlR8mIStUbvf
 M8Xg==
X-Gm-Message-State: APjAAAWCiP2kx3Rm0mrS7xtOeSStXVFq35okzBj9CKnpQhK7gtJwGolX
 IuKb9v2KOAXGIXeJXRH0DjiVsxU3
X-Google-Smtp-Source: APXvYqw7t0YjE7w2pNvGcU2G7k4edQQeMNuZKWeDDJKItIdUOngMadvTWtRRdEn7X6Ae9Q4dCkzIOg==
X-Received: by 2002:a37:7bc5:: with SMTP id w188mr4713443qkc.293.1565883876135; 
 Thu, 15 Aug 2019 08:44:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.46.89])
 by smtp.gmail.com with ESMTPSA id m27sm1662124qtu.31.2019.08.15.08.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 08:44:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/gfx9: update pg_flags after determining if gfx off
 is possible
Date: Thu, 15 Aug 2019 10:44:26 -0500
Message-Id: <20190815154426.12213-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OO8c1WRfcfJqcgOszxdHcsA8YKiqvDRPK5v83aqWVj0=;
 b=knv8hhzXY20txZ54lhbkjZUMiCFqdHHfB3J7klB8jHweHDN1lLdkahSOBHj67Mz0Oo
 W+Gm8CHdQvbkI83hDSMeUCgFbspQcmHMjhleTVqKGMGdJSMr6WZfNBSt8oDJYlW8WHOh
 rEA2+4CNt5/5ldOdNDxKglb5kJjBvOLWd+WQqNiHK6WV6AR26ZIi+hQLBN0v1NWDUq0X
 4DFwLyrHyyvWxFl9fKv1GOPFWgYf22wxOVQTTVNsCT+ODc1gNqhlEKv7QbHLhN0BOjbT
 kxzEcbjIy86UPQSXQixdwN2i7YhI7MsxAMCheTIHjCcWhTJ7XlcW5cDwm5zDCr6CgiNS
 I/xg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBzZXQgY2VydGFpbiBwb3dlciBnYXRpbmcgZmxhZ3MgYWZ0ZXIgd2UgZGV0ZXJt
aW5lCmlmIHRoZSBmaXJtd2FyZSB2ZXJzaW9uIGlzIHN1ZmZpY2llbnQgdG8gc3VwcG9ydCBnZnhv
ZmYuClByZXZpb3VzbHkgd2Ugc2V0IHRoZSBwZyBmbGFncyBpbiBlYXJseSBpbml0LCBidXQgd2Ug
bGF0ZXIKd2UgbWlnaHQgaGF2ZSBkaXNhYmxlZCBnZnhvZmYgaWYgdGhlIGZpcm13YXJlIHZlcnNp
b25zIGRpZG4ndApzdXBwb3J0IGl0LiAgTW92ZSBhZGRpbmcgdGhlIGFkZGl0aW9uYWwgcGcgZmxh
Z3MgYWZ0ZXIgd2UKZGV0ZXJtaW5lIHdoZXRoZXIgb3Igbm90IHRvIHN1cHBvcnQgZ2Z4b2ZmLgoK
Rml4ZXM6IDAwNTQ0MDA2NmY5MiAoImRybS9hbWRncHU6IGVuYWJsZSBnZnhvZmYgYWdhaW4gb24g
cmF2ZW4gc2VyaWVzICh2MikiKQpUZXN0ZWQtYnk6IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZl
bmdAY2Fub25pY2FsLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogS2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmlj
YWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCA0ICsr
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgICAgfCA1IC0tLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCBkYTU5ZTY1MGFiMTUuLjZlZWE5YzY3NWQwMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCkBAIC0xMDM3LDYgKzEwMzcsMTAg
QEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfY2hlY2tfaWZfbmVlZF9nZnhvZmYoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJCSAgICAoYWRldi0+Z2Z4LnJsY19mZWF0dXJlX3ZlcnNpb24gPCAx
KSB8fAogCQkgICAgIWFkZXYtPmdmeC5ybGMuaXNfcmxjX3YyXzEpCiAJCQlhZGV2LT5wbS5wcF9m
ZWF0dXJlICY9IH5QUF9HRlhPRkZfTUFTSzsKKwkJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQ
UF9HRlhPRkZfTUFTSykKKwkJCWFkZXYtPnBnX2ZsYWdzIHw9IEFNRF9QR19TVVBQT1JUX0dGWF9Q
RyB8CisJCQkJQU1EX1BHX1NVUFBPUlRfQ1AgfAorCQkJCUFNRF9QR19TVVBQT1JUX1JMQ19TTVVf
SFM7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMKaW5kZXggNzdlNjc5OTIwYzFjLi4yY2Y2MTk0NmYzZjEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc29jMTUuYwpAQCAtMTEzMywxMSArMTEzMyw2IEBAIHN0YXRpYyBpbnQgc29jMTVfY29t
bW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCiAJCQlhZGV2LT5wZ19mbGFncyA9IEFNRF9Q
R19TVVBQT1JUX1NETUEgfCBBTURfUEdfU1VQUE9SVF9WQ047CiAJCX0KLQotCQlpZiAoYWRldi0+
cG0ucHBfZmVhdHVyZSAmIFBQX0dGWE9GRl9NQVNLKQotCQkJYWRldi0+cGdfZmxhZ3MgfD0gQU1E
X1BHX1NVUFBPUlRfR0ZYX1BHIHwKLQkJCQlBTURfUEdfU1VQUE9SVF9DUCB8Ci0JCQkJQU1EX1BH
X1NVUFBPUlRfUkxDX1NNVV9IUzsKIAkJYnJlYWs7CiAJY2FzZSBDSElQX0FSQ1RVUlVTOgogCQlh
ZGV2LT5hc2ljX2Z1bmNzID0gJnZlZ2EyMF9hc2ljX2Z1bmNzOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
