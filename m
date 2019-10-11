Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED801D3741
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136BB6EB97;
	Fri, 11 Oct 2019 01:45:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC6D89FDD
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:47 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id 3so11701413qta.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XzJkP7ss/oeNyPHXw75gb2m9uLNgehjMOquPekOVhzY=;
 b=F7BIHwHyvDhYdvF9PSZ5dBpsFHhP580zLaBqiv1CFJKA0T9a3kZrUEzabrza0GaBOR
 lH0hCpIU5vTY9EOKlahIAV6NwERgf7vAnmbOR+pZyzUodYVYQoDRytdOyHY9jNNa3LDA
 2/ZOBwm+jQdItQBoTOFg2yNtZXZ2/kTIPh+nw1Y7BXUpZjqrsRo8r9c9/ojfBQEe5G6m
 Z/iSIHROMttow9h8k7VAAyF0gpod6vICWi/A5TduFGWeOYBEor1JP42JYxotZVFBlbHF
 BfdJOLcfpAIEtDMoSVS9LLaqqhN79+x8CVvMTYrUNUYxOEeHvkaQaVy5LnoqgYnw0o4Q
 Otbw==
X-Gm-Message-State: APjAAAXMt09lFF4iv4fCqLAgTUF4TJOyTqh9BKZKHy4zsD99oZZeQTeK
 bJMWvMRvVIzjgN8u50ksOFKRw2w1
X-Google-Smtp-Source: APXvYqwLy/kirJqQ1LnJK085plZeAQF0AGcvEWBMNyCSnfXxbKrIFK20hyjxBWpbIddszMqGdQoXDA==
X-Received: by 2002:ac8:6783:: with SMTP id b3mr14447047qtp.25.1570758346580; 
 Thu, 10 Oct 2019 18:45:46 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:45 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 01/19] drm/amdgpu: add asic callback for BACO support
Date: Thu, 10 Oct 2019 20:45:18 -0500
Message-Id: <20191011014536.10869-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XzJkP7ss/oeNyPHXw75gb2m9uLNgehjMOquPekOVhzY=;
 b=CQwX6vkXQlsRSzkuOFvwvzsFGeQYLyWIer11+tt63fTsBm8nqgJEmDhYpUNqal7XsZ
 NwFmZoAoRMOwnVARGICnIujO5dl1XZ5wJKiHO0ZDTt8r3j4VdBW6CqDxIbY+e7pbF6ss
 c3nFloOllqrcivZc8CAqCe5GkhJQYg6mVaEyaKoiYyr4OasDRFnxlRmIN+KzG9WVwHEn
 PUUXoWxklhfUHk5PHxCf2nccUTqT+sxbFyo/qpFloEHcrlb15d4xMRQFdp92HEWNbvmT
 EAbFzSKB3fxp6gnaoMWP7sxcBXSa0l3dkDxh2Z5y+PfCJ7axlrT5g+tdrcsGjyGRncp8
 BIRw==
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

VXNlZCB0byBjaGVjayB3aGV0aGVyIHRoZSBkZXZpY2Ugc3VwcG9ydHMgQkFDTy4gIFRoaXMgd2ls
bApiZSB1c2VkIHRvIGVuYWJsZSBydW50aW1lIHBtIG9uIGRldmljZXMgd2hpY2ggc3VwcG9ydCBC
QUNPLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIHwgNCArKysrCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHUuaAppbmRleCA0Mzg3NzVkNTRhNmEuLjc4MzM4ZGI3ZTQ4ZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmgKQEAgLTU4Myw2ICs1ODMsOCBAQCBzdHJ1Y3QgYW1kZ3B1X2FzaWNfZnVu
Y3MgewogCWJvb2wgKCpuZWVkX3Jlc2V0X29uX2luaXQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KTsKIAkvKiBQQ0llIHJlcGxheSBjb3VudGVyICovCiAJdWludDY0X3QgKCpnZXRfcGNpZV9y
ZXBsYXlfY291bnQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKwkvKiBkZXZpY2Ugc3Vw
cG9ydHMgQkFDTyAqLworCWJvb2wgKCpzdXBwb3J0c19iYWNvKShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldik7CiB9OwogCiAvKgpAQCAtMTA5OSw2ICsxMTAxLDggQEAgaW50IGVtdV9zb2NfYXNp
Y19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKICNkZWZpbmUgYW1kZ3B1X2FzaWNf
Z2V0X3BjaWVfdXNhZ2UoYWRldiwgY250MCwgY250MSkgKChhZGV2KS0+YXNpY19mdW5jcy0+Z2V0
X3BjaWVfdXNhZ2UoKGFkZXYpLCAoY250MCksIChjbnQxKSkpCiAjZGVmaW5lIGFtZGdwdV9hc2lj
X25lZWRfcmVzZXRfb25faW5pdChhZGV2KSAoYWRldiktPmFzaWNfZnVuY3MtPm5lZWRfcmVzZXRf
b25faW5pdCgoYWRldikpCiAjZGVmaW5lIGFtZGdwdV9hc2ljX2dldF9wY2llX3JlcGxheV9jb3Vu
dChhZGV2KSAoKGFkZXYpLT5hc2ljX2Z1bmNzLT5nZXRfcGNpZV9yZXBsYXlfY291bnQoKGFkZXYp
KSkKKyNkZWZpbmUgYW1kZ3B1X2FzaWNfc3VwcG9ydHNfYmFjbyhhZGV2KSAoYWRldiktPmFzaWNf
ZnVuY3MtPnN1cHBvcnRzX2JhY28oKGFkZXYpKQorCiAjZGVmaW5lIGFtZGdwdV9pbmNfdnJhbV9s
b3N0KGFkZXYpIGF0b21pY19pbmMoJigoYWRldiktPnZyYW1fbG9zdF9jb3VudGVyKSk7CiAKIC8q
IENvbW1vbiBmdW5jdGlvbnMgKi8KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
