Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0E82AF863
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Nov 2020 19:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30856E0BF;
	Wed, 11 Nov 2020 18:45:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D476E0BC
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Nov 2020 18:36:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d142so3158646wmd.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Nov 2020 10:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qh+SB3F0wBSwPJdxJvDqep6O/eLLWzPpPvay6C9QqmM=;
 b=Z3euSqifNwhu6ebXW5Gn4HJE9Yrd49M2yyiJejyPG3OBZSHtj/wbH/SAXvd9F/iwBQ
 8FDI9vSOlm7tmv2uIeobzdDRXa9KBXZnAGQQ8LCyZsMtyagmQRTmyRw6G1pyBIJfj4sT
 LZ5qoVGnqhXDxbs0M9QvOx6n4nolTJmxEXKS9nFIJ3MbERYVarJ1SrfEnjbYy08ct8v+
 hNdwbpEouUdQK5qYj5eOLFjoupuVUuETdzgN8bKKbT0Pxw1LCqh7g3+BTFeoov1iiTWO
 IsdNw7GqJvo3N1osqhhyB3/R6T1BA8EdglHEtkCt1UNLq15nd6wAASH4X8ieuXoVFVZ8
 rwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qh+SB3F0wBSwPJdxJvDqep6O/eLLWzPpPvay6C9QqmM=;
 b=Mu5BYQLlna83e5kxI2zmwBjQac31PtL3NtwF3Txuoh5iBjnFKT3lGHGFmWvMM1zdPP
 PJYVlsH6Rcm9+OGxr18A95UMCAdsvo7mhyJV6aoY5lKctSe5le/YeFegUynaJD6lqcEO
 E181Wz7HXIh/RgzAobGXovMmBM2n0neMML5LxV4Uw/5b3TDXOY1rtzXuLoaLPjsRNsZP
 i9LwcsIAfKW+LyY8ojWXmxAo3pw48Kvq2FOHJBXf6Hub5MLotPh2P/AGIWMebKRfKYPi
 MTGgqSAJO7QePqJiIwvY71UXuD/4iK0o6m7Nuw8bn2cC7SJV/uPmRjj+9NtWo12+omqO
 LXAA==
X-Gm-Message-State: AOAM532/qiUv4xDyaCcaUai7CnBhUem6yIwyxIORVwolnRQkyczeDdvu
 6ns+NZm1gZO3HfzVURlPrQ96ZQ==
X-Google-Smtp-Source: ABdhPJyfo7uTY2z4gmHdm1uuxT1G2gAONrvqZZUGMNaI7L96tmelOOFAX8Hqqy4Wnne45p+mgl5f0A==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr5463021wmi.2.1605119762301;
 Wed, 11 Nov 2020 10:36:02 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:36:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/19] drm/radeon/cik: Move 'si_*()'s prototypes to shared
 header
Date: Wed, 11 Nov 2020 18:35:35 +0000
Message-Id: <20201111183545.1756994-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 18:45:15 +0000
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
cy9ncHUvZHJtL3JhZGVvbi9zaS5jOjQxODY6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhzaV92cmFtX2d0dF9sb2NhdGlvbuKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
CiA0MTg2IHwgdm9pZCBzaV92cmFtX2d0dF9sb2NhdGlvbihzdHJ1Y3QgcmFkZW9uX2RldmljZSAq
cmRldiwKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn4KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2ku
Yzo1MTg2OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYc2lfaW5pdF91
dmRfaW50ZXJuYWxfY2figJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogNTE4NiB8IHZvaWQgc2lf
aW5pdF91dmRfaW50ZXJuYWxfY2coc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmM6NTgwMTo2OiB3
YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHNpX3JsY19yZXNldOKAmSBbLVdt
aXNzaW5nLXByb3RvdHlwZXNdCiA1ODAxIHwgdm9pZCBzaV9ybGNfcmVzZXQoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+fn5+fn5+fgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
Y2lrLmMgfCA0ICstLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuaCAgfCA0ICsrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npay5jCmluZGV4IGFmMDhkNmYxYmU1M2UuLjAzMzBlZTg2YTM3MmIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9j
aWsuYwpAQCAtNDAsNiArNDAsNyBAQAogI2luY2x1ZGUgInJhZGVvbl9hc2ljLmgiCiAjaW5jbHVk
ZSAicmFkZW9uX2F1ZGlvLmgiCiAjaW5jbHVkZSAicmFkZW9uX3Vjb2RlLmgiCisjaW5jbHVkZSAi
c2kuaCIKIAogI2RlZmluZSBTSF9NRU1fQ09ORklHX0dGWF9ERUZBVUxUIFwKIAlBTElHTk1FTlRf
TU9ERShTSF9NRU1fQUxJR05NRU5UX01PREVfVU5BTElHTkVEKQpAQCAtMTI3LDkgKzEyOCw2IEBA
IE1PRFVMRV9GSVJNV0FSRSgicmFkZW9uL211bGxpbnNfbWVjLmJpbiIpOwogTU9EVUxFX0ZJUk1X
QVJFKCJyYWRlb24vbXVsbGluc19ybGMuYmluIik7CiBNT0RVTEVfRklSTVdBUkUoInJhZGVvbi9t
dWxsaW5zX3NkbWEuYmluIik7CiAKLWV4dGVybiB2b2lkIHNpX3ZyYW1fZ3R0X2xvY2F0aW9uKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX21jICptYyk7Ci1leHRlcm4g
dm9pZCBzaV9ybGNfcmVzZXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwotZXh0ZXJuIHZv
aWQgc2lfaW5pdF91dmRfaW50ZXJuYWxfY2coc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwog
c3RhdGljIHUzMiBjaWtfZ2V0X2N1X2FjdGl2ZV9iaXRtYXAoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYsIHUzMiBzZSwgdTMyIHNoKTsKIGV4dGVybiBpbnQgY2lrX3NkbWFfcmVzdW1lKHN0cnVj
dCByYWRlb25fZGV2aWNlICpyZGV2KTsKIGV4dGVybiB2b2lkIGNpa19zZG1hX2VuYWJsZShzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldiwgYm9vbCBlbmFibGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9zaS5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5oCmluZGV4
IGExNzUxYWU1NjBmMDIuLmY0ODNhNjRkMTcwNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vc2kuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmgKQEAgLTI1LDgg
KzI1LDEyIEBACiAjZGVmaW5lIF9fU0lfSF9fCiAKIHN0cnVjdCByYWRlb25fZGV2aWNlOworc3Ry
dWN0IHJhZGVvbl9tYzsKIAogaW50IHNpX21jX2xvYWRfbWljcm9jb2RlKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KTsKIHUzMiBzaV9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldik7Cit2b2lkIHNpX3ZyYW1fZ3R0X2xvY2F0aW9uKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX21jICptYyk7Cit2b2lkIHNpX3JsY19yZXNldChz
dHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7Cit2b2lkIHNpX2luaXRfdXZkX2ludGVybmFsX2Nn
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIAogI2VuZGlmICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIF9fU0lfSF9fICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeAo=
