Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819048DEC
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47028893EF;
	Mon, 17 Jun 2019 19:17:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31209893A8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:50 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m14so6913581qka.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qsSyCVfIfXFggQiMxWG6lq7khT8NzZnY9GH7IArzGyA=;
 b=UiDtgwg9Ej6Eix1q+2K13L2LWWXFgK3j4H7Vc++GNlARFrL49D6IxjFLZtUZwajhi0
 Y2RpmZ43sEJk9dYCLcQLSgixuUNDverU3SxNgxauPQR5QlW8xEeQDX+vCcuCz0ZktDT+
 D7NzrzRkUtWasiRiS+BjBGYVJDSltIgetVihJQGItXP1DJRelbd868PMLGWnD/Cq5zDY
 /ya5ShcOISbOApit2CnFdrCWkqBYmL+hWqOIen3s8weShdZFB+YP9wIiZLGBN1fje1Gv
 cCRD77v0VuuCallDnt1oTfkL5VOQnth11xXd2Hm7ro3j72rmJj4p+mOTFCWIRdqXIcAy
 bT5Q==
X-Gm-Message-State: APjAAAXqlKVB1UO2JzEG1yGnSK0BOUQhD8niskfkP0bkeqiaIVmCOdmM
 jNaCS0t+mCjejV4yU8ZwLCo3ZnskY+I=
X-Google-Smtp-Source: APXvYqxl8v/4MVOjm4cWazgfx41OPiGj9+VgP3GiUYuPY2AICGleiMtBxLwLxcTt/BQCRxVp85m0VA==
X-Received: by 2002:a37:9207:: with SMTP id u7mr92602012qkd.357.1560799068422; 
 Mon, 17 Jun 2019 12:17:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 046/459] drm/amdgpu: enable async gfx ring by default
Date: Mon, 17 Jun 2019 14:10:07 -0500
Message-Id: <20190617191700.17899-35-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsSyCVfIfXFggQiMxWG6lq7khT8NzZnY9GH7IArzGyA=;
 b=TWP9IE4TT5qW6c/PseZK3cNhL0Pnb1PJrANrCf647VkqEuHXBU3LyPsoTNm870RmlH
 WxH+t/JVzmPMscbVKjzJOALRdc/YJGNNcXhTDZrYVkIS9Y0tBYtK9bt5Z8crhaD07Wnm
 OGbzP3+VhY7UDW1clSOhFucrX1BBnwnqY024uPJNa0ZKO3l2i6uF+2esz8GK+cM2AJ5C
 00IycyPPG5LntsIhwi+zSYmMDO7I3XRwJj74IVpburbwWTaGinHknws+zvvUt5Svfpnq
 I7zYrAXOg7j4UwvnOSecChjlyPnCQT1M0Mb3GtsYjWQpqoxxXHyHqV/xFWW6hJg3XDDu
 p1rw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClZEREdGWCByZXF1aXJlcyBnZngg
cXVldWUgdG8gYmUgaW5zdGFsbGVkIHZpYSBNQVBfUVVFVUVTIHBhY2tldC4KSGVuY2UsIGVuYWJs
ZSBhc3luYyBnZnggcmluZyBieSBkZWZhdWx0LgoKU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxK
YWNrLlhpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKaW5kZXggMWJmZWE3ZDU3MmUy
Li45ZDE3MmIzN2IxZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMK
QEAgLTEzNiw3ICsxMzYsNyBAQCBpbnQgYW1kZ3B1X2VtdV9tb2RlID0gMDsKIHVpbnQgYW1kZ3B1
X3NtdV9tZW1vcnlfcG9vbF9zaXplID0gMDsKIC8qIEZCQyAoYml0IDApIGRpc2FibGVkIGJ5IGRl
ZmF1bHQqLwogdWludCBhbWRncHVfZGNfZmVhdHVyZV9tYXNrID0gMDsKLWludCBhbWRncHVfYXN5
bmNfZ2Z4X3JpbmcgPSAwOworaW50IGFtZGdwdV9hc3luY19nZnhfcmluZyA9IDE7CiAKIHN0cnVj
dCBhbWRncHVfbWdwdV9pbmZvIG1ncHVfaW5mbyA9IHsKIAkubXV0ZXggPSBfX01VVEVYX0lOSVRJ
QUxJWkVSKG1ncHVfaW5mby5tdXRleCksCkBAIC01NzEsNyArNTcxLDcgQEAgbW9kdWxlX3BhcmFt
X25hbWVkKHNtdV9tZW1vcnlfcG9vbF9zaXplLCBhbWRncHVfc211X21lbW9yeV9wb29sX3NpemUs
IHVpbnQsIDA0NDQKICAqIEl0IGlzIHVzZWQgdG8gZW5hYmxlIGdmeCByaW5ncyB0aGF0IGNvdWxk
IGJlIGNvbmZpZ3VyZWQgd2l0aCBkaWZmZXJlbnQgcHJpb3JpdGl0ZXMgb3IgZXF1YWwgcHJpb3Jp
dGllcwogICovCiBNT0RVTEVfUEFSTV9ERVNDKGFzeW5jX2dmeF9yaW5nLAotCSJBc3luY2hyb25v
dXMgR0ZYIHJpbmdzIHRoYXQgY291bGQgYmUgY29uZmlndXJlZCB3aXRoIGVpdGhlciBkaWZmZXJl
bnQgcHJpb3JpdGllcyAoSFAzRCByaW5nIGFuZCBMUDNEIHJpbmcpLCBvciBlcXVhbCBwcmlvcml0
aWVzICgwID0gZGlzYWJsZWQgKGRlZmF1bHQpLCAxID0gZW5hYmxlZCkiKTsKKwkiQXN5bmNocm9u
b3VzIEdGWCByaW5ncyB0aGF0IGNvdWxkIGJlIGNvbmZpZ3VyZWQgd2l0aCBlaXRoZXIgZGlmZmVy
ZW50IHByaW9yaXRpZXMgKEhQM0QgcmluZyBhbmQgTFAzRCByaW5nKSwgb3IgZXF1YWwgcHJpb3Jp
dGllcyAoMCA9IGRpc2FibGVkLCAxID0gZW5hYmxlZCAoZGVmYXVsdCkpIik7CiBtb2R1bGVfcGFy
YW1fbmFtZWQoYXN5bmNfZ2Z4X3JpbmcsIGFtZGdwdV9hc3luY19nZnhfcmluZywgaW50LCAwNDQ0
KTsKIAogI2lmZGVmIENPTkZJR19IU0FfQU1ECi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
