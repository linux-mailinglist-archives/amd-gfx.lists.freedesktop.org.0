Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF89F48DEA
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E150C893E7;
	Mon, 17 Jun 2019 19:17:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DAF893A8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:48 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a27so6921566qkk.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/NRWBFUojfEPtmRZ+J1wNrRk1Fk+Igd4hz9iwFbrMnI=;
 b=sM9O4yWlPIOyY7HFi2u3kfmiyQi7spCLUDIFHJ0pHEE1SGxKzohhSfkza36XtO/hj7
 4je1h+nDLMT2BArgv9G7DXf4lFxIr3POUkdm/k/eqg6iXz5BZqN4bEp+C7P+GbB5TEo8
 Xi539SADI0dAiR1jCUSb/rJKCi1PVbj0JaJsn4RdwNR3CCWp/DX3+3EcUq4qOLjvlz99
 QgJC/e1hQyVQv0rKiWaa2W1SuDzTZcEAttVUkJBoAC1hoBTL4hFfKLQyJuVKU+yxpfsO
 unAAwQYRK+AHnxDZzW8mrVbEBr+wvlQ19+NgkAjf8TTjGfn8K+MT2M4W79+EZGpcUolZ
 zyLA==
X-Gm-Message-State: APjAAAXUx3nQiuXl3H/QolhGG/5tEq1TqRYLFuYGfN2hh1aBAKPAthXc
 SC/Ue+hGLrpq+hrDesXDRusfT87igYQ=
X-Google-Smtp-Source: APXvYqzVHZjsa9n6yVZ3M1fWM4HqC2+2bAl/EeqC7EkzMayo6LlFJetzg03vkgXrBfQZHqcSNESEJw==
X-Received: by 2002:ae9:e8c2:: with SMTP id
 a185mr46337444qkg.358.1560799067593; 
 Mon, 17 Jun 2019 12:17:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 045/459] drm/amdgpu: add module parameter for async_gfx_ring
 enablement
Date: Mon, 17 Jun 2019 14:10:06 -0500
Message-Id: <20190617191700.17899-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/NRWBFUojfEPtmRZ+J1wNrRk1Fk+Igd4hz9iwFbrMnI=;
 b=q+WQSHG8XLqEJnbDPU16/PzgW/94IQY62ADtEb2HpuVdZ/GYkQECJy0+qe9j8NvDnz
 p3t6s189FEmrrqWO5l+8ypC8tOatqh1eZQyRzcI76di+qtUk7eWYea3YJvmmmrkK1wCB
 o4nccGTom2GXzDdhoOLQM7eSVVilot0KRC6DPs1Kk+1dNqaLUV8BbneeWcPIjW6FWpga
 oU7f28OigPiW9YcAZdnTj97TlbaffZJ1G6UNLxgp8AJ/ky3Lgj47SBRVfmighH6e5t/o
 a2HcQLi1XVdohvC2Kk3XiL+K/o5Vl1oT4C8e7VjPnSmIiG7YSC3y1WSq64NdNl74qSbU
 3LNQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <jack.xiao@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKMCBtZWFucyBkaXNh
YmxlIGFzeW5jX2dmeF9yaW5nIGFuZCBpcyB0aGUgZGVmYXVsdCBzZXR0aW5nCjEgbWVhbnMgZW5h
YmxlIGFzeW5jX2dmeF9yaW5nCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPGphY2sueGlhb0BhbWQuY29t
PgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpB
Y2tlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IDY3
OWE0ZTQyNWMwMy4uZDM0MzgwYTI3YjE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aApAQCAtMTU4LDYgKzE1OCw3IEBAIGV4dGVybiB1aW50IGFtZGdwdV9kbV9hYm1fbGV2ZWw7CiBl
eHRlcm4gc3RydWN0IGFtZGdwdV9tZ3B1X2luZm8gbWdwdV9pbmZvOwogZXh0ZXJuIGludCBhbWRn
cHVfcmFzX2VuYWJsZTsKIGV4dGVybiB1aW50IGFtZGdwdV9yYXNfbWFzazsKK2V4dGVybiBpbnQg
YW1kZ3B1X2FzeW5jX2dmeF9yaW5nOwogCiAjaWZkZWYgQ09ORklHX0RSTV9BTURHUFVfU0kKIGV4
dGVybiBpbnQgYW1kZ3B1X3NpX3N1cHBvcnQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMKaW5kZXggMWJiMGQwMTIzOWUxLi4xYmZlYTdkNTcyZTIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTEzNiw2ICsxMzYsNyBAQCBpbnQgYW1kZ3B1
X2VtdV9tb2RlID0gMDsKIHVpbnQgYW1kZ3B1X3NtdV9tZW1vcnlfcG9vbF9zaXplID0gMDsKIC8q
IEZCQyAoYml0IDApIGRpc2FibGVkIGJ5IGRlZmF1bHQqLwogdWludCBhbWRncHVfZGNfZmVhdHVy
ZV9tYXNrID0gMDsKK2ludCBhbWRncHVfYXN5bmNfZ2Z4X3JpbmcgPSAwOwogCiBzdHJ1Y3QgYW1k
Z3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7CiAJLm11dGV4ID0gX19NVVRFWF9JTklUSUFMSVpF
UihtZ3B1X2luZm8ubXV0ZXgpLApAQCAtNTY1LDYgKzU2NiwxNCBAQCBNT0RVTEVfUEFSTV9ERVND
KHNtdV9tZW1vcnlfcG9vbF9zaXplLAogCQkiMHgxID0gMjU2TWJ5dGUsIDB4MiA9IDUxMk1ieXRl
LCAweDQgPSAxIEdieXRlLCAweDggPSAyR0J5dGUiKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChzbXVf
bWVtb3J5X3Bvb2xfc2l6ZSwgYW1kZ3B1X3NtdV9tZW1vcnlfcG9vbF9zaXplLCB1aW50LCAwNDQ0
KTsKIAorLyoqCisgKiBET0M6IGFzeW5jX2dmeF9yaW5nIChpbnQpCisgKiBJdCBpcyB1c2VkIHRv
IGVuYWJsZSBnZnggcmluZ3MgdGhhdCBjb3VsZCBiZSBjb25maWd1cmVkIHdpdGggZGlmZmVyZW50
IHByaW9yaXRpdGVzIG9yIGVxdWFsIHByaW9yaXRpZXMKKyAqLworTU9EVUxFX1BBUk1fREVTQyhh
c3luY19nZnhfcmluZywKKwkiQXN5bmNocm9ub3VzIEdGWCByaW5ncyB0aGF0IGNvdWxkIGJlIGNv
bmZpZ3VyZWQgd2l0aCBlaXRoZXIgZGlmZmVyZW50IHByaW9yaXRpZXMgKEhQM0QgcmluZyBhbmQg
TFAzRCByaW5nKSwgb3IgZXF1YWwgcHJpb3JpdGllcyAoMCA9IGRpc2FibGVkIChkZWZhdWx0KSwg
MSA9IGVuYWJsZWQpIik7Cittb2R1bGVfcGFyYW1fbmFtZWQoYXN5bmNfZ2Z4X3JpbmcsIGFtZGdw
dV9hc3luY19nZnhfcmluZywgaW50LCAwNDQ0KTsKKwogI2lmZGVmIENPTkZJR19IU0FfQU1ECiAv
KioKICAqIERPQzogc2NoZWRfcG9saWN5IChpbnQpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
