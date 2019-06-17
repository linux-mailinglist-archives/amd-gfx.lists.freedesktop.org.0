Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C948E18
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0768968D;
	Mon, 17 Jun 2019 19:18:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9288966B
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:29 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x47so12139380qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=knqCKdDX6yVNADpEO7w9+zN9yc2jF3FFcJ3eqK9T8mk=;
 b=ue4vKyaHiYMJGpE8tC9qxP3XjiYzNZNZpCA9QgIHAylHtCcrkFLxJWZt7rh0aaZ/yO
 E2G8VRxTFpSr8iA311Pn4LjakeuN8AZOJL/lnTlTcIpRq/W8PfMd8xaEejuWAFtUz3RU
 NiWqkHt5KYSWVoVk9xhwoozmTaNYXOd3wFu51GucfPz+9FFy3RMK0g6rLGuewQb5HIzp
 VQVOohpR4msaFvVPCCoMmJvmNP7CSUGwJbi3Fh/378jCFBqdWBsIEp3G/viu7Cv//CYa
 nFQX4w1StD99d1LMEv5Y0xwHI3mx4cbJ+KUH7SSEmtadiWETQBz9m8lsNgHfH7rfpdVB
 T+Vw==
X-Gm-Message-State: APjAAAWW2ky1ImABzlP60MohEg0oebEytVN9s/Wix+MfO5VBj0ncOYMS
 CI5qLKhauc5byc7InLo+ZdW7V7v/vvs=
X-Google-Smtp-Source: APXvYqygNx3Eyd4HQcLPXPia5vyghZIiWQGdSaBVewTbQlkAmFK3ttetK5x9eXnhROr9c8IW2lBHbg==
X-Received: by 2002:a0c:9932:: with SMTP id h47mr23226807qvd.147.1560799108320; 
 Mon, 17 Jun 2019 12:18:28 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 090/459] drm/amdgpu: add mcbp driver parameter
Date: Mon, 17 Jun 2019 14:10:51 -0500
Message-Id: <20190617191700.17899-79-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=knqCKdDX6yVNADpEO7w9+zN9yc2jF3FFcJ3eqK9T8mk=;
 b=n7HtXnWGgxambiuV9uCS8F1oZaHlNL/UrsNnYM4eqvb9LO6vrifDHMw9OQXUndjppe
 7yR8NYYz7lQsPn2GjeaASPuqRGD/tyWNmO+efjBf2BC0DbY0WFYh6J3KdYVVsSygeuJK
 hXtdJAvBysDQOkbA7UjYH4RbehvqIYvqz5cWVb5qt5JcZG/b2tAQW6vjvCMZOrJt7Otx
 V8MR77JSZgQpfHbs9ObVy5rTU5O2rGMm8vEErVlbqPUREyplX+1OERJtVkCW9RG+mXry
 9nbMbhdxQB/lBihmaQm6vANCp9/MR73jR6WTIeXfao3EV9n/GNJIvFura8Lfrwl0lCYp
 Em/g==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFkZCBtY2JwIGRyaXZlciBwYXJh
bWV0ZXIsIHNvIHRoYXQgbWNicCBmZWF0dXJlIGNhbiBiZQplbmFibGVkL2Rpc2FibGVkIGJ5IGRy
aXZlciBwYXJhbWV0ZXIuCgpBY2tlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgIHwgMSArCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAzICsrKwogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgNSArKysrKwogMyBmaWxlcyBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IGQz
NDM4MGEyN2IxNC4uNDljNmY5OWI2YWI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aApAQCAtMTU5LDYgKzE1OSw3IEBAIGV4dGVybiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1
X2luZm87CiBleHRlcm4gaW50IGFtZGdwdV9yYXNfZW5hYmxlOwogZXh0ZXJuIHVpbnQgYW1kZ3B1
X3Jhc19tYXNrOwogZXh0ZXJuIGludCBhbWRncHVfYXN5bmNfZ2Z4X3Jpbmc7CitleHRlcm4gaW50
IGFtZGdwdV9tY2JwOwogCiAjaWZkZWYgQ09ORklHX0RSTV9BTURHUFVfU0kKIGV4dGVybiBpbnQg
YW1kZ3B1X3NpX3N1cHBvcnQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKaW5kZXggNmYyMmU3N2Y5MDhmLi44MmJmMjNlZjE3NjkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTI1NzQsNiArMjU3NCw5IEBAIGludCBh
bWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAlhbWRncHVf
ZGV2aWNlX2dldF9wY2llX2luZm8oYWRldik7CiAKKwlpZiAoYW1kZ3B1X21jYnApCisJCURSTV9J
TkZPKCJNQ0JQIGlzIGVuYWJsZWRcbiIpOworCiAJLyogZWFybHkgaW5pdCBmdW5jdGlvbnMgKi8K
IAlyID0gYW1kZ3B1X2RldmljZV9pcF9lYXJseV9pbml0KGFkZXYpOwogCWlmIChyKQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDlkMTcyYjM3YjFmNy4uMDA3NTNm
OWI4YjUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC0xMzcs
NiArMTM3LDcgQEAgdWludCBhbWRncHVfc211X21lbW9yeV9wb29sX3NpemUgPSAwOwogLyogRkJD
IChiaXQgMCkgZGlzYWJsZWQgYnkgZGVmYXVsdCovCiB1aW50IGFtZGdwdV9kY19mZWF0dXJlX21h
c2sgPSAwOwogaW50IGFtZGdwdV9hc3luY19nZnhfcmluZyA9IDE7CitpbnQgYW1kZ3B1X21jYnAg
PSAwOwogCiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7CiAJLm11dGV4ID0g
X19NVVRFWF9JTklUSUFMSVpFUihtZ3B1X2luZm8ubXV0ZXgpLApAQCAtNTc0LDYgKzU3NSwxMCBA
QCBNT0RVTEVfUEFSTV9ERVNDKGFzeW5jX2dmeF9yaW5nLAogCSJBc3luY2hyb25vdXMgR0ZYIHJp
bmdzIHRoYXQgY291bGQgYmUgY29uZmlndXJlZCB3aXRoIGVpdGhlciBkaWZmZXJlbnQgcHJpb3Jp
dGllcyAoSFAzRCByaW5nIGFuZCBMUDNEIHJpbmcpLCBvciBlcXVhbCBwcmlvcml0aWVzICgwID0g
ZGlzYWJsZWQsIDEgPSBlbmFibGVkIChkZWZhdWx0KSkiKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChh
c3luY19nZnhfcmluZywgYW1kZ3B1X2FzeW5jX2dmeF9yaW5nLCBpbnQsIDA0NDQpOwogCitNT0RV
TEVfUEFSTV9ERVNDKG1jYnAsCisJIkVuYWJsZSBNaWQtY29tbWFuZCBidWZmZXIgcHJlZW1wdGlv
biAoMCA9IGRpc2FibGVkIChkZWZhdWx0KSwgMSA9IGVuYWJsZWQpIik7Cittb2R1bGVfcGFyYW1f
bmFtZWQobWNicCwgYW1kZ3B1X21jYnAsIGludCwgMDQ0NCk7CisKICNpZmRlZiBDT05GSUdfSFNB
X0FNRAogLyoqCiAgKiBET0M6IHNjaGVkX3BvbGljeSAoaW50KQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
