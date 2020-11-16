Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7E2B50B5
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 20:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BDA6EA29;
	Mon, 16 Nov 2020 19:18:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB11C6E03C
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r17so19661972wrw.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oQB5rAR+1+kEveAEir1T88yOeq9CZP66J4NDJ9xsMf8=;
 b=Vc5GZewOWwNVlQxibWBU3viESAoqgPega2X6NU2xDrzPEahsS9QUDJyPFhPBGFxdC7
 HBykf6FEj3VInb3HC2V6P17mmyOfqFSHC5kzDIQ8keYwRRL+9LrGlFxItlQxe7LbDUgS
 LvE8HF7vZOo6iSgSePndqpGMp3P+yqXd28lpYJEDSCVc082lkOLc+G3gnEmolCbEa894
 QD/47FaLCwFsP5QUfCCyofyVYQkoOV6DyHCYDTFnyF6pxQF1iMWWrePksIFBvIVqxZFF
 WCeD2yvs8YItRj9sXCz0v5tGaQqPL9HrZnmh7TOfWG5b/iViPG4YuTZeBPSFhxFB7ae2
 Nzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oQB5rAR+1+kEveAEir1T88yOeq9CZP66J4NDJ9xsMf8=;
 b=GQmpGVdUzltbzVp6r9EeNShLhZk81IYFbhSzy3UlKNXCm5DNt8dQczWunYUO/6wZQN
 TFjaVOYcOC6zpeCssDbZKp/TsrfC0T5ySsjbI2aN1aKtJwZNaziAMMQB5JKSj9/zkaSh
 /9X5smjbgKcoO3hewIfipjxyhuC7MiWfwp/e/EpVeiAHD6sjocvcZKnmLjDmBjJ/SANs
 Ta2vGOYbcZgfGuRmMIyuq5jASOorQaSvoF9Wq39nLo5Y2Gh8mXaCK7RI6zCMkSLJOxEF
 TD5BGWoyPq8Mv2lkZqIz1TMHFbO7FrXaGdO3esHWvAYjH6Y+B5IkaXc1diTh48T43SCK
 9E/g==
X-Gm-Message-State: AOAM530+JkAaBdAtOyYPQNpdb3TIntjtz+soW2sbpJ4OFWzjRBK/O2Sm
 4NdPwDn9wl32CpyZukQJ1ZEZgg==
X-Google-Smtp-Source: ABdhPJzyMT4+odwIPp9VPe5j6JTcciaX+poblLtpI5iFjA5SyWdLDWAzEN7gzzZBk12h4g2H4yez3A==
X-Received: by 2002:adf:f881:: with SMTP id u1mr21824326wrp.103.1605548233683; 
 Mon, 16 Nov 2020 09:37:13 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/43] drm/radeon/radeon_legacy_encoders: Move
 'radeon_add_legacy_encoder's prototype to shared location
