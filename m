Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0148F4F
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E51789C05;
	Mon, 17 Jun 2019 19:31:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854D589C07
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:41 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id p144so6927009qke.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Z5Yhl+vESvtMSbBhUFkDMH7gxbCHLCGiI29KB89J2U=;
 b=DPSKyxrZQvCeuvutvisSwlW+mXBR+A6ZfS8FWquorYtoSkrTVImtxgc8TEnyK7LUZq
 6SipGIv/I3vZekkgGhO/GM+R5E+S8qNSgvePFzs3JwRbKg0fzxVD/Mj0+x2g4uefwSI+
 th0Qzx14RbAqB3u00JsFLMEj7LZfGqwm8v28olxyFx2Q70lT9YTxaFLUAB21WikZjegG
 wyeBeYIhuNNzClpxxIvko9lIb7VOr6HLLd+uvd5nIUc7uKvBTjhjQ1maGELz6g1lIt3T
 lH8YqmLcQndHJbIVrBGdfMQljWh788SMuMpjygXDcf/jkcXDXhWwgifdeaBxZXoKga0S
 la2Q==
X-Gm-Message-State: APjAAAVM5SAIR6ZIYkDjJ8RGitjcxRo/YxJTBh64JmYY5yhCrmJ1N0pB
 mIy7DzmA+g4/VAR/YOpt49gncTjHFwk=
X-Google-Smtp-Source: APXvYqzNPel2R3LksWCGuIjQuMUswQcMbEz25XEkMqkFh+M/6fWZropRa2lJP+2UYexu2ZswiH6JKg==
X-Received: by 2002:a37:9a97:: with SMTP id
 c145mr88036159qke.309.1560799899996; 
 Mon, 17 Jun 2019 12:31:39 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 230/459] drm/amd/powerplay: add helper function of
 smu_get_dpm_freq_range
Date: Mon, 17 Jun 2019 14:29:57 -0500
Message-Id: <20190617193106.18231-31-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Z5Yhl+vESvtMSbBhUFkDMH7gxbCHLCGiI29KB89J2U=;
 b=R0nMFnZ02tPvB5BMC7vAbscBRRy8m7XML5ozzF2ksQYGLLBClWezKrASubbpfdcphD
 U0YEuGmvay8R0FNri/1Ss14w4YdaAxx5Jl8tj58hDg9R6dcDXrJStq1V3QQlDak/zA3x
 cSkMzmLSG1bbuj3GswhsW/3YgJ+saI11bg6LnHSIwQjiZjIbIdYByP0Va2gJ/pK+M3Yu
 go7F2/BEMFRuDimcSwTYNeJ055BZMw6phwpzr8zITFiZmKUFj66R4AJTPBnkaBwOR/1L
 rBDXnhbG4HXHnFwZ5vWBfmcQTBGhR78xTjcNXopROSFfC87YhbOKvOppuYgPGCNe6w26
 1/iw==
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

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCB0aGlzIGhlbHBlciBm
dW5jdGlvbiB0byBnZXQgZHBtIGNsayBpbmZvcm1hdGlvbiAobWluLCBtYXgpOwoKU2lnbmVkLW9m
Zi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5n
IFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMgICAgfCAzNiArKysrKysrKysrKysrKysrKysrCiAuLi4vZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggICAgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jCmluZGV4IGQ1NjVkYjRjZTZkOC4uYzM3ZjU5YjM5OTViIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC02MCw2ICs2MCw0MiBAQCBpbnQgc211
X2dldF9zbWNfdmVyc2lvbihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgKmlmX3Zl
cnNpb24sIHVpbnQzMl90CiAJcmV0dXJuIHJldDsKIH0KIAoraW50IHNtdV9nZXRfZHBtX2ZyZXFf
cmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gc211X2Nsa190eXBlIGNsa190eXBl
LAorCQkJICAgdWludDMyX3QgKm1pbiwgdWludDMyX3QgKm1heCkKK3sKKwlpbnQgcmV0ID0gMCwg
Y2xrX2lkID0gMDsKKwl1aW50MzJfdCBwYXJhbSA9IDA7CisKKwlpZiAoIW1pbiAmJiAhbWF4KQor
CQlyZXR1cm4gLUVJTlZBTDsKKworCWNsa19pZCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xr
X3R5cGUpOworCWlmIChjbGtfaWQgPCAwKQorCQlyZXR1cm4gY2xrX2lkOworCisJcGFyYW0gPSAo
Y2xrX2lkICYgMHhmZmZmKSA8PCAxNjsKKworCWlmIChtYXgpIHsKKwkJcmV0ID0gc211X3NlbmRf
c21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19HZXRNYXhEcG1GcmVxLCBwYXJhbSk7CisJ
CWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCQlyZXQgPSBzbXVfcmVhZF9zbWNfYXJnKHNtdSwg
bWF4KTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJfQorCisJaWYgKG1pbikgeworCQly
ZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX0dldE1pbkRwbUZy
ZXEsIHBhcmFtKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJCXJldCA9IHNtdV9yZWFk
X3NtY19hcmcoc211LCBtaW4pOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisKKwly
ZXR1cm4gcmV0OworfQorCiBpbnQgc211X2dldF9kcG1fZnJlcV9ieV9pbmRleChzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCiAJCQkgICAgICB1aW50
MTZfdCBsZXZlbCwgdWludDMyX3QgKnZhbHVlKQogewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5kZXggMTZkNmY1NTNiYTdmLi43ODk5M2U0ZWU1
ODggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVf
c211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUu
aApAQCAtOTM5LDQgKzkzOSw2IEBAIGludCBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwCiAJCQkgICAgICB1
aW50MTZfdCBsZXZlbCwgdWludDMyX3QgKnZhbHVlKTsKIGludCBzbXVfZ2V0X2RwbV9sZXZlbF9j
b3VudChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUs
CiAJCQkgICAgdWludDMyX3QgKnZhbHVlKTsKK2ludCBzbXVfZ2V0X2RwbV9mcmVxX3JhbmdlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwKKwkJCSAg
IHVpbnQzMl90ICptaW4sIHVpbnQzMl90ICptYXgpOwogI2VuZGlmCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
