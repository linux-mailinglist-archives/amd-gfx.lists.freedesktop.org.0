Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D02F4669
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Jan 2021 09:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AE26E14B;
	Wed, 13 Jan 2021 08:24:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9921689F33
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id 190so696392wmz.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YaJ+xpBDvvYC3lW5kV2UczyJUDW/j4U+lHIq9z+JvDw=;
 b=WsQms4zJiYtT5LVKrCDvJqTzyauR1L7ZrV/ErDeTxtpEOnQQJzux+BCYQydoZtAyo0
 EPxFeb095dvlkwDkYDE+e60fyWPr+ZnRC2hcA18fuSphilINabII+6TeyMwbwOaOiKfw
 OC/UxR/UuA7wsll84KPXCHnkzQP08OFr9F63whp9Rp5wAJsdytx4qsc8Ni8DmlLarXxR
 D5uVCKUaa0MHoo3TVb+28cdBVCnJcJi4RNixwFuvmuKR2hu8JuDCAp8E2MNZJfjLlv5t
 I34lrVKBpNGDaX9HZFr9LoLI+yLNoiMmSbPAIWwe6PAQRCnK7OFFkIvT37B5tFz8CsXl
 axIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YaJ+xpBDvvYC3lW5kV2UczyJUDW/j4U+lHIq9z+JvDw=;
 b=CAvwOW5yu0g7vY4hTgm6GvEblXXnLwl5kR148vyqZalcDvTIhV/49AzxXxtzot16c2
 bru3LWe11IvnsM5ENolv7F8aWSIHhxNcZlzqMd4TWVvvr/eFEKWp2iogxqgYH44eNQOL
 YJCedOaFi5BL/j/upK/BG3rwUO7jOQusAH8cASmxGp5W8+WmXE9c09xwsG6dQ7v3Xf24
 6Fu9M2g73QLGyAWZVi47cufO7m6EOEHEOFxQK7Knkgx/s+sNAyO0nGUksHVMEXGz85+k
 VsmWRRiiXJILTPfbwh9Qw/mQWjb2Jqg8Fu7K5R9wMCHfLrNiYMie0Up+yOa7qk7aqZNU
 gQ3g==
X-Gm-Message-State: AOAM530Ph7uuUmadSEj16kA/T1u3trVn5S92uHWdBOBdjh60/5rPqa5U
 Ab/ZuV4bptsRhKjvxeZxJrIouQ==
X-Google-Smtp-Source: ABdhPJzYql5/UWMI/LumOt2JvYksf/Z9CIRastCwWreEyNI3i2UayobU2A3/YhQZL+8jW8Jyw8t5mw==
X-Received: by 2002:a7b:cc87:: with SMTP id p7mr991968wma.112.1610525281314;
 Wed, 13 Jan 2021 00:08:01 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/30] drm/amd/display/modules/power/power_helpers: Staticify
 local functions
