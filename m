Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379832ADFC8
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Nov 2020 20:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7987D89C88;
	Tue, 10 Nov 2020 19:35:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60BB89C16
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k2so10634198wrx.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPrx+xhJSBB8cqNRTfRxpV861JL0F49FY7TxVtUc7KQ=;
 b=fvWFmwsbroPTBLuNSiqWL2C6ts7uBNUTAb85H5SQq/MGaMS1cangSJSSeVWp3XHAlm
 TSQnGisZL/NyszChhDltBHKvM3dyXcKX4vHlVYbByt+kOxb6EBSQp42dJY03Zam8JIPs
 QaOSrWVSI/8rL9nPM2sQ4O4ugLFkrQP9kKv78PsPcGbBsEn3GyQ/XWMy2LXergaa43Nx
 sBGNfZcE1U1Ip0vwO/MjqTFzwQEnKA0RhW3ZXRQigi9wnRgwVnzw11RhpsvhP0K+3ubm
 n/P+ilwrfzZiFMGnGZZzyqXTxW0Msd+N+e1W9SZsJJQJ8JHrgrCB8jRpRhMBvGuXZE9y
 j7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPrx+xhJSBB8cqNRTfRxpV861JL0F49FY7TxVtUc7KQ=;
 b=CIAeBY0GXAbGAMEIwgZGKYzjQRj1DOCi7l/v38Kx/dIB74prXcNO702jHWT709haKc
 H75bQPp0DUMiTu4+x95QNXHueDUtqr/41ODG8CdL42ZkE86RoL6F9fRxEstBWgrRMPqH
 X01KGBkgBakik0dA2Vc6g4KW11TYyFdBEOT55EPIUfswDgezuPjP1Ehrq/xZlnCZMSCU
 4qXQs50o7Z3X07s0vAQJeHtbuH10CGr01f9bncK8mYYqUj3uIrruQqy4pDfGSncZlO5B
 g1i00u6C7akaZcgpg0phuVGXfCafb9qEuQjwlpjXf0sStQSaj5Lz/5vnb7zVVOHq+gFD
 a7nQ==
X-Gm-Message-State: AOAM531j5XAkzw1j6acxaGTmxr3mYA5Zg8CCNyGOPrxuUIUVXWNvhJmX
 W+4gqissNyvkrsnHz5pUbLDXtA==
X-Google-Smtp-Source: ABdhPJw9P+/6eiSGMjIagfmvzL2nZILnywLdK1sKrl9EFU2mVczfvrgcm5GN51EDLktxPdDmixc2Qw==
X-Received: by 2002:adf:f644:: with SMTP id x4mr26077443wrp.5.1605036708589;
 Tue, 10 Nov 2020 11:31:48 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/30] drm/radeon/ni_dpm: Move 'ni_get_{pi,
 ps}()'s into shared header
Date: Tue, 10 Nov 2020 19:31:08 +0000
Message-Id: <20201110193112.988999-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Nov 2020 19:35:45 +0000
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9uaV9kcG0uYzo3Mjc6MjM6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3Ig4oCYbmlfZ2V0X3Bp4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIDcyNyB8
IHN0cnVjdCBuaV9wb3dlcl9pbmZvICpuaV9nZXRfcGkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYpCiB8IF5+fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9uaV9kcG0uYzo3MzQ6MTU6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYbmlfZ2V0X3Bz4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KIDczNCB8IHN0cnVjdCBuaV9wcyAqbmlfZ2V0X3BzKHN0cnVjdCBy
YWRlb25fcHMgKnJwcykKIHwgXn5+fn5+fn5+CgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
bmlfZHBtLmggfCAzICsrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYyB8IDMgKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pX2RwbS5oIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9uaV9kcG0uaAppbmRleCA2YmJlZTkxODA5MDllLi43NGUzMDE5MzY5MDYzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pX2RwbS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vbmlfZHBtLmgKQEAgLTI0Nyw0ICsyNDcsNyBAQCB2b2lkIG5pX3NldF91dmRf
Y2xvY2tfYWZ0ZXJfc2V0X2VuZ19jbG9jayhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKIAog
Ym9vbCBuaV9kcG1fdmJsYW5rX3Rvb19zaG9ydChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CiAKK3N0cnVjdCBuaV9wb3dlcl9pbmZvICpuaV9nZXRfcGkoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpOworc3RydWN0IG5pX3BzICpuaV9nZXRfcHMoc3RydWN0IHJhZGVvbl9wcyAqcnBzKTsK
KwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYwppbmRleCBhODBhMjE0NDdhNzZkLi5jNjhh
YjJmYjFhYzIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmMKQEAgLTMwLDYgKzMwLDcgQEAKICNp
bmNsdWRlICJydjc3MC5oIgogI2luY2x1ZGUgInJhZGVvbi5oIgogI2luY2x1ZGUgInJhZGVvbl9h
c2ljLmgiCisjaW5jbHVkZSAibmlfZHBtLmgiCiAjaW5jbHVkZSAic2lfZHBtLmgiCiAjaW5jbHVk
ZSAic2lkLmgiCiAKQEAgLTE3MTksOCArMTcyMCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2lf
cG93ZXJ0dW5lX2RhdGEgcG93ZXJ0dW5lX2RhdGFfaGFpbmFuID0KIH07CiAKIHN0cnVjdCBldmVy
Z3JlZW5fcG93ZXJfaW5mbyAqZXZlcmdyZWVuX2dldF9waShzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldik7Ci1zdHJ1Y3QgbmlfcG93ZXJfaW5mbyAqbmlfZ2V0X3BpKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKLXN0cnVjdCBuaV9wcyAqbmlfZ2V0X3BzKHN0cnVjdCByYWRlb25fcHMgKnJw
cyk7CiAKIGV4dGVybiBpbnQgc2lfbWNfbG9hZF9taWNyb2NvZGUoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwogZXh0ZXJuIHZvaWQgdmNlX3YxXzBfZW5hYmxlX21nY2coc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYsIGJvb2wgZW5hYmxlKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
