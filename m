Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C949011
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D906489EBB;
	Mon, 17 Jun 2019 19:46:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9522589E50
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:54 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so7003361qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fgc7voIZUEGHcWRbwfgr9nPG6RU3vSGdBJSacE7Nz5M=;
 b=mI/vyVfcwsWyfklgJQ0BgST6hnbVo4Ht8fbNvAbqaUUdscg38vRGC0xQHhP/wOUQu8
 M0GWgt/Sluf5QrCQrcpkl+r+g0xqekNhyQQM3wJ/K3LwUmlsE9hFKeQUuCBMjFXixHJU
 wEdWkOa53Z7MBMx3mpB51VB8NGn2yTKvxgzocENKPs9aJD29EUSnhf8LnomBNV9yKZUK
 LQNgHUt95nyJrvws3M2XBqtSxowMdcEKdFPJDqCrBQ6USev1LXQ8/uYktbiXv2E7RvsE
 eCspxxofUP8N2Ii+JL+ekQEu773yOuIYeeZxaaHls9BA9tGX6XbK57MS4ZZskB4Sqm14
 6RCg==
X-Gm-Message-State: APjAAAXWFhBWyiCQXUGZz4rW9jY7mmhRA4nKF8V3usWpnGYzoqWhvS9h
 2U6UuD5npRNH5CcMRpaqUqYhCDVjDsTv2A==
X-Google-Smtp-Source: APXvYqwwZkoTJPvhOlP1dI7lhQOmAKco6NLwcZN7edXRqrEhARS6oHGoFZRupPYAkCVfnCngbaWbfA==
X-Received: by 2002:a37:a094:: with SMTP id j142mr91375535qke.2.1560800813612; 
 Mon, 17 Jun 2019 12:46:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 356/459] drm/amd/display: disable dcn20 abm feature for bring
 up
Date: Mon, 17 Jun 2019 14:44:57 -0500
Message-Id: <20190617194540.18497-57-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fgc7voIZUEGHcWRbwfgr9nPG6RU3vSGdBJSacE7Nz5M=;
 b=OV93XpVGbMt+4D54xa2rlH5WqwvimUfzQPUNByt9MHW+0fj2pIkZNVeo6ilmaeClPH
 XN7RoXYSCYbvq4CIFhMlNgBmLEdMl2R6gDpIfMykhzClEiE7OS055OSqYjQSS9iSjPbT
 NA31hKRg6T/QUx3fDCDOh+VdgCVuRNFyoAKb1sWBpVgLMhkj51M7NAq8QlrpKTN48xrA
 kglLQ960VpvFhEHBNuH1t7DdMBtx06LPRbp2yPwTkQ7b+QFtg3/TWUgOLVQr5zTwy7wP
 41+P8JHLlpIe8bkenUGXXN2Xx7qcJuSKzDSk7g2J4AYF71ku1C5BoVBz6qO0EPWdbteO
 jEIw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKW1dIWV0gZGNuMjAgZW5hYmxl
IHVzYi1jIGRwIEFMVCBtb2RlIGluIGRtY3UuIFRoZXJlIGlzIGJ1Zwp3aGVuIGVuYWJsZSBhYm0g
ZmVhdHVyZSB3aGljaCBjYXVzZSBzeXN0ZW0gY3Jhc2guIGRhbCB0ZWFtCndpbGwgZGVidWcgdGhp
cyBidWcgbGF0ZXIuCgpbSE9XXSBkaXNhYmxlIGRjbiBhYm0gZmVhdHVyZSBmb3IgZGNuMjAuCgpT
aWduZWQtb2ZmLWJ5OiBoZXJzZW4gd3UgPGhlcnNlbnhzLnd1QGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTEgKysrKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5k
ZXggMjdjNTcyNjdlMjk1Li5kMjAyNTBiMTgxYjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNzgxLDcgKzc4MSw3IEBAIHN0
YXRpYyBpbnQgZG1fbGF0ZV9pbml0KHZvaWQgKmhhbmRsZSkKIAl1bnNpZ25lZCBpbnQgbGluZWFy
X2x1dFsxNl07CiAJaW50IGk7CiAJc3RydWN0IGRtY3UgKmRtY3UgPSBhZGV2LT5kbS5kYy0+cmVz
X3Bvb2wtPmRtY3U7Ci0JYm9vbCByZXQ7CisJYm9vbCByZXQgPSBmYWxzZTsKIAogCWZvciAoaSA9
IDA7IGkgPCAxNjsgaSsrKQogCQlsaW5lYXJfbHV0W2ldID0gMHhGRkZGICogaSAvIDE1OwpAQCAt
NzkyLDEwICs3OTIsMTMgQEAgc3RhdGljIGludCBkbV9sYXRlX2luaXQodm9pZCAqaGFuZGxlKQog
CXBhcmFtcy5iYWNrbGlnaHRfbHV0X2FycmF5X3NpemUgPSAxNjsKIAlwYXJhbXMuYmFja2xpZ2h0
X2x1dF9hcnJheSA9IGxpbmVhcl9sdXQ7CiAKLQlyZXQgPSBkbWN1X2xvYWRfaXJhbShkbWN1LCBw
YXJhbXMpOworCS8qIHRvZG8gd2lsbCBlbmFibGUgZm9yIG5hdmkxMCAqLworCWlmIChhZGV2LT5h
c2ljX3R5cGUgPD0gQ0hJUF9SQVZFTikgeworCQlyZXQgPSBkbWN1X2xvYWRfaXJhbShkbWN1LCBw
YXJhbXMpOwogCi0JaWYgKCFyZXQpCi0JCXJldHVybiAtRUlOVkFMOworCQlpZiAoIXJldCkKKwkJ
CXJldHVybiAtRUlOVkFMOworCX0KIAogCXJldHVybiBkZXRlY3RfbXN0X2xpbmtfZm9yX2FsbF9j
b25uZWN0b3JzKGFkZXYtPmRkZXYpOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
