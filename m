Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA0E2C62C7
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Nov 2020 11:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206C76EC02;
	Fri, 27 Nov 2020 10:14:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A206E957
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so2176575wrw.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5FFGLkzHxg+N+3tJLNsR8x54qcIEfrnjhf2NeR7gfvQ=;
 b=UD3E9VdWiOH8HHc3mcXJWQ6FheicN8TOMXfJTzBr2/uw6O3ZHKp7O+vhFI7xhmTbti
 PnCNSdhJn0Nnc9gsst8K+q9FHVakkCUBsYBTIZDxQI1iRVwNJhMeCqLm7QrAGKIb9fFU
 KrJZopwnbKHCGVB3l7KeG+zh3mX0fEzcPov/agJqwxK1ZEyhvsllFm7vtv/3L9X/vAhh
 U48twSGTnWelRLeaexz1rVrP6PtvVjEH77mOmVuoJTvbqHrK4EUafXvnNmMEPV6hZVoX
 360i4ts/gFwfRc6WawpK3hDLBA6+Ujppx2dH005gklhp6n8F5EIwagA+XJa/SRuGEOQB
 ZSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FFGLkzHxg+N+3tJLNsR8x54qcIEfrnjhf2NeR7gfvQ=;
 b=OrqZyqgA86fmKIaBv1g/ICTjJJl7tGYB2G3ZoRWn9kQHeZfZi2H6cL4l6Ov7yR1tbS
 2+HAwnWXsjKGysBokX6nVgdXc3V0nB7YIR5bTfkHHgv8fPlKrV3uyFR+96SsU+Df0kIc
 hsWPEsJzrd/mweG8gHmYrIX0DE+F8X5hYCdMxEq9Z3RMGZaYuv9+xQuZuaDz3tftyCGS
 Wylpc0IJApKhdkORaxioYJLcBzFQ1oJ3SeXrH67CtGI4Ljq4GkVWjE7a2VtW3I+PIg1Z
 229PauwiDk08uYyM7j3+3lFEimzTOg3/8uuUd3NM9naLtJbUPlHM0AJ02k9B8rR+Z0ei
 FfOw==
X-Gm-Message-State: AOAM531llr+VHkvOtIW2/o5FcRuZai1Oe5gZt86D9gUKO6U0ooy9V2Ks
 JP86QX8CEAizeVn3hPjbR3YhzA==
X-Google-Smtp-Source: ABdhPJxmNzrDO6hzXvMZHpA3x/Z69w/ChXfMbFEliUMfbYWcnYJafiJAzzWp9J4ygrVBaTt+0igYsQ==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr3883469wru.369.1606398188990; 
 Thu, 26 Nov 2020 05:43:08 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 16/40] drm/amd/pm/powerplay/smumgr/iceland_smumgr: Remove
 unused variable 'res'
Date: Thu, 26 Nov 2020 13:42:16 +0000
Message-Id: <20201126134240.3214176-17-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9pY2VsYW5kX3NtdW1n
ci5jOiBJbiBmdW5jdGlvbiDigJhpY2VsYW5kX3RoZXJtYWxfc2V0dXBfZmFuX3RhYmxl4oCZOgog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9pY2VsYW5k
X3NtdW1nci5jOjIwOTM6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmVz4oCZIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogRXZhbiBRdWFuIDxldmFuLnF1
YW5AYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2ljZWxhbmRfc211bWdyLmMgfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9pY2VsYW5kX3Nt
dW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2ljZWxhbmRf
c211bWdyLmMKaW5kZXggNmEwZjU4MWRlOTk5Yi4uMmRhNTIyNWVhZmJiOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2ljZWxhbmRfc211bWdyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdyL2ljZWxhbmRfc211
bWdyLmMKQEAgLTIwOTAsNyArMjA5MCw2IEBAIHN0YXRpYyBpbnQgaWNlbGFuZF90aGVybWFsX3Nl
dHVwX2Zhbl90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogCXVpbnQzMl90IHRfZGlmZjEs
IHRfZGlmZjIsIHB3bV9kaWZmMSwgcHdtX2RpZmYyOwogCXVpbnQxNl90IGZkb19taW4sIHNsb3Bl
MSwgc2xvcGUyOwogCXVpbnQzMl90IHJlZmVyZW5jZV9jbG9jazsKLQlpbnQgcmVzOwogCXVpbnQ2
NF90IHRtcDY0OwogCiAJaWYgKCFwaG1fY2FwX2VuYWJsZWQoaHdtZ3ItPnBsYXRmb3JtX2Rlc2Ny
aXB0b3IucGxhdGZvcm1DYXBzLCBQSE1fUGxhdGZvcm1DYXBzX01pY3JvY29kZUZhbkNvbnRyb2wp
KQpAQCAtMjE1NCw3ICsyMTUzLDcgQEAgc3RhdGljIGludCBpY2VsYW5kX3RoZXJtYWxfc2V0dXBf
ZmFuX3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAKIAkvKiBmYW5fdGFibGUuRmFuQ29u
dHJvbF9HTF9GbGFnID0gMTsgKi8KIAotCXJlcyA9IHNtdTdfY29weV9ieXRlc190b19zbWMoaHdt
Z3IsIHNtdTdfZGF0YS0+ZmFuX3RhYmxlX3N0YXJ0LCAodWludDhfdCAqKSZmYW5fdGFibGUsICh1
aW50MzJfdClzaXplb2YoZmFuX3RhYmxlKSwgU01DX1JBTV9FTkQpOworCXNtdTdfY29weV9ieXRl
c190b19zbWMoaHdtZ3IsIHNtdTdfZGF0YS0+ZmFuX3RhYmxlX3N0YXJ0LCAodWludDhfdCAqKSZm
YW5fdGFibGUsICh1aW50MzJfdClzaXplb2YoZmFuX3RhYmxlKSwgU01DX1JBTV9FTkQpOwogCiAJ
cmV0dXJuIDA7CiB9Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAo=
