Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45A2C62C1
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Nov 2020 11:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F296EBF6;
	Fri, 27 Nov 2020 10:14:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A8C6E987
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:27 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h21so2460534wmb.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FHee2zrW6mojQNSNJ9XRSA5F6LyijJ6hVMNlAaUjhbE=;
 b=GEo2EsStv13X9m/Tsj4m2jpkSmdMGO2t7vaRwB28WuHahv54Zru6Pq30ubqib2P4Wo
 ACkQZ7JrvpNLHUTv7oTvmgoVXkEwYckfsZQspiFUVlp0XajeT9CoQQt5Pbjf5EwuEN6D
 RlYoNlJrzOwYqErn8RfUXGMijS+BwjtOgRMnpYRx++o5YM0H4367xMtK7gzs82IAyos5
 iQrBA233rIoyolzxOWOhFFUdnZ47L8NZq895xrRKd/hnWU6S8SAmr3Z2aFFCOAD2/Q/A
 iIGzRYPc2j1MBqeQwJD72uHh7Zlv5BPbVr/AwjD8oNGEh+cgL9os1KYP2ICPL66LEMrc
 4jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHee2zrW6mojQNSNJ9XRSA5F6LyijJ6hVMNlAaUjhbE=;
 b=q9fweg+NRKwXTWPpVFyIstXAo9XfhlFfRauP6A0UbPHwds/IzWzI2dyFkhxH3aaX2n
 zA+RkWtXJ3RWSUYrn6gPnnLC90mkfiXLXTKUiI2dxwAASFlrYQF0S/1aQSTO0t0MFmah
 0MMpiYS/T5Y9UIXfHSTAM+zpuDvheOAZ9C0NuRoiAyO3mzQ4Q3LymGWOZOIkZj6iT8kI
 52o/b0T4LjU+GB4lNM88r505hnWwHSyjC//z9msWqIwKddTmGDcCb6bR2R6XXNIwVTrd
 B2hrIOexyvgQ4t4SD4N4/yMSo8kL9hVvJwIS390ls/qdvTvcXjZFvcnMeqwl/nsERtAk
 dMQA==
X-Gm-Message-State: AOAM532MOOhOG0mxIBzZd8wWjkrxDGIOFgPcRI2ve2pf5JrxYfPT6rWu
 4VDiExzrNm+s4hfqkTp0x6TmrQ==
X-Google-Smtp-Source: ABdhPJwOzBBTRMO7WP0ysMWvIabKZC+xxjI7fVXfadOJXA6vj4A5CKQkykoxeUt0RuUbHttopPbOHw==
X-Received: by 2002:a1c:2001:: with SMTP id g1mr3488686wmg.179.1606398205360; 
 Thu, 26 Nov 2020 05:43:25 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/40] drm/amd/pm/powerplay/hwmgr/hwmgr: Move
 'vega20_hwmgr_init()'s prototype to shared header
Date: Thu, 26 Nov 2020 13:42:27 +0000
Message-Id: <20201126134240.3214176-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:14:32 +0000
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5j
OjQ0MDM6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJh2ZWdhMjBfaHdt
Z3JfaW5pdOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiA0NDAzIHwgaW50IHZlZ2EyMF9od21n
cl9pbml0KHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiB8IF5+fn5+fn5+fn5+fn5+fn5+CgpDYzog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVl
IEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L2luYy9od21nci5oICAgICAgICAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bv
d2VycGxheS9od21nci9od21nci5jIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9p
bmMvaHdtZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgKaW5kZXggNDk5
ZjI1MjBiMWFhMy4uNDkwMzcxYmQyNTIwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9pbmMvaHdtZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5o
CkBAIC04MzEsNSArODMxLDYgQEAgaW50IGh3bWdyX2hhbmRsZV90YXNrKHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IsCiBpbnQgc211N19pbml0X2Z1bmN0aW9uX3BvaW50ZXJzKHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IpOwogaW50IHNtdThfaW5pdF9mdW5jdGlvbl9wb2ludGVycyhzdHJ1Y3QgcHBfaHdt
Z3IgKmh3bWdyKTsKIGludCB2ZWdhMTJfaHdtZ3JfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdy
KTsKK2ludCB2ZWdhMjBfaHdtZ3JfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKTsKIAogI2Vu
ZGlmIC8qIF9IV01HUl9IXyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9w
b3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5
L2h3bWdyL2h3bWdyLmMKaW5kZXggNDlmOGEzMzFlYjAyZS4uNmE3ZGU4Yjg5OGZhZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9od21nci5jCkBAIC00Nyw3
ICs0Nyw2IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3QgcHBfc211bWdyX2Z1bmMgc211MTBfc211X2Z1
bmNzOwogZXh0ZXJuIGNvbnN0IHN0cnVjdCBwcF9zbXVtZ3JfZnVuYyB2ZWdhMjBfc211X2Z1bmNz
OwogCiBleHRlcm4gaW50IHZlZ2ExMF9od21ncl9pbml0KHN0cnVjdCBwcF9od21nciAqaHdtZ3Ip
OwotZXh0ZXJuIGludCB2ZWdhMjBfaHdtZ3JfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKTsK
IGV4dGVybiBpbnQgc211MTBfaW5pdF9mdW5jdGlvbl9wb2ludGVycyhzdHJ1Y3QgcHBfaHdtZ3Ig
Kmh3bWdyKTsKIAogc3RhdGljIGludCBwb2xhcmlzX3NldF9hc2ljX3NwZWNpYWxfY2FwcyhzdHJ1
Y3QgcHBfaHdtZ3IgKmh3bWdyKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4Cg==
