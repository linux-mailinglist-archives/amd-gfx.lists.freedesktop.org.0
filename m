Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F4A6C0DD
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 20:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FFA6E11B;
	Wed, 17 Jul 2019 18:15:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EAA6E11B
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 18:15:38 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d23so24375632qto.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 11:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i62lT8k2rlIPmwo60p48C4xjHNvR4+mBHM+b7U1UFA4=;
 b=BY6pSG70hCpoxH00TTblE9YZwKmfOe3qCbM6Xo21TypippK73NnhvbNlgBXq+5cimh
 zNnIEzM98JTTP3l4TE4Pl+arRTw1W3XhFjYnE9ANPX3b1+2fi+ogcbalA6hHRlIEb1gB
 DyVOj4ihFLpTXZSoNqHXT22ypZfgzbw7x79N41cRL38c6Jy6ca9W74mMLMn4O4negLnF
 Uf4FCz+e3IcWF0SdbN1Xa6u9zs6MVQD8wMPUOcMyDhrOZuOEFiutMQIIYWJwCd93LZCZ
 3UjGShQTtwddHlL5zPDX/Z6nh4WtAnpZOZeAD1XDtZMVotDAVYDgtXVIy67Oe8rdVJxI
 0fgg==
X-Gm-Message-State: APjAAAWZH6s1elXC0u9gZGjw/YWdH7vBNFBJQcMQKZMifX2LcAt/6Jn7
 DMWxUe3+P26piEYaSkyAibm3uC7c
X-Google-Smtp-Source: APXvYqzqYnCxqTpP+noUwk/PKI9ON7xUz0Wpc//G7/Wc+fAkwRPBdRSe1ubk8SI4hL6PWVEyL7Tfvg==
X-Received: by 2002:aed:3ac1:: with SMTP id o59mr28693454qte.260.1563387337029; 
 Wed, 17 Jul 2019 11:15:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id v1sm11197706qkj.19.2019.07.17.11.15.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 11:15:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/pm: remove check for pp funcs in freq sysfs
 handlers
Date: Wed, 17 Jul 2019 13:15:27 -0500
Message-Id: <20190717181527.6492-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i62lT8k2rlIPmwo60p48C4xjHNvR4+mBHM+b7U1UFA4=;
 b=psCTtDDR4ytzGUhhCtA0YDZctucStJg1+Yqb6Qcp3SIFX2IpZxyG5Wa3gGOPzNP9Tb
 WZlwqJuRq5W4aXhF3ToJ3OC8HY2pYhi5tAkntNIOBfpVzhWniXX07s0cY1bLEYArb2pP
 lwQD192LsB9SSNmMTGasukeQgGphDPkhwJ7rbbdBBEsnpMxCWJxGMftMb0+VOhAgtios
 IHLp0L4Usk7TTAZI1C6UASG5RYCMlE73pCwozbPmQA8SGkM4H49oaP1vjdHjb3HiI5Rk
 AQjWfCJlZR0T4TBKsQ2eAB2/umSsWPCoqj65DjHe7USlJm5Wwdpw0KQQ6mKP6o3lJSTq
 nSSA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGRwbSBzZW5zb3IgZnVuY3Rpb24gYWxyZWFkeSBkb2VzIHRoaXMgZm9yIHVzLiAgVGhpcyBm
aXhlcwp0aGUgZnJlcSpfaW5wdXQgZmlsZXMgd2l0aCB0aGUgbmV3IFNNVSBpbXBsZW1lbnRhdGlv
bi4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyB8IDEwIC0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wbS5jCmluZGV4IDM5N2FmOTA5NGEzOS4uOGI3ZWZkMGE3MDI4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwpAQCAtMjA3NywxMSArMjA3Nyw2IEBA
IHN0YXRpYyBzc2l6ZV90IGFtZGdwdV9od21vbl9zaG93X3NjbGsoc3RydWN0IGRldmljZSAqZGV2
LAogCSAgICAgKGRkZXYtPnN3aXRjaF9wb3dlcl9zdGF0ZSAhPSBEUk1fU1dJVENIX1BPV0VSX09O
KSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQkvKiBzYW5pdHkgY2hlY2sgUFAgaXMgZW5hYmxlZCAq
LwotCWlmICghKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcyAmJgotCSAgICAgIGFkZXYtPnBvd2Vy
cGxheS5wcF9mdW5jcy0+cmVhZF9zZW5zb3IpKQotCSAgICAgIHJldHVybiAtRUlOVkFMOwotCiAJ
LyogZ2V0IHRoZSBzY2xrICovCiAJciA9IGFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1E
R1BVX1BQX1NFTlNPUl9HRlhfU0NMSywKIAkJCQkgICAodm9pZCAqKSZzY2xrLCAmc2l6ZSk7CkBA
IC0yMTEyLDExICsyMTA3LDYgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X2h3bW9uX3Nob3dfbWNs
ayhzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJICAgICAoZGRldi0+c3dpdGNoX3Bvd2VyX3N0YXRlICE9
IERSTV9TV0lUQ0hfUE9XRVJfT04pKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCS8qIHNhbml0eSBj
aGVjayBQUCBpcyBlbmFibGVkICovCi0JaWYgKCEoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzICYm
Ci0JICAgICAgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5yZWFkX3NlbnNvcikpCi0JICAgICAg
cmV0dXJuIC1FSU5WQUw7Ci0KIAkvKiBnZXQgdGhlIHNjbGsgKi8KIAlyID0gYW1kZ3B1X2RwbV9y
ZWFkX3NlbnNvcihhZGV2LCBBTURHUFVfUFBfU0VOU09SX0dGWF9NQ0xLLAogCQkJCSAgICh2b2lk
ICopJm1jbGssICZzaXplKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
