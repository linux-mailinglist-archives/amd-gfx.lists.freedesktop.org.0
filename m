Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EBB48FD7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD5889CB8;
	Mon, 17 Jun 2019 19:46:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A0E89CE0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:59 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d15so6988654qkl.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tPNx4JgPPzxBKMRelolwLSHu/48pIuVNTZx7LVtDc4s=;
 b=PehSvfnDGAzFDv6UhJAvTvRQSKaYIX6oMPxFeId0PkEeALM0wzpQHjAaWtStqM9xYZ
 L/yXu2gCLjkJ5/Z1X9rFwDITbjyYzJZVBlTRKcslkA/jXmJGfm5Yn+w9WlMSeioqygEJ
 ls7Ge33+l24M8voRgSs/RJKciP9Fi9chSeX71DzxarzM3dVjGydKeZ4v7WsgpwbML1Gg
 NK53eO9GE0nOp3q8jWTaUETk0BWhT8IrmbhWgBuRlk1GJid3zVjWBTzOYVJU4INnR2OO
 tuoEvNAImk7KBs6Kb5eHiokK/JJIEdiWz1bueYR26ovkiMdlvEaN12x/HOZUXy+sFaa5
 fExg==
X-Gm-Message-State: APjAAAWMHLx5Z+ksmU9T/R47V8zasTPPyPlbRQWJJ7RgZ6prAevz6yV+
 9Zg5+JlP8KygStWi2DFgTtR96cWu0Hw=
X-Google-Smtp-Source: APXvYqwg9qCNZWZMMAivQ17eheHGKWHyTkSf6Ok7z9rX0S/hryhMzA6ELmrbc3siALLcynRQlNed1w==
X-Received: by 2002:a37:5444:: with SMTP id i65mr13324765qkb.263.1560800758835; 
 Mon, 17 Jun 2019 12:45:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 308/459] drm/amd/powerplay: remove unsupport function
 set_thermal_fan_table for navi10
Date: Mon, 17 Jun 2019 14:44:09 -0500
Message-Id: <20190617194540.18497-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tPNx4JgPPzxBKMRelolwLSHu/48pIuVNTZx7LVtDc4s=;
 b=QpxR3g6QWrjUeYfzu8LKmTWJysxJf0tBq+wyDgm1hmRjw42YPlQq/iV+GAuFUSVwRh
 44C7uFRs8HOMuvwobM3nyTPaT7kstVg9e5K4wTfGkD8FH4JXGhAIa8n2QRqn0BqmxJ+s
 zPbX/4MBCyUVZ1iW6gRjLEfYC/HuvMsx3K+ZRwxIYMeuIHw4zg+86fUhzlRcqgojJxA1
 hkFPmT1CeIyQl65LOQbjehDteZM0a+9AW6mBI7XnmWDfK/nhWhuSe041ZAW4EdP798q1
 DEN2WaFQXg4AZEbK24VUAqAIUkYA0xnXXtAwv2TAOoPDmUoAvDGr4Lm4WS6wTFjgawpX
 fWLQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnRoZSBQUFNNQ19NU0dfU2V0
RmFuVGVtcGVyYXR1cmVUYXJnZXQgaXMgbm90IHN1cHBvcnQgb24gbmF2aTEwCgpTaWduZWQtb2Zm
LWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcg
UnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYyB8IDEzIC0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXgg
Zjc4MWM3ZjRiYTQ2Li5lMjlkMmRhMjFmYmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMKQEAgLTg4NSwxOCArODg1LDYgQEAgc3RhdGljIGJvb2wgbmF2aTEw
X2lzX2RwbV9ydW5uaW5nKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogCXJldHVybiAhIShmZWF0
dXJlX2VuYWJsZWQgJiBTTUNfRFBNX0ZFQVRVUkUpOwogfQogCi1zdGF0aWMgaW50IG5hdmkxMF9z
ZXRfdGhlcm1hbF9mYW5fdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCi17Ci0JaW50IHJl
dDsKLQlzdHJ1Y3Qgc211X3RhYmxlX2NvbnRleHQgKnRhYmxlX2NvbnRleHQgPSAmc211LT5zbXVf
dGFibGU7Ci0JUFBUYWJsZV90ICpwcHRhYmxlID0gdGFibGVfY29udGV4dC0+ZHJpdmVyX3BwdGFi
bGU7Ci0KLQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1Nl
dEZhblRlbXBlcmF0dXJlVGFyZ2V0LAotCQkJKHVpbnQzMl90KXBwdGFibGUtPkZhblRhcmdldFRl
bXBlcmF0dXJlKTsKLQotCXJldHVybiByZXQ7Ci19Ci0KIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9m
YW5fc3BlZWRfcGVyY2VudChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQkJdWludDMyX3Qg
KnNwZWVkKQogewpAQCAtMTMwOSw3ICsxMjk3LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRh
YmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLmZvcmNlX2RwbV9saW1pdF92YWx1ZSA9
IG5hdmkxMF9mb3JjZV9kcG1fbGltaXRfdmFsdWUsCiAJLnVuZm9yY2VfZHBtX2xldmVscyA9IG5h
dmkxMF91bmZvcmNlX2RwbV9sZXZlbHMsCiAJLmlzX2RwbV9ydW5uaW5nID0gbmF2aTEwX2lzX2Rw
bV9ydW5uaW5nLAotCS5zZXRfdGhlcm1hbF9mYW5fdGFibGUgPSBuYXZpMTBfc2V0X3RoZXJtYWxf
ZmFuX3RhYmxlLAogCS5nZXRfZmFuX3NwZWVkX3BlcmNlbnQgPSBuYXZpMTBfZ2V0X2Zhbl9zcGVl
ZF9wZXJjZW50LAogCS5nZXRfcG93ZXJfcHJvZmlsZV9tb2RlID0gbmF2aTEwX2dldF9wb3dlcl9w
cm9maWxlX21vZGUsCiAJLnNldF9wb3dlcl9wcm9maWxlX21vZGUgPSBuYXZpMTBfc2V0X3Bvd2Vy
X3Byb2ZpbGVfbW9kZSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