Date: Mon, 16 Nov 2020 17:36:24 +0000
Message-Id: <20201116173700.1830487-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 19:18:13 +0000
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X2VuY29kZXJzLmM6MTc0NjoxOiB3YXJuaW5n
OiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9hZGRfbGVnYWN5X2VuY29kZXLi
gJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogMTc0NiB8IHJhZGVvbl9hZGRfbGVnYWN5X2VuY29k
ZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMyX3QgZW5jb2Rlcl9lbnVtLCB1aW50MzJf
dCBzdXBwb3J0ZWRfZGV2aWNlKQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpDYzogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBT
ZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYyAgICAgICAgfCA2ICstLS0tLQogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29tYmlvcy5jICAgICAgICAgfCA2ICstLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X2VuY29kZXJzLmggfCAyICsrCiAz
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmMKaW5kZXggNzFiZjJlZDE3MjY5Ny4uY2M4
MDY1MWIyNTc3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRv
bWJpb3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5jCkBA
IC0zNSwxNiArMzUsMTIgQEAKICNpbmNsdWRlICJhdG9tLWJpdHMuaCIKICNpbmNsdWRlICJyYWRl
b25fYXNpYy5oIgogI2luY2x1ZGUgInJhZGVvbl9hdG9tYmlvcy5oIgorI2luY2x1ZGUgInJhZGVv
bl9sZWdhY3lfZW5jb2RlcnMuaCIKIAogZXh0ZXJuIHZvaWQKIHJhZGVvbl9hZGRfYXRvbV9lbmNv
ZGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVpbnQzMl90IGVuY29kZXJfZW51bSwKIAkJCXVp
bnQzMl90IHN1cHBvcnRlZF9kZXZpY2UsIHUxNiBjYXBzKTsKIAotLyogZnJvbSByYWRlb25fbGVn
YWN5X2VuY29kZXIuYyAqLwotZXh0ZXJuIHZvaWQKLXJhZGVvbl9hZGRfbGVnYWN5X2VuY29kZXIo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMyX3QgZW5jb2Rlcl9lbnVtLAotCQkJICB1aW50
MzJfdCBzdXBwb3J0ZWRfZGV2aWNlKTsKLQogdW5pb24gYXRvbV9zdXBwb3J0ZWRfZGV2aWNlcyB7
CiAJc3RydWN0IF9BVE9NX1NVUFBPUlRFRF9ERVZJQ0VTX0lORk8gaW5mbzsKIAlzdHJ1Y3QgX0FU
T01fU1VQUE9SVEVEX0RFVklDRVNfSU5GT18yIGluZm9fMjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2NvbWJpb3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2NvbWJpb3MuYwppbmRleCBkM2MwNGRmN2U3NWQ3Li5mZjIxMzUwNTljMDcxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb21iaW9zLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29tYmlvcy5jCkBAIC0zMSw2ICszMSw3IEBACiAj
aW5jbHVkZSA8ZHJtL3JhZGVvbl9kcm0uaD4KIAogI2luY2x1ZGUgInJhZGVvbi5oIgorI2luY2x1
ZGUgInJhZGVvbl9sZWdhY3lfZW5jb2RlcnMuaCIKICNpbmNsdWRlICJhdG9tLmgiCiAKICNpZmRl
ZiBDT05GSUdfUFBDX1BNQUMKQEAgLTQwLDExICs0MSw2IEBACiAjaW5jbHVkZSA8YXNtL3Byb20u
aD4KICNlbmRpZiAvKiBDT05GSUdfUFBDX1BNQUMgKi8KIAotLyogZnJvbSByYWRlb25fbGVnYWN5
X2VuY29kZXIuYyAqLwotZXh0ZXJuIHZvaWQKLXJhZGVvbl9hZGRfbGVnYWN5X2VuY29kZXIoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMyX3QgZW5jb2Rlcl9lbnVtLAotCQkJICB1aW50MzJf
dCBzdXBwb3J0ZWRfZGV2aWNlKTsKLQogLyogb2xkIGxlZ2FjeSBBVEkgQklPUyByb3V0aW5lcyAq
LwogCiAvKiBDT01CSU9TIHRhYmxlIG9mZnNldHMgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2xlZ2FjeV9lbmNvZGVycy5oIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fbGVnYWN5X2VuY29kZXJzLmgKaW5kZXggYTgwYjM4NzU1OWQ0ZC4uZjRjNzQz
MjI2N2U2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5
X2VuY29kZXJzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X2Vu
Y29kZXJzLmgKQEAgLTMwLDUgKzMwLDcgQEAKIAogdm9pZCByYWRlb25fbGVnYWN5X2JhY2tsaWdo
dF9pbml0KHN0cnVjdCByYWRlb25fZW5jb2RlciAqcmFkZW9uX2VuY29kZXIsCiAJCQkJICBzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqZHJtX2Nvbm5lY3Rvcik7Cit2b2lkIHJhZGVvbl9hZGRfbGVnYWN5
X2VuY29kZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMyX3QgZW5jb2Rlcl9lbnVtLAor
CQkJICAgICAgIHVpbnQzMl90IHN1cHBvcnRlZF9kZXZpY2UpOwogCiAjZW5kaWYJCQkJLyogX19S
QURFT05fTEVHQUNZX0VOQ09ERVJTX0hfXyAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
