Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319BB2F4661
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Jan 2021 09:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA956E138;
	Wed, 13 Jan 2021 08:24:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18BC89F89
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r7so1068657wrc.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QtOB/mkCBg/7k2V+Yul5Q3zrw4uvSu6D+ZDw375QQ1c=;
 b=RlPHM1p/vG4SiuUwAw1bbIS+KMHFtNuIJRaOGSj+2QN2Xv9MYmpXiHybJdI3JFPrx9
 rcHTpY4z2TUTAfTT1I4Oj+dYy1Hoq9VB4U7/nMWz8M3OeGbsigW+GAcdlv43iq+PGUqc
 N/cHJxQw7WOtopw0GWdLqfI59hhkzZnOcSo7/WDLBGdj/umo2fYaYvciEXE+O4JwVn7J
 7nL1q7H638KJMQx/i6LfIKD5pmJ7JhBscMqHmPRL/AUL5ZZQHYmHOg0fVC6TrZFE2wX5
 RiRcZAQbYaxDh/JmbM+g5OXeOQUIqAjF2kPGe8QidqmB+v8VvhcXal041dC+f32wFYfy
 OUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtOB/mkCBg/7k2V+Yul5Q3zrw4uvSu6D+ZDw375QQ1c=;
 b=ZI26OZEyidk+0n7yIM3VBXghU45v0fWMl/EFBcohvh2pz4bL+MEwgmsXCh2jJWelnY
 /CnNV3xYTa0IvuONR1G4uDZgkq9ZXwaxrjhPoOoTNAVoUlOGLRrfB/C+g2KMwPf+90qM
 M89EgDsAudreqzlVEvka/cRVSwWXzSX5J34NEkVhMer1hQDR3ckm626ibeYpCIw/LlWX
 pShc3S28W76SqdZYkDACYvBV1ttAeEkDpkzcS/OBtLlgzNkLU/jvgwHqfEboU0JGh6xw
 518CxAeV+QU2U8eyfDaGVWeAiJUlTSldIc7JXuikvnQ4EbOmV4A+TJ4wReHUBO/YAr0b
 Ymiw==
X-Gm-Message-State: AOAM530QGub2/UtcR0twjolq+Kxa5KNsnQS4+P8TAUgMFp1t6Xf1YSk2
 oR4vGKO6s4+6T44T9QukHlc9/Q==
X-Google-Smtp-Source: ABdhPJywG3pcXtpKgqZEPCytcOe3O9Nzdu7Pq9pYz665OvcE3oeucdt1OjBpXy9CDZfBHI6bFQh8Pw==
X-Received: by 2002:a5d:4112:: with SMTP id l18mr1191436wrp.116.1610525288602; 
 Wed, 13 Jan 2021 00:08:08 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/30] drm/amd/display/dc/core/dc: Staticise local function
 'apply_ctx_interdependent_lock'
Date: Wed, 13 Jan 2021 08:07:32 +0000
Message-Id: <20210113080752.1003793-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:24:28 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjLmM6ODA2OjY6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYXBwbHlfY3R4X2ludGVyZGVwZW5kZW50
X2xvY2vigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5kZXggOGYxY2FkYjgyM2M3MS4uMGEwN2U2MDg0ODVm
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC04MDMsNyAr
ODAzLDggQEAgc3RhdGljIHZvaWQgZGlzYWJsZV9hbGxfd3JpdGViYWNrX3BpcGVzX2Zvcl9zdHJl
YW0oCiAJCXN0cmVhbS0+d3JpdGViYWNrX2luZm9baV0ud2JfZW5hYmxlZCA9IGZhbHNlOwogfQog
Ci12b2lkIGFwcGx5X2N0eF9pbnRlcmRlcGVuZGVudF9sb2NrKHN0cnVjdCBkYyAqZGMsIHN0cnVj
dCBkY19zdGF0ZSAqY29udGV4dCwgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLCBib29s
IGxvY2spCitzdGF0aWMgdm9pZCBhcHBseV9jdHhfaW50ZXJkZXBlbmRlbnRfbG9jayhzdHJ1Y3Qg
ZGMgKmRjLCBzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsCisJCQkJCSAgc3RydWN0IGRjX3N0cmVh
bV9zdGF0ZSAqc3RyZWFtLCBib29sIGxvY2spCiB7CiAJaW50IGkgPSAwOwogCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
