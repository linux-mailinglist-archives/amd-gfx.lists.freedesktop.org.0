Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733262B50B4
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 20:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C146E0D2;
	Mon, 16 Nov 2020 19:18:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD9D6E04A
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p22so25179wmg.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3URZpu7tsjM6Y8F+U84uwe7BiqZoOF3VMCws5wVhmBo=;
 b=hJrk2c+MVVdRgOF38FOlxwZWmiyLarfSS1Z8YpKs4nyoSArMJJWYspiabittQjN7ge
 PEYx4sy7GfltMkTs9r1iIcNL2prnE133gYn55x1A92PuiVhze7KyJISv2G5hxR1c7tCo
 TKcGtqO9xPjRvnmgCca27nh5qDlemubQhWynuDC2ye9xIbz/1WKREnvkFuPTp9lqSJwB
 Lyt32RJ0UiU6AlAnqUlzu9N9RhT8UVpqrogxW+yNJyDb0z++8MYJYiULpdVM1c+b1Itw
 dDOykSolZ5VlKqsKfFuGndE76bz3Jj2OUe0QbLhyi1VnQlFaMcjB2sOqdiKFpvWAzWNg
 XXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3URZpu7tsjM6Y8F+U84uwe7BiqZoOF3VMCws5wVhmBo=;
 b=SzdeUzhJx0ouMQ1YP6dR85sIJBAewp0Pk68CiIcHJQ0mP1BR/+hG+72ZV0qVlCpZRK
 rQiItZGdvFH7J/o9wOwTXpDCrKXXb1pYjrpLmfEUHQgFea/P3HM1wTm+GRPSQx0hXO2c
 GJ9L2xYxKo57tcf8jvakCR9qJjODDMsrxr+UzkDGUNFlAyfsQr2JmNdxgywtzbqb7Myh
 v86ocrzkwX3WJOgtaGqeCfQilbCn0LBEijHCLc6GpMnN36nQCOpBXUa/k9JyUs6H+Rxk
 ePjVmuzW9+E6UkH88pq+PbQ+e7I/pSk60F6i9r0G1DRN2OTTuKshXvCF82CsnCHG2Dab
 GQwQ==
X-Gm-Message-State: AOAM532PMsOJhJtvOWdlPdMnTPcwLXcHUzimjVtYEcogPf7JMEoSQov/
 Zfhrl50JwQbs/5CKvnXyO9zSxg==
X-Google-Smtp-Source: ABdhPJzLMcGyo4T2FArxObi4BCVhAjl+Vji/+nc2gO0MsC3VaYvnAWIHq1QwuCtwUjOfPKwM9a5FlQ==
X-Received: by 2002:a1c:97:: with SMTP id 145mr18960wma.72.1605548261899;
 Mon, 16 Nov 2020 09:37:41 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/43] drm/radeon/radeon_encoders: Move
 'radeon_atom_backlight_init's prototype to shared header
Date: Mon, 16 Nov 2020 17:36:44 +0000
Message-Id: <20201116173700.1830487-28-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19lbmNvZGVycy5jOjE4Njo2OiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9hdG9tX2JhY2tsaWdodF9pbml04oCZIFst
V21pc3NpbmctcHJvdG90eXBlc10KIDE4NiB8IHZvaWQgcmFkZW9uX2F0b21fYmFja2xpZ2h0X2lu
aXQoc3RydWN0IHJhZGVvbl9lbmNvZGVyICpyYWRlb25fZW5jb2RlciwKIHwgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJp
b3MuaCB8IDQgKysrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZW5jb2RlcnMuYyB8
IDYgKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5o
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuaAppbmRleCBhODk1YTcw
MDJjM2QzLi5mZDAzNzU1ZTZmYTJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9hdG9tYmlvcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0
b21iaW9zLmgKQEAgLTI4LDE0ICsyOCwxOCBAQAogI2lmbmRlZiBfX1JBREVPTl9BVE9NQklPU19I
X18KICNkZWZpbmUgX19SQURFT05fQVRPTUJJT1NfSF9fCiAKK3N0cnVjdCBkcm1fY29ubmVjdG9y
Owogc3RydWN0IGRybV9kZXZpY2U7CiBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZTsKIHN0cnVjdCBy
YWRlb25fZGV2aWNlOworc3RydWN0IHJhZGVvbl9lbmNvZGVyOwogCiBib29sIHJhZGVvbl9hdG9t
X2dldF90dl90aW1pbmdzKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQgaW5kZXgsCiAJ
CQkJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwogdm9pZCByYWRlb25fYWRkX2F0b21f
ZW5jb2RlcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1aW50MzJfdCBlbmNvZGVyX2VudW0sCiAJ
CQkgICAgIHVpbnQzMl90IHN1cHBvcnRlZF9kZXZpY2UsIHUxNiBjYXBzKTsKK3ZvaWQgcmFkZW9u
X2F0b21fYmFja2xpZ2h0X2luaXQoc3RydWN0IHJhZGVvbl9lbmNvZGVyICpyYWRlb25fZW5jb2Rl
ciwKKwkJCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqZHJtX2Nvbm5lY3Rvcik7CiAKIAogI2VuZGlm
ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIF9fUkFERU9OX0FUT01CSU9TX0hfXyAqLwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZW5jb2RlcnMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2VuY29kZXJzLmMKaW5kZXggYjYwYTM3M2QzZWFkMy4u
NDY1NDlkNTE3OWVlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZW5jb2RlcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9lbmNvZGVycy5j
CkBAIC0zMSwxNCArMzEsMTAgQEAKICNpbmNsdWRlIDxkcm0vcmFkZW9uX2RybS5oPgogCiAjaW5j
bHVkZSAicmFkZW9uLmgiCisjaW5jbHVkZSAicmFkZW9uX2F0b21iaW9zLmgiCiAjaW5jbHVkZSAi
cmFkZW9uX2xlZ2FjeV9lbmNvZGVycy5oIgogI2luY2x1ZGUgImF0b20uaCIKIAotZXh0ZXJuIHZv
aWQKLXJhZGVvbl9hdG9tX2JhY2tsaWdodF9pbml0KHN0cnVjdCByYWRlb25fZW5jb2RlciAqcmFk
ZW9uX2VuY29kZXIsCi0JCQkgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqZHJtX2Nvbm5lY3Rvcik7
Ci0KLQogc3RhdGljIHVpbnQzMl90IHJhZGVvbl9lbmNvZGVyX2Nsb25lcyhzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIpCiB7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGVuY29kZXItPmRl
djsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
