Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38382C3AE1
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Nov 2020 09:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831616E934;
	Wed, 25 Nov 2020 08:23:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94BD6E542
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 64so10128506wra.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oqd4hAPXVQ3fy/lIhgm4S39do0C9n+Zmijh2vXrOwng=;
 b=OpNqFhKNSt+HIPPv/t65OGpW81kQdUziPNC7wzPn6N1uU+n91qp0/9HKjWKZYETyfc
 V5knlydZZ/sO9q6WaVzrlt4IywSYDcY1EnPjyk0ilr9JYGPi8KVLtsiBuUIfrHLDgmzY
 TJHVghNbiCNVrZHFz7pg29bfo13wGjJyfLfrf12gpLu9Btn+LKxA0hPsCakSHb8mbKWy
 9Mtn0PpQe3CoqS2o61k1dzAF0MtLjRTjXkBzQVOcc8PglXU2Pwe5U3/u/VKe8Hhgrl4o
 Rvgz7tuOCLl8Lxy+GkfzfSuyRwLmZ+Vrzw21iIvVkL2T6Cc5U2PqX73FisBNlz4iA5l8
 1o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oqd4hAPXVQ3fy/lIhgm4S39do0C9n+Zmijh2vXrOwng=;
 b=m8nG1GV7OaA9GvGdqorMYeSyWatVa1dt+rq9eIGphLeilBnGu63DEyGT6gy20l5eBg
 AvR2B2M+aBw7MRdCu5cjiS6UGkErBZ3z94pQDDKrc4UjLob75+jOMXDguMP3x+wUTrwM
 GidjmTYF26O+QpqWIFPbCgE2PnJHtFXZQTqtWJKnneVhwy39FIS65hHvPYGOXFfsBuAD
 HpUrDFr7LIDXpgFfF6coutjEzdhGpeVqClgbkR0YmfE9errLQ1OafETLg2ohYYk7och5
 JP5unmu8DXZiRUT8a8VSPiRJsvDnqnqj9VaEbMq0OYx1zwLVAG6WQhGkaGMs3qdCvtVP
 fZWA==
X-Gm-Message-State: AOAM532XNnTF8KkDrVSrIUSkOaBZLFPZSNA8UEczd8fNGgRkNQPzC0u5
 1rNKAt2yonnJD1R2AId6X5Qa1A==
X-Google-Smtp-Source: ABdhPJwku9UPnqBk6ZnYV6+qVhkZ9W9TpjwXx4rfs7TBedVlnAzDXNW94dPSR58L2x2Eey/ASl1Ogg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr83754wrr.1.1606247056420;
 Tue, 24 Nov 2020 11:44:16 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/40] drm/amd/amdgpu/gfx_v9_0: Make called-by-reference only
 function static
Date: Tue, 24 Nov 2020 19:37:58 +0000
Message-Id: <20201124193824.1118741-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:22:58 +0000
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYzoyOTk4OjY6IHdhcm5pbmc6IG5vIHByZXZp
b3VzIHByb3RvdHlwZSBmb3Ig4oCYZ2Z4X3Y5XzBfcmxjX3N0b3DigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlz
dHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCA4YTZjMDUwY2I2Y2FmLi5lYWU4MWZjNDEyNTU2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTI5OTUsNyArMjk5NSw3
IEBAIHN0YXRpYyB2b2lkIGdmeF92OV8wX2luaXRfcGcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJfQogfQogCi12b2lkIGdmeF92OV8wX3JsY19zdG9wKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQorc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfcmxjX3N0b3Aoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiB7CiAJV1JFRzMyX0ZJRUxEMTUoR0MsIDAsIFJMQ19DTlRMLCBSTENfRU5BQkxF
X0YzMiwgMCk7CiAJZ2Z4X3Y5XzBfZW5hYmxlX2d1aV9pZGxlX2ludGVycnVwdChhZGV2LCBmYWxz
ZSk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
