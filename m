Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F372B1D62
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Nov 2020 15:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37046E5B0;
	Fri, 13 Nov 2020 14:28:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136BC6E588
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c16so8555231wmd.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0nBtcs67BpWpOtsS+lroYBZ8Diqx4j2HTgrmz/2vMqY=;
 b=MZqbEth6gfS7gsdu8IDgb7OmV3SEY4rst4Sy2mkC6oksoLOtw6fd22wjt+QT2/Yw2H
 62bL1YqeHmtIX6VodEiiU+N74OMmHF2P3tuz/aHXhCn+9HMoG7z9b4NJBuXg6ytgHid6
 HE2Sk7dx4QRuNx7vDJ1UG6liqfUrpDPgTGAY0pP+XzXaQQ1lqH4kw2gTA3NUxQtTrLtl
 wi0i/JshReJaWzdC+Wqguzyj/iwJZIDR2991HnAHfb2QxqoEFRV9LfJH38BHW6tTzqBW
 JZNCBDhKFa8U64wvxMiCTkhmUgv+ojpTS4RSvfMh6LDeBb9EPee4VhoqIC0Uh5N+lw+7
 leMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0nBtcs67BpWpOtsS+lroYBZ8Diqx4j2HTgrmz/2vMqY=;
 b=NtLypZm7JQzQ07kmYnOENDeIhqkj/wKrQCzqTabjS2YKaTE4Tvo00NRkzry/pOiiGH
 5DDhBXNd2SCN2qmoB19l0j8xghKZiGN5kIwPQSO0/pnfyp95RYtW/keDG+uGFzy1BRVI
 1pCkQoG3pCbMHfAFL/7iWymWscTYGTZl8sFrH3Zx+CF7ubf44ZUcUR01wv9LY9rKoEo7
 C34irvrb43JQjDLGND1zYNUuWnt7GbycNrPEOdudpX2qclEsChFq0jRz/qXb4tf5kYNk
 d8nwFYYzSHQNTaTsJwzITUHVLAKgAp+4aR74Z1m0BrTS/QAPenCQUjFcZ4n39p7xkfD2
 hp8A==
X-Gm-Message-State: AOAM533KCy2PJni8X6LOGqQXy+pRNppMuUpD09XRuSo/GnuQGjs/9WSe
 BX/wa/6iwABYXh3/mpWP0UABVg==
X-Google-Smtp-Source: ABdhPJxu5mybMd3oZAipyOuLv/NoqB/Sknp+7MJ4jdBGXBUKsP93PylVtz4Lu+Xsi+XwvfjExrOung==
X-Received: by 2002:a7b:c089:: with SMTP id r9mr2532584wmh.45.1605275417717;
 Fri, 13 Nov 2020 05:50:17 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/40] drm/amd/amdgpu/amdgpu_csa: Remove set but unused
 variable 'r'
Date: Fri, 13 Nov 2020 13:49:27 +0000
Message-Id: <20201113134938.4004947-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Nov 2020 14:28:19 +0000
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Monk.liu@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jOiBJbiBmdW5jdGlvbiDigJhhbWRncHVf
YWxsb2NhdGVfc3RhdGljX2NzYeKAmToKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jc2EuYzo0MDo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhy4oCZIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBNb25rLmxpdUBhbWQuY29tCkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYyB8IDMgKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2NzYS5jCmluZGV4IDA4MDQ3YmM0ZDU4ODYuLmRhMjFlNjBiYjgyNzIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jc2EuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMKQEAgLTM3LDEwICszNyw5IEBA
IHVpbnQ2NF90IGFtZGdwdV9jc2FfdmFkZHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiBp
bnQgYW1kZ3B1X2FsbG9jYXRlX3N0YXRpY19jc2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHN0cnVjdCBhbWRncHVfYm8gKipibywKIAkJCQl1MzIgZG9tYWluLCB1aW50MzJfdCBzaXplKQog
ewotCWludCByOwogCXZvaWQgKnB0cjsKIAotCXIgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbChh
ZGV2LCBzaXplLCBQQUdFX1NJWkUsCisJYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgc2l6
ZSwgUEFHRV9TSVpFLAogCQkJCWRvbWFpbiwgYm8sCiAJCQkJTlVMTCwgJnB0cik7CiAJaWYgKCEq
Ym8pCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
