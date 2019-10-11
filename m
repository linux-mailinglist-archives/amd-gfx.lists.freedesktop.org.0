Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3771D374B
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2826EB9D;
	Fri, 11 Oct 2019 01:46:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE2F6EB99
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:57 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id f16so7466335qkl.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X5RC18pWEW3NZLRL1sFdz75+pNLDRIj2y437eAdNCBA=;
 b=lQfwLa5d0gqtrTYLlgQGSZJnQMMIurVkYgWGkcBsfPJ2qg/FYTjFxWcIrUTUnIq7RU
 wj4pGF3INCJWh7PU4yCThvKU9/PmkU6kb7x8nsrDP3RUhmb+OPgGeO/J1ZTLAIAk5YkL
 o9WCI9E8XeMfKp0Sp2g8Ttv4STP8DiQ+p8TqNSIyhPymkCYOb5qAZLM81kvf6id9sY70
 Y3lH7gOF5PLWuP5LSr5w1Y6rRu5j//HOOqfD0hmUE8nvnZErO3YoPlX7FbNt7Dq9WWGz
 9A/HvGm5GNCMuXtCaHJU5Q8AMRsXRkjjVUHyGIx7hc9PKn5eIHWzw4sDxU/W7/sOQXzc
 VTGA==
X-Gm-Message-State: APjAAAXQibqJrFQG526L6pWcwPrw5xNm9/gtPkA8r9fXy+rOjPFthmvb
 Yj7DaE3d20tSBUyC+164yJUE/2w+
X-Google-Smtp-Source: APXvYqypxqkpaNMq3ZEUW5MIiB/WRYJyds3oquQeo3u+1qSoiEjUYIBcCRMYFR4ivt449MGGrcdksA==
X-Received: by 2002:a05:620a:209e:: with SMTP id
 e30mr11411204qka.440.1570758356146; 
 Thu, 10 Oct 2019 18:45:56 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 11/19] drm/amdgpu: add helpers for baco entry and exit
Date: Thu, 10 Oct 2019 20:45:28 -0500
Message-Id: <20191011014536.10869-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X5RC18pWEW3NZLRL1sFdz75+pNLDRIj2y437eAdNCBA=;
 b=cmx853UjP3mLcIfvVigRLP1b5X1Pr11pp3CmPKTiL4GdFYr+YnoFFLvfiafps1q0Li
 zTWipB4TDozMo4N8Lw246m71PQlPvHkVLw5ZWI94r8/g+wI7+cUdDyqfRe8NwBZhHOm/
 e9uAm3VhTiH6j9D0ZpkU1A5PnAJogz/lQvu7wLT4VHVtdOYhO5Etdna2lfvFlYhdvULU
 L0ytV9g689EQdcCJvKH4idGMpwasuCEbcH/zekiZKhlNBA64In4GwEhdks6aiOc0QB2v
 4ebc0O1aeOawZ4mRg053Twf1NcfON4JYo+YVUj4fPZFYciPwX+W7O4B0kDcHEtdcHh0d
 PF+g==
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