Date: Wed, 13 Jan 2021 08:07:26 +0000
Message-Id: <20210113080752.1003793-5-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9tb2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBl
cnMuYzoyODE6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhmaWxsX2ly
YW1fdl8y4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvbW9kdWxlcy9wb3dlci9wb3dlcl9oZWxwZXJzLmM6NDU1OjY6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZmlsbF9pcmFtX3ZfMl8y4oCZIFstV21p
c3NpbmctcHJvdG90eXBlc10KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkv
bW9kdWxlcy9wb3dlci9wb3dlcl9oZWxwZXJzLmM6NjAxOjY6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYZmlsbF9pcmFtX3ZfMl8z4oCZIFstV21pc3NpbmctcHJvdG90eXBl
c10KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBSb2RyaWdvIFNpcXVlaXJhIDxSb2RyaWdvLlNpcXVlaXJh
QGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL3Bv
d2VyL3Bvd2VyX2hlbHBlcnMuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBlcnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9tb2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBlcnMuYwppbmRleCA0ZmQ4YmNlOTVk
ODQzLi4zZDRjNjY5MzNmNTE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9wb3dlci9wb3dlcl9oZWxwZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L21vZHVsZXMvcG93ZXIvcG93ZXJfaGVscGVycy5jCkBAIC0yNzgsNyArMjc4LDcg
QEAgc3RhdGljIHZvaWQgZmlsbF9iYWNrbGlnaHRfdHJhbnNmb3JtX3RhYmxlX3ZfMl8yKHN0cnVj
dCBkbWN1X2lyYW1fcGFyYW1ldGVycyBwYXIKIAl9CiB9CiAKLXZvaWQgZmlsbF9pcmFtX3ZfMihz
dHJ1Y3QgaXJhbV90YWJsZV92XzIgKnJhbV90YWJsZSwgc3RydWN0IGRtY3VfaXJhbV9wYXJhbWV0
ZXJzIHBhcmFtcykKK3N0YXRpYyB2b2lkIGZpbGxfaXJhbV92XzIoc3RydWN0IGlyYW1fdGFibGVf
dl8yICpyYW1fdGFibGUsIHN0cnVjdCBkbWN1X2lyYW1fcGFyYW1ldGVycyBwYXJhbXMpCiB7CiAJ
dW5zaWduZWQgaW50IHNldCA9IHBhcmFtcy5zZXQ7CiAKQEAgLTQ1Miw3ICs0NTIsNyBAQCB2b2lk
IGZpbGxfaXJhbV92XzIoc3RydWN0IGlyYW1fdGFibGVfdl8yICpyYW1fdGFibGUsIHN0cnVjdCBk
bWN1X2lyYW1fcGFyYW1ldGVycwogCQkJcGFyYW1zLCByYW1fdGFibGUpOwogfQogCi12b2lkIGZp
bGxfaXJhbV92XzJfMihzdHJ1Y3QgaXJhbV90YWJsZV92XzJfMiAqcmFtX3RhYmxlLCBzdHJ1Y3Qg
ZG1jdV9pcmFtX3BhcmFtZXRlcnMgcGFyYW1zKQorc3RhdGljIHZvaWQgZmlsbF9pcmFtX3ZfMl8y
KHN0cnVjdCBpcmFtX3RhYmxlX3ZfMl8yICpyYW1fdGFibGUsIHN0cnVjdCBkbWN1X2lyYW1fcGFy
YW1ldGVycyBwYXJhbXMpCiB7CiAJdW5zaWduZWQgaW50IHNldCA9IHBhcmFtcy5zZXQ7CiAKQEAg
LTU5OCw3ICs1OTgsNyBAQCB2b2lkIGZpbGxfaXJhbV92XzJfMihzdHJ1Y3QgaXJhbV90YWJsZV92
XzJfMiAqcmFtX3RhYmxlLCBzdHJ1Y3QgZG1jdV9pcmFtX3BhcmFtZQogCQkJcGFyYW1zLCByYW1f
dGFibGUsIHRydWUpOwogfQogCi12b2lkIGZpbGxfaXJhbV92XzJfMyhzdHJ1Y3QgaXJhbV90YWJs
ZV92XzJfMiAqcmFtX3RhYmxlLCBzdHJ1Y3QgZG1jdV9pcmFtX3BhcmFtZXRlcnMgcGFyYW1zLCBi
b29sIGJpZ19lbmRpYW4pCitzdGF0aWMgdm9pZCBmaWxsX2lyYW1fdl8yXzMoc3RydWN0IGlyYW1f
dGFibGVfdl8yXzIgKnJhbV90YWJsZSwgc3RydWN0IGRtY3VfaXJhbV9wYXJhbWV0ZXJzIHBhcmFt
cywgYm9vbCBiaWdfZW5kaWFuKQogewogCXVuc2lnbmVkIGludCBpLCBqOwogCXVuc2lnbmVkIGlu
dCBzZXQgPSBwYXJhbXMuc2V0OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngK
