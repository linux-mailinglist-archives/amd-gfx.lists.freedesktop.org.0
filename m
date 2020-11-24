Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E02C3AD6
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Nov 2020 09:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EDF6E90F;
	Wed, 25 Nov 2020 08:22:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3096E542
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so23563357wrx.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RYDh/UZaCdDEqxdxKnQmY0HFvSGalhT0MJKMTrRDfOI=;
 b=gHCQnDfrUQvyfePswNPku5Eno1OnQAgON8KyhF9osw/Kwp173O3dgv/Kh67d4pTKrJ
 tCF7v2k3uU6xUaw4xaoH3qkjJ1JHPNbhKJa5y1uOHgPU03pLRkk7T8IkL7kEVBd8EKY+
 o8HYEiTVYbnsRS7StIw0J/yMf5Zjf5vI+my7ats5suII18PtNVVaxREQTOX5sRbl5WyN
 byRVkMU9r/XluNhwdM82UW5F5+SV1sRhg1OTg3eyiUqGclX7y92PRu1SPlCI5s+A8Sa1
 55DO8NqjaBV6BOfDEXFioSMBr7A88v3JEFE1g8/K1IJFCH0FjNWBvcKPhrnmQZTtWwHq
 o+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RYDh/UZaCdDEqxdxKnQmY0HFvSGalhT0MJKMTrRDfOI=;
 b=o+0EzcBJ4tTKqiqFNM1LNotykZU+REkGKZDHMSELM8XN5SVkIJnpBgw/7ZeHfw/3VE
 iplXSulkiW91FBvqygIeNRfMPSSV9ZTId60nXLz0Dft9gFrAVQYUx9Ux3MhtKpCh68R/
 1NkshC8vcEPU8P3y5Y1tJZkjl5ArdQiyGIL8IvMs/7m2gVGWml/eE5T4SGmdVD1WlGf0
 tXwhOjRtmNqsgq0Y3GXSHLMofSTgDYu7n4+x6nbH5qyYiTqHZFKOXhulQIonsxNmIkNt
 /toUlvCPvFtNjzJZsGKUK8hHamkEmSfJlpp58TbR/nIdj2LNEhjW/3C85FCB1oOjlT1W
 4EyQ==
X-Gm-Message-State: AOAM530a2UVM/88A39diY77fd6ybof91Qo+rqGnT3Wm+1RWbRLuUIYtY
 uQDsTvhxtEnWEpbME+LpRb/kmw==
X-Google-Smtp-Source: ABdhPJzKynsmfdYK9VJRUnYMzqpBWIlV3r+EUp0UVnf/NsgxF3loXx95BD6FsHMtaaha/M9uHvBSqA==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr67154wrw.145.1606247055196;
 Tue, 24 Nov 2020 11:44:15 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/40] drm/amd/amdgpu/dce_v11_0: Supply description for
 function param 'async'
Date: Tue, 24 Nov 2020 19:37:57 +0000
Message-Id: <20201124193824.1118741-14-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3YxMV8wLmM6MjU1OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdhc3luYycgbm90IGRlc2NyaWJlZCBpbiAnZGNlX3YxMV8wX3Bh
Z2VfZmxpcCcKCkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNj
OiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+CkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92MTFfMC5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9kY2VfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92MTFfMC5jCmlu
ZGV4IGM2MmM1NmE2OWZkYTYuLjFiNmZmMDQ3MDAxMTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2RjZV92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RjZV92MTFfMC5jCkBAIC0yNDYsNiArMjQ2LDcgQEAgc3RhdGljIHZvaWQgZGNlX3YxMV8w
X3BhZ2VmbGlwX2ludGVycnVwdF9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogICog
QGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICogQGNydGNfaWQ6IGNydGMgdG8gY2xlYW51
cCBwYWdlZmxpcCBvbgogICogQGNydGNfYmFzZTogbmV3IGFkZHJlc3Mgb2YgdGhlIGNydGMgKEdQ
VSBNQyBhZGRyZXNzKQorICogQGFzeW5jOiBhc3luY2hyb25vdXMgZmxpcAogICoKICAqIFRyaWdn
ZXJzIHRoZSBhY3R1YWwgcGFnZWZsaXAgYnkgdXBkYXRpbmcgdGhlIHByaW1hcnkKICAqIHN1cmZh
Y2UgYmFzZSBhZGRyZXNzLgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