V2lsbCBiZSB1c2VkIGZvciBydW50aW1lIHBtLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oICAgICAgICB8ICAyICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8IDYxICsrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXgg
ZGY0NWE2YzZjYzBiLi4yYjQ4OGFlOWEzMjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oCkBAIC0xMTIzLDYgKzExMjMsOCBAQCBib29sIGFtZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYm9j
byhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKIGJvb2wgYW1kZ3B1X2RldmljZV9zdXBwb3J0c19i
YWNvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwogYm9vbCBhbWRncHVfZGV2aWNlX2lzX3BlZXJf
YWNjZXNzaWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkgICAgICBzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqcGVlcl9hZGV2KTsKK2ludCBhbWRncHVfZGV2aWNlX2JhY29fZW50ZXIo
c3RydWN0IGRybV9kZXZpY2UgKmRldik7CitpbnQgYW1kZ3B1X2RldmljZV9iYWNvX2V4aXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldik7CiAKIC8qIGF0cHggaGFuZGxlciAqLwogI2lmIGRlZmluZWQo
Q09ORklHX1ZHQV9TV0lUQ0hFUk9PKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCmluZGV4IGQ2NjhiOTQ0NTFjOS4uMGY0ZTY1ZDNiZmFmIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC00MjA3LDMgKzQyMDcsNjQgQEAg
c3RhdGljIHZvaWQgYW1kZ3B1X2RldmljZV9nZXRfcGNpZV9pbmZvKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCX0KIH0KIAoraW50IGFtZGdwdV9kZXZpY2VfYmFjb19lbnRlcihzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQoreworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGV2LT5k
ZXZfcHJpdmF0ZTsKKworCWlmICghYW1kZ3B1X2RldmljZV9zdXBwb3J0c19iYWNvKGFkZXYtPmRk
ZXYpKQorCQlyZXR1cm4gLUVOT1RTVVBQOworCisJaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYp
KSB7CisJCXN0cnVjdCBzbXVfY29udGV4dCAqc211ID0gJmFkZXYtPnNtdTsKKwkJaW50IHJldDsK
KworCQlyZXQgPSBzbXVfYmFjb19lbnRlcihzbXUpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJl
dDsKKworCQlyZXR1cm4gMDsKKwl9IGVsc2UgeworCQl2b2lkICpwcF9oYW5kbGUgPSBhZGV2LT5w
b3dlcnBsYXkucHBfaGFuZGxlOworCQljb25zdCBzdHJ1Y3QgYW1kX3BtX2Z1bmNzICpwcF9mdW5j
cyA9IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jczsKKworCQlpZiAoIXBwX2Z1bmNzIHx8IXBwX2Z1
bmNzLT5nZXRfYXNpY19iYWNvX3N0YXRlIHx8IXBwX2Z1bmNzLT5zZXRfYXNpY19iYWNvX3N0YXRl
KQorCQkJcmV0dXJuIC1FTk9FTlQ7CisKKwkJLyogZW50ZXIgQkFDTyBzdGF0ZSAqLworCQlpZiAo
cHBfZnVuY3MtPnNldF9hc2ljX2JhY29fc3RhdGUocHBfaGFuZGxlLCAxKSkKKwkJCXJldHVybiAt
RUlPOworCisJCXJldHVybiAwOworCX0KK30KKworaW50IGFtZGdwdV9kZXZpY2VfYmFjb19leGl0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCit7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYg
PSBkZXYtPmRldl9wcml2YXRlOworCisJaWYgKCFhbWRncHVfZGV2aWNlX3N1cHBvcnRzX2JhY28o
YWRldi0+ZGRldikpCisJCXJldHVybiAtRU5PVFNVUFA7CisKKwlpZiAoaXNfc3VwcG9ydF9zd19z
bXUoYWRldikpIHsKKwkJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+c211OworCQlp
bnQgcmV0OworCisJCXJldCA9IHNtdV9iYWNvX2V4aXQoc211KTsKKwkJaWYgKHJldCkKKwkJCXJl
dHVybiByZXQ7CisKKwkJcmV0dXJuIDA7CisJfSBlbHNlIHsKKwkJdm9pZCAqcHBfaGFuZGxlID0g
YWRldi0+cG93ZXJwbGF5LnBwX2hhbmRsZTsKKwkJY29uc3Qgc3RydWN0IGFtZF9wbV9mdW5jcyAq
cHBfZnVuY3MgPSBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3M7CisKKwkJaWYgKCFwcF9mdW5jcyB8
fCFwcF9mdW5jcy0+Z2V0X2FzaWNfYmFjb19zdGF0ZSB8fCFwcF9mdW5jcy0+c2V0X2FzaWNfYmFj
b19zdGF0ZSkKKwkJCXJldHVybiAtRU5PRU5UOworCisJCS8qIGV4aXQgQkFDTyBzdGF0ZSAqLwor
CQlpZiAocHBfZnVuY3MtPnNldF9hc2ljX2JhY29fc3RhdGUocHBfaGFuZGxlLCAwKSkKKwkJCXJl
dHVybiAtRUlPOworCisJCXJldHVybiAwOworCX0KK30KLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
