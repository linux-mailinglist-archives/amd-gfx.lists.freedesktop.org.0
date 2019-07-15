Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6AC69E2F
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D760289F5F;
	Mon, 15 Jul 2019 21:25:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFC789F49
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:39 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d79so12833086qke.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R8qbBaqV8tjjexTqr6+iyfYFPqO/ytrbcwxVBtHLXNQ=;
 b=W3IozC7Zy98Whw6K2t2fcaqbxRroQpNSkpVROHwE5zAkQHOVxaYcnk+XrF/wrfvg6f
 AKXHmVrHFEWv7MzfFejD/zs547tvqdPwS2hKLd17qdBGg8RquC4RlJaecxr++00/FCor
 ZpVVQNVhmidHaJhL1f8Y94VqdxTONTTMqag1CnYzShl7aGgQWBEHHGOb1yMfVQW5SwME
 qMJil1TwszmCTYU4+SjoVk7vIY2NfD3EzxzVB8zWd8HoGzFOPBU6k3ivIvktIlOyGDTx
 TERzwZ77Rck+8HAam1Zhxh61YIlDgCfh7cNX7mFyU4ByDpTYCNba35fLcUA3Mzz30Ls7
 iiEw==
X-Gm-Message-State: APjAAAWB+0vSqP8X2pbh+63kNzzf54ASQKSUm7CEoSxtAoa2H8VnC65V
 8ivUPrSJYLB/sKBAufBSsnFN6erk
X-Google-Smtp-Source: APXvYqzd1EmURbtL7SxytQW5453JDWpuejH7RhG5O0Up2GImyum91GjaOU9rWjDcQbAQn9zqUJzLAQ==
X-Received: by 2002:a37:a20f:: with SMTP id l15mr18514942qke.212.1563225938222; 
 Mon, 15 Jul 2019 14:25:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 060/102] drm/amdgpu: add Arcturus to the VCN family
Date: Mon, 15 Jul 2019 16:23:55 -0500
Message-Id: <20190715212437.31793-58-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R8qbBaqV8tjjexTqr6+iyfYFPqO/ytrbcwxVBtHLXNQ=;
 b=ds4uSTQsBDXFmn7HORJZIOdgA1uwxNj2AyI/dMwIoczwbwbHHeyE5+ngG2buvCrHcd
 BqgPEnGlE0+IVJZVX7yNkAIGp7+wTc1DQ+OutlppZV5x8yVb1RbeYtGN3SFQD78wAoBC
 btcIg0bbpi2JXZsKobncbz/HYGIpZx58tE5Me8iVWJV3UYZFeNPJeXMGMfgjVb9MjmPW
 34by9kKAjzDnC1nO1tAFJGgHHl5adsIrWNxEGOSsd80hDnmCSLpywciZwHRXLZxsGAoB
 Z6Vymf2Bot49MWq2TuI823NgNCWM2Qj2qvQAPhvUaf4FZ1qP9Hte6SIBTggH46xxA4YU
 9E6w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKaW5jbHVkaW5nIGZpcm13YXJlIHN1cHBv
cnQgZXRjLgoKU2lnbmVkLW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92Y24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24u
YwppbmRleCA4YTE2MmJkYWQ3OWUuLmJiMGQxZWY1MGM5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92Y24uYwpAQCAtNDUsMTIgKzQ1LDE0IEBACiAjZGVmaW5lIEZJUk1XQVJF
X1JBVkVOCQkiYW1kZ3B1L3JhdmVuX3Zjbi5iaW4iCiAjZGVmaW5lIEZJUk1XQVJFX1BJQ0FTU08J
ImFtZGdwdS9waWNhc3NvX3Zjbi5iaW4iCiAjZGVmaW5lIEZJUk1XQVJFX1JBVkVOMgkJImFtZGdw
dS9yYXZlbjJfdmNuLmJpbiIKKyNkZWZpbmUgRklSTVdBUkVfQVJDVFVSVVMgCSJhbWRncHUvYXJj
dHVydXNfdmNuLmJpbiIKICNkZWZpbmUgRklSTVdBUkVfTkFWSTEwIAkiYW1kZ3B1L25hdmkxMF92
Y24uYmluIgogI2RlZmluZSBGSVJNV0FSRV9OQVZJMTQgCSJhbWRncHUvbmF2aTE0X3Zjbi5iaW4i
CiAKIE1PRFVMRV9GSVJNV0FSRShGSVJNV0FSRV9SQVZFTik7CiBNT0RVTEVfRklSTVdBUkUoRklS
TVdBUkVfUElDQVNTTyk7CiBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVfUkFWRU4yKTsKK01PRFVM
RV9GSVJNV0FSRShGSVJNV0FSRV9BUkNUVVJVUyk7CiBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVf
TkFWSTEwKTsKIE1PRFVMRV9GSVJNV0FSRShGSVJNV0FSRV9OQVZJMTQpOwogCkBAIC03NSw2ICs3
Nyw5IEBAIGludCBhbWRncHVfdmNuX3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJCWVsc2UKIAkJCWZ3X25hbWUgPSBGSVJNV0FSRV9SQVZFTjsKIAkJYnJlYWs7CisJY2FzZSBD
SElQX0FSQ1RVUlVTOgorCQlmd19uYW1lID0gRklSTVdBUkVfQVJDVFVSVVM7CisJCWJyZWFrOwog
CWNhc2UgQ0hJUF9OQVZJMTA6CiAJCWZ3X25hbWUgPSBGSVJNV0FSRV9OQVZJMTA7CiAJCWlmICgo
YWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BTUCkgJiYKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
