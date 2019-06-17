Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07E148F78
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA8D89CAD;
	Mon, 17 Jun 2019 19:32:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEBE89CAC
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:15 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id p15so12257576qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hn/SknalniuVQGA7aS8srqXdXof0whWTxhpHvvdVI8o=;
 b=JHAHedHGxGtdkWqdVd/HjB6dXskJ+5CBUUHGnA4a3LghrPSB/vYRVnbqyPFhD/ziUl
 6SrH19i77iDovuDcivwqUN5jI85IUgzhddtwaE3YuDw+4dibTkPN7Dw4U2uWO1EQ0TQP
 QFemr60S9jvR1ug/BT94EOzcayxc3MgoEYz3l1CfuI8//Lckzx9BU99+ZnoQuJ/NHPLi
 PWqSzBpH1p5Bf3fF8lTEnt1oYbCMjEMHdB2pyT8kpWyVFekyodwT4yJJ24Q/0udY6gZg
 qFkszKD/pLU3IHPFmrMt8uXHV9lEZ2bMSu9FabUMZScjBS7KdjyVasnMmSVX3N1J5XEg
 OlBQ==
X-Gm-Message-State: APjAAAXqGk27ypJ/KDyVToNi5BXeLp1L7QBiB5iFQs3UytUr5aLjQtca
 veg/+PIMSdBHAQVcEfENfrR2/7N80zk=
X-Google-Smtp-Source: APXvYqwtvZyl24Bog95ioD0x6u7kXkbouZV+VeTczhWvCrRWzwkvS+XitBND5cIU8pEaOXkE/qM9vQ==
X-Received: by 2002:a0c:87ca:: with SMTP id 10mr23371971qvk.210.1560799934556; 
 Mon, 17 Jun 2019 12:32:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 266/459] drm/amd/powerplay: enable uclk dpm default on navi10
Date: Mon, 17 Jun 2019 14:30:33 -0500
Message-Id: <20190617193106.18231-67-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hn/SknalniuVQGA7aS8srqXdXof0whWTxhpHvvdVI8o=;
 b=PAYKiiqAEfp8oNdqA9HKfxhLN4qDvIYVKu/zVLWsos561e5Qf/Uml0kAcPpQi1icY1
 kVQJBk7kvSm5JzvFnaJ3XaYYyOj6sqWVoTFnvI5o4IKii0W4B5VUDixp0mQAqRiVyfpQ
 DkM5JWIK9IgKR0+rPpMBliaPfZ/0g5ap5tRldWDktnM+2pGkKXRqBb6iLrVFZJb6virk
 c4bY5hdEL/+9hpsB0i1AfsM4ndKgfESUtKnyj53gdFbsUjW43XCIXgBkMaa4SVyda07S
 hyD6Vjy8V86we+GOB+zoXQW9WCPu+iAvqZzxfKHWXpT7YfOIJYgG87l4/9Vxs7i+97vt
 EWAw==
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
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmVuYWJsZSB1Y2xrIChtY2xr
KSBkcG0gYnkgZGVmYXVsdCBvbiBuYXZpMTAKClNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtl
dmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
IHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpp
bmRleCAyYTg1ZWY0NzZhMWQuLmQyMGQ0OThhZjY3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtMzE0LDYgKzMxNCw5IEBAIG5hdmkxMF9nZXRfYWxs
b3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCQkJfCBGRUFUVVJF
X01BU0soRkVBVFVSRV9EUE1fU09DQ0xLX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJF
X0RQTV9NUDBDTEtfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX0xJTktfQklU
KQorCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1VDTEtfQklUKQorCQkJCXwgRkVBVFVS
RV9NQVNLKEZFQVRVUkVfTUVNX1ZERENJX1NDQUxJTkdfQklUKQorCQkJCXwgRkVBVFVSRV9NQVNL
KEZFQVRVUkVfTUVNX01WRERfU0NBTElOR19CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVS
RV9HRlhfVUxWX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1JTTVVfU01OX0NHX0JJ
VCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RTX1NPQ0NMS19CSVQpCkBAIC0zMzIsMTEg
KzMzNSw2IEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9GV19EU1RBVEVfQklUKQogCQkJ
CXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfQUNEQ19CSVQpOwogCi0JaWYgKGFkZXYtPnBtLnBwX2Zl
YXR1cmUgJiBQUF9NQ0xLX0RQTV9NQVNLKQotCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNrIHw9
IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9VQ0xLX0JJVCkKLQkJCQl8IEZFQVRVUkVfTUFTSyhG
RUFUVVJFX01FTV9WRERDSV9TQ0FMSU5HX0JJVCkKLQkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJF
X01FTV9NVkREX1NDQUxJTkdfQklUKTsKLQogCWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBf
R0ZYT0ZGX01BU0spCiAJCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNL
KEZFQVRVUkVfR0ZYX1NTX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0dGWE9GRl9C
SVQpOwpAQCAtMzUwLDcgKzM0OCw5IEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2so
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCWlmICgoYWRldi0+YXNpY190eXBlID09IENISVBf
TkFWSTEwKSAmJgogCQkJKGFkZXYtPnJldl9pZCA9PSAwKSkgewogCQkJKih1aW50NjRfdCAqKWZl
YXR1cmVfbWFzayAmPQotCQkJCQl+RkVBVFVSRV9NQVNLKEZFQVRVUkVfRFBNX1VDTEtfQklUKTsK
KwkJCQkJfihGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fVUNMS19CSVQpCisJCQkJCSAgfCBGRUFU
VVJFX01BU0soRkVBVFVSRV9NRU1fVkREQ0lfU0NBTElOR19CSVQpCisJCQkJCSAgfCBGRUFUVVJF
X01BU0soRkVBVFVSRV9NRU1fTVZERF9TQ0FMSU5HX0JJVCkpOwogCQkJKih1aW50NjRfdCAqKWZl
YXR1cmVfbWFzayAmPQogCQkJCQl+RkVBVFVSRV9NQVNLKEZFQVRVUkVfRFNfU09DQ0xLX0JJVCk7
CiAJCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
