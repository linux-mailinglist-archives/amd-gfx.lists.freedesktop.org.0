Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D048E13
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4368961E;
	Mon, 17 Jun 2019 19:18:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB2A8961E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:26 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id a15so12168518qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QcdeOolvcvYR76ruMSFh2xxERKnNFWMRzMubtQzNkwc=;
 b=KhKqdzRhOz7LrizKZjpwgjJd6OpCG+OJ0PY6k+z1hZcq8RTS14clePB1mW5B+gzxP+
 PoKdwm1UAijH/EsrJPnRmz0LKehaZp6sgHr6XRHvLDZpuuCQv27yWamPVXQVogB9/MJ0
 YtI1Onz0QsynxXMiIwOIK4AwObuNgRaXdqc6P4PXwJrbBssUv/N2ryov/akJSLXQG9K9
 nu+o7G6f1CKgNOYZ1x12ADUEofiwQo7gMn1f17BtlVIevqguj7wdxlzRzjRQC0y5zx9j
 kSKEW8QXphMQs6zCCZrxEpwZ1151LUCIwVDjE6k3o2sLgpj+261MPfkttzDczUHO+n0q
 xXHw==
X-Gm-Message-State: APjAAAXnTYeVuJR6kfhlKwpwCfnOfmjeLJHnqmWgSxcg+EChXvaD1K5z
 HhukucCj3Hhj92pJIG6mDFxysmAhyC0=
X-Google-Smtp-Source: APXvYqxapQi2Ejz/Y/JFT2CwWLQP5WTU/NNTCjgzVd7uQNqfxDEy2R/Bqatb4EGaKV80Gvst2cdnPg==
X-Received: by 2002:a0c:fca6:: with SMTP id h6mr23053916qvq.41.1560799105504; 
 Mon, 17 Jun 2019 12:18:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 087/459] drm/amdgpu: Add helper function
 amdgpu_ring_set_preempt_cond_exec
Date: Mon, 17 Jun 2019 14:10:48 -0500
Message-Id: <20190617191700.17899-76-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcdeOolvcvYR76ruMSFh2xxERKnNFWMRzMubtQzNkwc=;
 b=a0bhOlfbkoaYLl0AD6Em2vPhH799kXLE1Fc9XxUbMGUZqjOnNTT0qoityy5eZpvRhX
 jObldm6pwZdWF9NDyz9DCQBmf/CSjKRxaIgpfKbFp2a709ITCFgKpecjj4P+dfQLf/rD
 urglWRMAdcD2nplVP8sy/+5P0SwGm//2Qx/22Uir5TaiwYCearciEV6C74dORdINx7VW
 HQV65qcra8pEahPbXsRDifvC2NgG6j13/M2dCjhPGJpVEz1J7J53U8UoDOg7nqjaG4jv
 ZoUOGZGnU/sb+2FebPS1lYxozpmPDNOkKEajSvTTl9qAUEX6QqWwri/pVBrtpjU7aslz
 gmrg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Rex Zhu <Rex.Zhu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmV4IFpodSA8UmV4LlpodUBhbWQuY29tPgoKY2FuIHByZWVtcHQgdGhlIHJpbmcgYnkg
c2V0dGluZyBjb25kX2V4ZWMgdG8gZmFsc2UKCkFja2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdr
aW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFJleCBaaHUgPFJleC5aaHVAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmggfCA2ICsrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yaW5nLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmluZy5oCmluZGV4IGNkZGRjZTkzOGJmNS4uNzY0YmY4NTFjMWRmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgKQEAgLTI2Niw2ICsyNjYsMTIgQEAgdm9pZCBhbWRn
cHVfcmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdF9oZWxwZXIoc3RydWN0IGFtZGdwdV9yaW5n
ICpyaW5nLAogYm9vbCBhbWRncHVfcmluZ19zb2Z0X3JlY292ZXJ5KHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywgdW5zaWduZWQgaW50IHZtaWQsCiAJCQkgICAgICAgc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2UpOwogCitzdGF0aWMgaW5saW5lIHZvaWQgYW1kZ3B1X3Jpbmdfc2V0X3ByZWVtcHRfY29u
ZF9leGVjKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKKwkJCQkJCQlib29sIGNvbmRfZXhlYykK
K3sKKwkqcmluZy0+Y29uZF9leGVfY3B1X2FkZHIgPSBjb25kX2V4ZWM7Cit9CisKIHN0YXRpYyBp
bmxpbmUgdm9pZCBhbWRncHVfcmluZ19jbGVhcl9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZykKIHsKIAlpbnQgaSA9IDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
