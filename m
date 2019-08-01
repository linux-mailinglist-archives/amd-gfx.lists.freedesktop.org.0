Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD83C7E37F
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 21:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9646E79C;
	Thu,  1 Aug 2019 19:50:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0036E79A
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 19:50:53 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id r6so67301928qtt.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 12:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcW+ffKFX2tywNyqZUOlc/388dcyA5ZQSdchVU9xa5k=;
 b=FI02ErdU9mSXXYcO5fERMmbGcMHELp+LJffsML1ieKB8zI5xeA6MpXqevRa1ejFMD9
 c3I824cQSzjT7zyRITsAAFgbFATPrh3ytX50avnVSTSncefTtHNRZ2xmPFSuENgbWAlm
 1eevW4llkMsGq8qqu//rg8TlvKjbocS46NEFosDyoKWDJP99NFEicA6VbmlGByXM0B5W
 Wr5p7lOYFwbK+GhMB/QRhFb0UJKe+g4FjaRY5vprfH9VRxw2qY6VY0DQkr4wKqi/2gCD
 mfJMe0M3mDBs0DZRnuPDEc9XQdX5VcviAioIM87i6T9W0429Qm80OBsH9xzLP/ELlvim
 iJYQ==
X-Gm-Message-State: APjAAAV381MJMUUFfobrRlzre77jE91MdNj/636xpbRw82MIdZCmi8bp
 4PmCXCNH63BWM72h2WhNR8WHa/d5
X-Google-Smtp-Source: APXvYqwKzcNlZ5U8RPrszzDf/yCqQ3eIDeGtHxmNS9mb1mGj7hj103waPBmAxor/0GOR8aajDVEaDw==
X-Received: by 2002:ac8:23c5:: with SMTP id r5mr94294238qtr.319.1564689052828; 
 Thu, 01 Aug 2019 12:50:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id f26sm39941602qtf.44.2019.08.01.12.50.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 12:50:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/amdgpu: add PSP SW init support for Arcturus
Date: Thu,  1 Aug 2019 14:50:39 -0500
Message-Id: <20190801195044.10331-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801195044.10331-1-alexander.deucher@amd.com>
References: <20190801195044.10331-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcW+ffKFX2tywNyqZUOlc/388dcyA5ZQSdchVU9xa5k=;
 b=iASxv88/GGRbKxsVlR59Di1aUgBH21c76hRJzrC+ZZjdzgLTUTV3UIpfzD4FDUwQwJ
 LGMGr9Lg/5fhcRfJL8NfBzeHc6iRvNpyS+wKGInutVl55ZrR7CQZIzA5/tyvFzS7VHZw
 LALhbha5mfsXO57pFsKJG2mxsYEFI5F9VPplcpbQDn8DAMS2H2pKaGeDAq+TQWna+7jX
 RAW/FQTy9L0lcbYd0ZZ6tw8WBk6r0YCkAL8K6HiQ9Lc7Py6WmUPYhIsRKNJks6LvFM3k
 j8qaflT53Z6T3qkHDFKiTTHUB4oO2Hlll43cwyam1lhicrY/L55/FuWC9Ebd7ccgqXmr
 qu+g==
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
 John Clements <john.clements@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBDbGVtZW50cyA8Sm9obi5DbGVtZW50c0BhbWQuY29tPgoKQWRkIGFyY3R1cnVz
IGNhc2VzIHRvIHBzcCBpbml0IHNld3F1ZW5jZS4KClNpZ25lZC1vZmYtYnk6IEpvaG4gQ2xlbWVu
dHMgPGpvaG4uY2xlbWVudHNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgIHwg
MyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4IGQwNTJkMDg3M2U3MS4uNGIxMzg1NDU3ZjgyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBAIC01Myw2ICs1Myw3IEBA
IHN0YXRpYyBpbnQgcHNwX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQlwc3AtPmF1dG9sb2Fk
X3N1cHBvcnRlZCA9IGZhbHNlOwogCQlicmVhazsKIAljYXNlIENISVBfVkVHQTIwOgorCWNhc2Ug
Q0hJUF9BUkNUVVJVUzoKIAkJcHNwX3YxMV8wX3NldF9wc3BfZnVuY3MocHNwKTsKIAkJcHNwLT5h
dXRvbG9hZF9zdXBwb3J0ZWQgPSBmYWxzZTsKIAkJYnJlYWs7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3BzcF92MTFfMC5jCmluZGV4IDJlYzgyMTU1NTU2OS4uYzkzMDYyZDkxYmI2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAtNDMsNiArNDMsOCBAQCBNT0RVTEVf
RklSTVdBUkUoImFtZGdwdS9uYXZpMTBfc29zLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRn
cHUvbmF2aTEwX2FzZC5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9zb3Mu
YmluIik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfYXNkLmJpbiIpOworTU9EVUxF
X0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNfc29zLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJh
bWRncHUvYXJjdHVydXNfYXNkLmJpbiIpOwogCiAvKiBhZGRyZXNzIGJsb2NrICovCiAjZGVmaW5l
IHNtbk1QMV9GSVJNV0FSRV9GTEFHUwkJMHgzMDEwMDI0CkBAIC0xNjIsNiArMTY0LDcgQEAgc3Rh
dGljIGludCBwc3BfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHBzcF9jb250ZXh0ICpwc3Ap
CiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2FzZSBDSElQX05BVkkxNDoKKwljYXNl
IENISVBfQVJDVFVSVVM6CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCUJVRygpOwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
