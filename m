Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C89048F7A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A2589C9A;
	Mon, 17 Jun 2019 19:32:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848089C94
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:14 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id p144so6928198qke.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FNLNWitLRExmTijTERNS2/xEIEIK+X294951fyZxLPU=;
 b=cEVwNrkHuXFljvLrEPv8Uwygg+C/uSkDns4oD3kcm+wBG/RU4Wvlq5PwEkVVv52C1h
 2dcR1DQ8wO+BnuZqZ8NmNRAqZ377mxHQnJqRaVWa+za3An6nJt1ycA7PRacRG6YYiaR3
 3X1tSHArvFvXkonwxIf9iUjy9m7Npo6l4lKb2ZWNvMM1mI3GYO/Wrcd0oAyjE2+swVCn
 5BdkfiAz8R136n/yhc5szrnMaonoHfosZNir28K6LAsRw//KfKIebpBaPsY0bLOmWEKE
 KonbHL9NhRiJTaHMqBmUEW6kzU1H21j56BLAUSoX0dlbI8Hc2rVsarXbTSr4qfIe1vBY
 S3jw==
X-Gm-Message-State: APjAAAWNPTsaPmuKhH4BM2njp4VvDmh2VFP1qZkVJRkmlcL3/lKYLZQZ
 HFy4401Q6GdIEz9ZW3SBvvGSYJ/6W3w=
X-Google-Smtp-Source: APXvYqyFTPZhDBv1fhEZHj/mtokWo2CdLYdoV4IuY6yu0thYjXOn0dT76LUMMaptL+VKeUvFxtCqwA==
X-Received: by 2002:a37:7083:: with SMTP id l125mr65265497qkc.71.1560799932924; 
 Mon, 17 Jun 2019 12:32:12 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:12 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 264/459] drm/amd/powerplay: enable gfxclk ds,
 dcefclk ds and fw dstate on navi10
Date: Mon, 17 Jun 2019 14:30:31 -0500
Message-Id: <20190617193106.18231-65-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FNLNWitLRExmTijTERNS2/xEIEIK+X294951fyZxLPU=;
 b=QHMK3DIFh/H1uq5VL4rqBopzM/4wTHEcEPunRvU12PJmYOyaIzXhPlp1YTtBJv/ZmB
 q8aoFIuRzJo7FL5HxNl4/PmH4FDQwg25hNheMbIYv4wL+5NJOpE3+XaGpd99s03JQQEy
 Vqwm5dXMDBYnfzYvc3RFrU1hixf0Eoi3nvauYjbnEZNrtvYb9MjomITpyhn4x2mJ3g6M
 BRLDWUMNomnW7HLNtglN9vMduBT3Je2Ix11RPUzXOTVLMHSjLQ1LBbrzbmcB4Wk3MBii
 E5HWS+sMf92Jl/aoT/1v1RNnTi5CBKDKoJgyh4usHu+rk5k9L8Js0Rd6CM7/pAkFStrf
 gF8g==
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
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCm9uIG5hdmkxMCwgYnkg
ZGVmYXVsdCB0aGUgYmVsb3cgZm91ciBmZWF0dXJlcyBhcmUgZW5hYmxlZC4KZ2Z4Y2xrIGRlZXAg
c2xlZXA6IGVuYWJsZWQgYW5kIHZlcmlmaWVkCmZ3IGRzdGF0ZTogZW5hYmxlZCBhbmQgdGhlbiBz
b2MgdWx2IGlzIHZlcmlmaWVkCmRjZWZjbGsgZGVlcCBzbGVlcDogZW5hYmxlZCBhbmQgdmVyaWZp
ZWQuIG5vdGljZSB0aGF0IG9uIGRpZmZlcmVudCBib2FyZHMsCmR1ZSB0byB0aGUgbWluaW11bSBk
Y2VmY2xrIGRlZXAgc2xlZXAgc2V0dGluZyBpbiBWQklPUywgd2UgbWF5IG5vdCBzZWUgZGNlZmNs
awpkZWVwIHNsZWVwIGtpY2tpbmcgaW4uCgpTaWduZWQtb2ZmLWJ5OiBLZW5uZXRoIEZlbmcgPGtl
bm5ldGguZmVuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDUg
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggZGVjZTU3ZmM3
NTFlLi5jMzEyZWFkY2YzZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKQEAgLTMyNiw3ICszMjYsMTAgQEAgbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVf
bWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJF
X0xFRF9ESVNQTEFZX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX01NSFVCX1BHX0JJ
VCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FUSFVCX1BHX0JJVCkKLQkJCQl8IEZFQVRV
UkVfTUFTSyhGRUFUVVJFX0RQTV9EQ0VGQ0xLX0JJVCk7CisJCQkJfCBGRUFUVVJFX01BU0soRkVB
VFVSRV9EUE1fRENFRkNMS19CSVQpCisJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19HRlhD
TEtfQklUKQorCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRFNfRENFRkNMS19CSVQpCisJCQkJ
fCBGRUFUVVJFX01BU0soRkVBVFVSRV9GV19EU1RBVEVfQklUKTsKIAogCWlmIChhZGV2LT5wbS5w
cF9mZWF0dXJlICYgUFBfTUNMS19EUE1fTUFTSykKIAkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFz
ayB8PSBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fVUNMS19CSVQpCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
