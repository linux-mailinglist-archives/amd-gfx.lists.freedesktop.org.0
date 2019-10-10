Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF3AD2DAE
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 17:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BD96EB73;
	Thu, 10 Oct 2019 15:26:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12D46EB71
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 15:26:38 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j31so9282255qta.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 08:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P3bmk/9YW5McZmdEnZ6Z6dmB3XP5X2t2adgJL9KHmR8=;
 b=LRLDc78BUXyukZ6mvBML+fLXaPJ9ItDU5QOGBVOz+HiAWJAronnhAFMiW+A6A5QLbG
 mUSFFBeAHsHrvQNmPONVheyebT6AbDrxQGxFkELaQ6umMRENyl/7eBmMlUcalLvRkoW9
 cMu3Odz+A2FCJFLnL9H79nufmpphaXVj5EziN6iKbDCT+Ab61BVhCTeTA2mMDMNes64j
 mhRBIwTZ7zklc3GzQp6ZjogAU9ib5iQJ/zumCFPWitCegUqEem4v7U2Zt00mLA2MsER8
 fbnpSL3f8tRTNpQ6ZtW16i/bnaPV4awCIDfvvpjbQ1LTfqv7sXclkNm6jKBwR/UcMegW
 6TOA==
X-Gm-Message-State: APjAAAUlIYKnIX20EYwyDAFvOu2tW9cp/CKZHy2hm8PFbyjX1369gXWb
 n1fU7hwU3ZOVa/QwBCfWTfSfpjvZ
X-Google-Smtp-Source: APXvYqye5iWNPQkAC6M4hSTS+pNeHcFywT3peacDoC9cljUn+XwsRm29tjbrTShZCsOntlczy7q6xA==
X-Received: by 2002:ac8:67c1:: with SMTP id r1mr8654835qtp.83.1570721197463;
 Thu, 10 Oct 2019 08:26:37 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id w45sm3389610qtb.47.2019.10.10.08.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:26:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/amdgpu: remove in_baco_reset hack
Date: Thu, 10 Oct 2019 10:26:18 -0500
Message-Id: <20191010152619.31011-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010152619.31011-1-alexander.deucher@amd.com>
References: <20191010152619.31011-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3bmk/9YW5McZmdEnZ6Z6dmB3XP5X2t2adgJL9KHmR8=;
 b=s95an3hC6HqsI5Tuo+6S9F9KYUU8G6Topy79vKGUuRAVz7zvh3Q/Z0kOtLtWh7ug9F
 yPV0HerHDW/5If3WA2VAiPaklo0aU1KOZIHO0xj/NkJw9KV1hwBSbQLTFXJ0V6wW1jJf
 8dW9xLKg3BJX9wKERWfChpWDwPU7LHJzkdIp8uinD1sjGDWyDByqxFui5WXvnT0kv1qj
 RRK7UGxqKYnpkpRjcip0gKAKAcEdnk19VvMddaS0zNWrconIExTk/KSRJHAd6/bRyeGm
 cpIUr1ABHPRx7Y6UK/vSqL5z3Re7Gwtb2qcuYhT0zCX6L9jMJokJzDlrU2CC48OncyD/
 uxwg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQgd2FzIGEgdmVnYTIwIHNwZWNpZmljIGhhY2suICBDaGVjayBpZiB3ZSBhcmUgaW4gcmVzZXQK
YW5kIHdoYXQgcmVzZXQgbWV0aG9kIHdlIGFyZSB1c2luZy4KClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAgICAgICAgICB8IDIgLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMgICAgICAgICAgICAgICAgIHwgMiAtLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgfCA0ICsrLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmgKaW5kZXggYzgyNTc5YzkzMjY1Li40Mzg3NzVkNTRhNmEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC05NTksOCArOTU5LDYgQEAgc3RydWN0IGFtZGdw
dV9kZXZpY2UgewogCWludCBhc2ljX3Jlc2V0X3JlczsKIAlzdHJ1Y3Qgd29ya19zdHJ1Y3QJCXhn
bWlfcmVzZXRfd29yazsKIAotCWJvb2wgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5fYmFj
b19yZXNldDsKLQogCWxvbmcJCQkJZ2Z4X3RpbWVvdXQ7CiAJbG9uZwkJCQlzZG1hX3RpbWVvdXQ7
CiAJbG9uZwkJCQl2aWRlb190aW1lb3V0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5k
ZXggZmM2Y2ZiY2VkMTcwLi5kMTc1NjhkZDllODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYwpAQCAtNTA3LDggKzUwNyw2IEBAIHN0YXRpYyBpbnQgc29jMTVfYXNpY19iYWNvX3Jlc2V0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJZGV2X2luZm8oYWRldi0+ZGV2LCAiR1BV
IEJBQ08gcmVzZXRcbiIpOwogCi0JYWRldi0+aW5fYmFjb19yZXNldCA9IDE7Ci0KIAlyZXR1cm4g
MDsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
dmVnYTIwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdh
MjBfaHdtZ3IuYwppbmRleCBmNTkxNTMwOGU2NDMuLjg5MmY5ZjUzODliOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMKQEAgLTQ5
MCw4ICs0OTAsOCBAQCBzdGF0aWMgaW50IHZlZ2EyMF9zZXR1cF9hc2ljX3Rhc2soc3RydWN0IHBw
X2h3bWdyICpod21ncikKIAkJCSJGYWlsZWQgdG8gaW5pdCBzY2xrIHRocmVzaG9sZCEiLAogCQkJ
cmV0dXJuIHJldCk7CiAKLQlpZiAoYWRldi0+aW5fYmFjb19yZXNldCkgewotCQlhZGV2LT5pbl9i
YWNvX3Jlc2V0ID0gMDsKKwlpZiAoYWRldi0+aW5fZ3B1X3Jlc2V0ICYmCisJICAgIChhbWRncHVf
YXNpY19yZXNldF9tZXRob2QoYWRldikgPT0gQU1EX1JFU0VUX01FVEhPRF9CQUNPKSkgewogCiAJ
CXJldCA9IHZlZ2EyMF9iYWNvX2FwcGx5X3ZkY2lfZmx1c2hfd29ya2Fyb3VuZChod21ncik7CiAJ
CWlmIChyZXQpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
