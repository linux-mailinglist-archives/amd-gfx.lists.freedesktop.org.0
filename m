Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103B02AF86F
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Nov 2020 19:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFD46E0DB;
	Wed, 11 Nov 2020 18:45:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013D56E0C6
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Nov 2020 18:36:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r17so3535153wrw.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Nov 2020 10:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=noNY+SglbM8aEsCCdAF8dY+Y+lbfpcrhUN1CWHwGoPw=;
 b=otqPagV4SXXd1S4bOoNcEs67FQlaLvEbku6qmOoK8aE1zjdLYKVfZt2v7JkFaWtoGt
 doYNKSwpGKD6zLqXc1RSr97zszWJFrqrtVFwB+HAQ7qkJvhfIaU9qI9XjbLIi2Op/aL9
 TrIP0kutM2A86a1F2u6S3zDK33RL70wJY9BMgSuSjYlf0dBV8/pwJA18QUXQJvUpAGEb
 1ZKO9CR685LbV9yHiwaEocPif42d5g7zo9lzvVZs5Ni7nLvTPgjAT8U2kUchMUnD98Ka
 qf4zusM43Z6CxOQbTVYWg15XQw4u+Kj1yRWp+rOBegM5YgeBcvj02UUQMWNw2YA2bwLV
 P10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=noNY+SglbM8aEsCCdAF8dY+Y+lbfpcrhUN1CWHwGoPw=;
 b=Kqd30XGu89t7MvWl0XrrxcGDNpo7tn05GszVVuW1FhGOgJedjlscwYlilLofyb0Gj8
 IFStPl7lEJc9FOYd2/jFWCIDxPxf0cF7Sc92PYbVj2tKfCRqD/s7qKZ5P3yZqndBcVhD
 fRFOak4RCAPqV3vM7JVThxotQC8sOOHnpctVhYhnFba+beYbbaKtPNLA40EKripFynl4
 66s+HPfwmgnDdBHRp8gad3P/r/xhZf1Qxu/is4nP8uum9fQu1DcTxNUOV7J31qbTAIgD
 rPN3NSgBfo7fSdaH7GY1cbgdCAAPuHDeUh/FI5bpV7lram/Nnlhz1J/mkwinmFWvNN44
 WmZA==
X-Gm-Message-State: AOAM5325yAyo0GGqmVl/CrMWorpgz+kLILMyCjxQQkg1hiYY0yqKF7H1
 k7cn9Te/1Axscuj3KPgJLY2OXQ==
X-Google-Smtp-Source: ABdhPJyk4VxvkBNZmksenUKCaiv2Wpy5d4pXVvx1cgMaTTxc+0LopcRB94p7eD8HmBeh7yJOV7L25w==
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr32946201wrx.164.1605119767603; 
 Wed, 11 Nov 2020 10:36:07 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 10:36:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/19] drm/radeon/cik_sdma: Move
 'amdgpu_cik_gpu_check_soft_reset()'s prototype to shared header
Date: Wed, 11 Nov 2020 18:35:39 +0000
Message-Id: <20201111183545.1756994-14-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9jaWsuYzo0ODQ1OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYY2lrX2dwdV9jaGVja19zb2Z0X3Jlc2V04oCZIFstV21pc3NpbmctcHJvdG90
eXBlc10KIDQ4NDUgfCB1MzIgY2lrX2dwdV9jaGVja19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9jaWsuaCAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Np
a19zZG1hLmMgfCAzICstLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmgKaW5kZXggMjk3YjNjMWZmODA0Zi4uNjYzMGI5ZGE5
ZTdhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5oCkBAIC0yOSw1ICsyOSw2IEBAIHZvaWQgY2lrX2VudGVy
X3JsY19zYWZlX21vZGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogdm9pZCBjaWtfZXhp
dF9ybGNfc2FmZV9tb2RlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIGludCBjaV9tY19s
b2FkX21pY3JvY29kZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB2b2lkIGNpa191cGRh
dGVfY2coc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBibG9jaywgYm9vbCBlbmFibGUp
OwordTMyIGNpa19ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dik7CiAKICNlbmRpZiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBfX0NJS19IX18gKi8KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEuYyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vY2lrX3NkbWEuYwppbmRleCAzYzcwOWViZThkMWFiLi45MTliMTQ4NDVjM2M3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npa19zZG1hLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jCkBAIC0yNywxNCArMjcsMTMgQEAKICNpbmNs
dWRlICJyYWRlb25fdWNvZGUuaCIKICNpbmNsdWRlICJyYWRlb25fYXNpYy5oIgogI2luY2x1ZGUg
InJhZGVvbl90cmFjZS5oIgorI2luY2x1ZGUgImNpay5oIgogI2luY2x1ZGUgImNpa2QuaCIKIAog
Lyogc2RtYSAqLwogI2RlZmluZSBDSUtfU0RNQV9VQ09ERV9TSVpFIDEwNTAKICNkZWZpbmUgQ0lL
X1NETUFfVUNPREVfVkVSU0lPTiA2NAogCi11MzIgY2lrX2dwdV9jaGVja19zb2Z0X3Jlc2V0KHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKLQogLyoKICAqIHNETUEgLSBTeXN0ZW0gRE1BCiAg
KiBTdGFydGluZyB3aXRoIENJSywgdGhlIEdQVSBoYXMgbmV3IGFzeW5jaHJvbm91cwotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
