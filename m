Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427142C0C43
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Nov 2020 14:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC3789E15;
	Mon, 23 Nov 2020 13:58:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC43F89A9B
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p22so17512812wmg.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHfHJykVaqUxn8L02JDHmsfIL28LId8QRd31LMjrFmg=;
 b=zzCeS97E1b2WK6Wk02PoTbIMKdaOnWgwalJAZYW6kwBbUSHZfi4uctzruRAlBrBi01
 s1g0HUaTRY5GThIHL7s13m0kRF6AJUh51MBDnO1qSJ7R/Wjzz/1nZTgq3gQzdgtND3FG
 NxT7vDDk6oQpm2vYXtu0NykiMUQIPq+CtF9c2Q2iknriAg/d2LVw3UCzJOznFEIHj1Cc
 D1kKx99KdYvIn+VtlknG6LvZS8vcg1IpQeN2QXBQdQzGMf+KOxB39PXcZwiiOA6JxxH3
 jrdCSO6PhSuIiXZ4xJL+9JROKhcgw1XIO3QB2KkHHsqLYKHYLFJf0sK5jjGG5m3Ey1RQ
 Ws2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qHfHJykVaqUxn8L02JDHmsfIL28LId8QRd31LMjrFmg=;
 b=n0IGAdgxWBmgx4WG1GQuv0zOMjx5sqGnFDCGhKilaPKO0UPOjhMN5onzQH2sqg6CUv
 SzpF7V1iHB2kQBKAqfRG5SmcMloFUv3l5XgxYZMBsaEKQpMhfaFfHBvBP+sBA+oyIzdB
 D1yAybVra6ytbFBxN2YNai+vK4E9vdpKHfbqTWUZLy4WVMbcTjCbGIJ10f6OjG6HyXbm
 qdkAfmoLgSa9sjqRGD1LQVJxZzyLKpX9T5uK2vUmptgnRJ/T3pmBlI4asNoJkBEq0JVS
 DQSaRMzYj6ShNtnwkayBX0amhziEhygye0EVfjJRAERL54mmInVYCGbXdY9SdEcRevJ0
 HJSA==
X-Gm-Message-State: AOAM533Mz9lh8oogzf5NRkQRmn86x4lhVFFvCYsPsk8a4ahIOmk/bBf1
 uST5EMMwJg2GYM7ukkoGV4GwLA==
X-Google-Smtp-Source: ABdhPJy+3wxz4JBnkJplQfa7wJSMtD26XO+XdnHu8vJdN6Ka8g9Y1bcXVHrKX2TUYDMHzdco2xDKRQ==
X-Received: by 2002:a7b:c94d:: with SMTP id i13mr23152695wml.130.1606130404056; 
 Mon, 23 Nov 2020 03:20:04 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/40] drm/amd/include/vangogh_ip_offset: Mark top-level
 IP_BASE as __maybe_unused
Date: Mon, 23 Nov 2020 11:19:08 +0000
Message-Id: <20201123111919.233376-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 13:58:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZhbmdvZ2hfcmVnX2lu
aXQuYzoyODoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvdmFuZ29naF9p
cF9vZmZzZXQuaDoyMTA6Mjk6IHdhcm5pbmc6IOKAmFVTQl9CQVNF4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiAyMTAgfCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IElQX0JBU0UgVVNCX0JBU0UgPSB7IHsgeyB7IDB4MDI0MkE4MDAsIDB4MDVCMDAwMDAsIDAs
IDAsIDAsIDAgfSB9LAogfCBefn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4v
aW5jbHVkZS92YW5nb2doX2lwX29mZnNldC5oOjIwMjoyOTogd2FybmluZzog4oCYVU1DX0JBU0Xi
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIDIwMiB8
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBVTUNfQkFTRSA9IHsgeyB7IHsgMHgwMDAxNDAw
MCwgMHgwMjQyNTgwMCwgMCwgMCwgMCwgMCB9IH0sCiB8IF5+fn5+fn5+CiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9pbmNsdWRlL3ZhbmdvZ2hfaXBfb2Zmc2V0Lmg6MTc4OjI5OiB3YXJu
aW5nOiDigJhQQ0lFMF9CQVNF4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25z
dC12YXJpYWJsZT1dCiAxNzggfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgUENJRTBfQkFT
RSA9IHsgeyB7IHsgMHgwMDAwMDAwMCwgMHgwMDAwMDAxNCwgMHgwMDAwMEQyMCwgMHgwMDAxMDQw
MCwgMHgwMjQxQjAwMCwgMHgwNDA0MDAwMCB9IH0sCiB8IF5+fn5+fn5+fn4KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvdmFuZ29naF9pcF9vZmZzZXQuaDoxNTQ6Mjk6IHdh
cm5pbmc6IOKAmE1QMl9CQVNF4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25z
dC12YXJpYWJsZT1dCiAxNTQgfCBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgTVAyX0JBU0Ug
PSB7IHsgeyB7IDB4MDAwMTY0MDAsIDB4MDI0MDA4MDAsIDB4MDBGNDAwMDAsIDB4MDBGODAwMDAs
IDB4MDBGQzAwMDAsIDAgfSB9LAogfCBefn5+fn5+fgoKTkI6IFNuaXBwZWQgbG90cyBvZiB0aGVz
ZQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJp
c3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL3ZhbmdvZ2hfaXBfb2Zmc2V0LmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUvdmFuZ29naF9pcF9vZmZzZXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
aW5jbHVkZS92YW5nb2doX2lwX29mZnNldC5oCmluZGV4IDI4NzU1NzRiMDYwZTYuLjY5MTA3M2Vk
NzgwZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS92YW5nb2doX2lw
X29mZnNldC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS92YW5nb2doX2lwX29m
ZnNldC5oCkBAIC0zNiw3ICszNiw3IEBAIHN0cnVjdCBJUF9CQVNFX0lOU1RBTkNFCiBzdHJ1Y3Qg
SVBfQkFTRQogewogICAgIHN0cnVjdCBJUF9CQVNFX0lOU1RBTkNFIGluc3RhbmNlW01BWF9JTlNU
QU5DRV07Ci19OworfSBfX21heWJlX3VudXNlZDsKIAogCiBzdGF0aWMgY29uc3Qgc3RydWN0IElQ
X0JBU0UgQUNQX0JBU0UgPSB7IHsgeyB7IDB4MDI0MDM4MDAsIDB4MDA0ODAwMDAsIDAsIDAsIDAs
IDAgfSB9LAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngK
