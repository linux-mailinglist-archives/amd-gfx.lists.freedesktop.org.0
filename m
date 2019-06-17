Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FED548FE5
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EF889DC9;
	Mon, 17 Jun 2019 19:46:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BC789DBD
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:10 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so7335824qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n10ByOaMSOffBZp2e0vxI0oDO+SLiu0OLhdljd/bLKY=;
 b=s1etiayrmpG9ysWPH9vLy24x1W+Nql++RMpmYuT1xczCu2AZClghFUYuenfYcZGx7K
 HAuPonn+IyKUWK0Azw9zj/KtFOPacdP1cXFxeREd7uGSBZseNp58CFyxXWskwI9O4vE4
 NORCjp2PKHQt0p5/MT03GcxM2LkoKEBHk3qDsXiOM/JJOXh5O2aU7fOO+IYTDyfn1MIg
 NSB1grVOX4di6ib2phtCM7b7GnVDuiIuL9/ubEhvMFGEqEUyrKQQv2uNYcqImlNVKE2S
 GOypQexDFwp/lXLf1rwaAA6nscWtzA4+DT8Zs2BUJ1SjC0pdT4GOQ14OOoV/VehfQn00
 4ylw==
X-Gm-Message-State: APjAAAXS8zB40EBhsUjIApGd+lkCqojjNcKLm4MGTXq7EiKUTM6QUIV9
 3AZO6vxRQc+Lej5P31oDVmQvOIWzQoM=
X-Google-Smtp-Source: APXvYqx2+wfkUjg+TfEDkB7Lf2010mGW9/JF5nuuRwfACPdqWE/V42jdNC1WcR/ZwP1lKXe1ic7DjA==
X-Received: by 2002:ac8:3014:: with SMTP id f20mr96349771qte.69.1560800768617; 
 Mon, 17 Jun 2019 12:46:08 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 319/459] drm/amd/display: Add DCN2 BIOS parsing
Date: Mon, 17 Jun 2019 14:44:20 -0500
Message-Id: <20190617194540.18497-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n10ByOaMSOffBZp2e0vxI0oDO+SLiu0OLhdljd/bLKY=;
 b=DIHdP6VYM5ttoE84bHOdIXr0axYn8yml+ImC7fDp1XUf25W2H8oSUa+TcYKOkc73HX
 XHK5XdRvtiS7fYjJcyjHscQO/6qE3C5A7WAm6fWonf/DskmqBgKhc2hQW8lEyvamMmR1
 PRZ+dABCjfOY0KOdGRMPzBRk1IRW2JiP6cSNMkTuwd2b1emS+VGDgf0MxR17VyOmMDVE
 Md0iDUTsXSXB6Sty0f1bHFh5YxlfJnO3j+psp1tBsp7tGt4zsW6cBlCIFqPJ7iQ7gGr7
 aCCR8lxvZrkov2Y00pyGOtgzDwDOBksRoVYyI1kFc/+8ldFdwffrcYT8AKhBcEuqVXF3
 hX0A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CgpIYW5kbGUgQklP
UyBwYXJzaW5nIGZvciBEQ04yCgpTaWduZWQtb2ZmLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnku
d2VudGxhbmRAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9z
L2Jpb3NfcGFyc2VyMi5jICAgICAgICAgIHwgNCArKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlX2hlbHBlcjIuYyB8IDYgKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5jCmluZGV4IDEyYmM3ZWU2NmIxOC4uOTlmNDBi
OGEyMzFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9i
aW9zX3BhcnNlcjIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9i
aW9zX3BhcnNlcjIuYwpAQCAtMTQwMCw2ICsxNDAwLDEwIEBAIHN0YXRpYyBlbnVtIGJwX3Jlc3Vs
dCBnZXRfaW50ZWdyYXRlZF9pbmZvX3YxMSgKIAlpbmZvLT5tYV9jaGFubmVsX251bWJlciA9IGlu
Zm9fdjExLT51bWFjaGFubmVsbnVtYmVyOwogCWluZm8tPmx2ZHNfc3NfcGVyY2VudGFnZSA9CiAJ
bGUxNl90b19jcHUoaW5mb192MTEtPmx2ZHNfc3NfcGVyY2VudGFnZSk7CisjaWZkZWYgQ09ORklH
X0RSTV9BTURfRENfRENOMl8wCisJaW5mby0+ZHBfc3NfY29udHJvbCA9CisJbGUxNl90b19jcHUo
aW5mb192MTEtPnJlc2VydmVkMSk7CisjZW5kaWYKIAlpbmZvLT5sdmRzX3NzcHJlYWRfcmF0ZV9p
bl8xMGh6ID0KIAlsZTE2X3RvX2NwdShpbmZvX3YxMS0+bHZkc19zc19yYXRlXzEwaHopOwogCWlu
Zm8tPmhkbWlfc3NfcGVyY2VudGFnZSA9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlX2hlbHBlcjIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9iaW9zL2NvbW1hbmRfdGFibGVfaGVscGVyMi5jCmluZGV4IDUzZGVi
YTQyMDA3YS4uZjk0MzlkZmM3Yjc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlX2hlbHBlcjIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlX2hlbHBlcjIuYwpAQCAtNjEsNiAr
NjEsMTIgQEAgYm9vbCBkYWxfYmlvc19wYXJzZXJfaW5pdF9jbWRfdGJsX2hlbHBlcjIoCiAJCSpo
ID0gZGFsX2NtZF90YmxfaGVscGVyX2RjZTExMl9nZXRfdGFibGUyKCk7CiAJCXJldHVybiB0cnVl
OwogI2VuZGlmCisKKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMCkKKwljYXNl
IERDTl9WRVJTSU9OXzJfMDoKKwkJKmggPSBkYWxfY21kX3RibF9oZWxwZXJfZGNlMTEyX2dldF90
YWJsZTIoKTsKKwkJcmV0dXJuIHRydWU7CisjZW5kaWYKIAljYXNlIERDRV9WRVJTSU9OXzEyXzA6
CiAJY2FzZSBEQ0VfVkVSU0lPTl8xMl8xOgogCQkqaCA9IGRhbF9jbWRfdGJsX2hlbHBlcl9kY2Ux
MTJfZ2V0X3RhYmxlMigpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
