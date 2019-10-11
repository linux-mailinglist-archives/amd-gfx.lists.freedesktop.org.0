Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC56D3744
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471F06EB98;
	Fri, 11 Oct 2019 01:45:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB39989FE3
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:48 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c21so11605877qtj.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fp8Lh5dbdE5R62pA2JG16SZiV7k5bhMwvNAo1nlVbyI=;
 b=Q76610/9QkciJBkBZ7YOsHaIfINp7CZxvPIhv492NJFJQbzIhNyk7PJBPc/1vU+Ki/
 1VAZAwv03o3jWIgVf1amnDzaWqBgF9MLLynQLn667MeNeAslzjHtqsE0Cjdj+XryI1eV
 LmdMeUkIlN/uaXh+dyOtm7O49dJ+agXCcihGdBYY00ejasDz0a4XQtck86UJFuf1M9lW
 oU0DqLF8UsNzBiG93iLDVmi/IR+2EaCvLtqURmrYGpDFVL0im4Jod83Cgpdb/rrHiVtL
 enCgz1mG8oejdSGu6HY9EZnI/8iHKuwe361ZeSkLpQCDJMEkWe6IcO3IL7yCKpBZtbbk
 5BPg==
X-Gm-Message-State: APjAAAWpJp3pP6CcBWuEjidzVI/ScSz3GfiYMv15JWTZkfVojOf4FrEn
 E61FQpTx4cXsP3HkoxPszLnd75b2
X-Google-Smtp-Source: APXvYqwAyDj/zkCOeSU9rZpnb03eFYUdDZiERsjIN+ByvqpcPuZ6h+RbVFv0Hcs9IBr4ioZy/q7ClA==
X-Received: by 2002:ac8:43ca:: with SMTP id w10mr591769qtn.325.1570758347543; 
 Thu, 10 Oct 2019 18:45:47 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 02/19] drm/amdgpu: add supports_baco callback for soc15 asics.
Date: Thu, 10 Oct 2019 20:45:19 -0500
Message-Id: <20191011014536.10869-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fp8Lh5dbdE5R62pA2JG16SZiV7k5bhMwvNAo1nlVbyI=;
 b=u+zCtXjzDrrVB7znAamUE4oAml6rARi5wh/zWCjvB3p9EZhdEw1QmbUIWUUDqXNu53
 oE/3J+0ghBPRVTRGAVgMUcmnsLyJGG0CHeHffODLy/AWHXWIIHmal502yciRnS+8Fgno
 5ZFlhRuEBz5hW9zCosIyGAYX19J+UkJYMD6ZrF4Plgz8SYWrTifCRVWZxukzUrWfz5T/
 Ck8Ctgw5vd4IYlMB5UGiPtrmDeWrr55d65Dcr5Dr3CFm/GtW2v2mRg/yy1zZmysXnzvk
 Dpzy7YZ0Dn/ct9e35H4tRdsATYxoXEK6AEzTXi4j4tjlvaM3+YpTsO94x5M/mutscZhf
 0N3Q==
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

Q2hlY2sgdGhlIEJBQ08gY2FwYWJpbGl0aWVzIGZyb20gdGhlIHBvd2VycGxheSB0YWJsZS4KClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggYjMyOTFhMTlhNzcxLi5jNDlm
N2E3OGEyZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtNTg5LDYgKzU4OSwy
OCBAQCBzdGF0aWMgaW50IHNvYzE1X2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJfQogfQogCitzdGF0aWMgYm9vbCBzb2MxNV9zdXBwb3J0c19iYWNvKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQoreworCWJvb2wgYmFjb19zdXBwb3J0OworCisJc3dpdGNoIChhZGV2
LT5hc2ljX3R5cGUpIHsKKwljYXNlIENISVBfVkVHQTEwOgorCWNhc2UgQ0hJUF9WRUdBMTI6CisJ
CXNvYzE1X2FzaWNfZ2V0X2JhY29fY2FwYWJpbGl0eShhZGV2LCAmYmFjb19zdXBwb3J0KTsKKwkJ
YnJlYWs7CisJY2FzZSBDSElQX1ZFR0EyMDoKKwkJaWYgKGFkZXYtPnBzcC5zb3NfZndfdmVyc2lv
biA+PSAweDgwMDY3KQorCQkJc29jMTVfYXNpY19nZXRfYmFjb19jYXBhYmlsaXR5KGFkZXYsICZi
YWNvX3N1cHBvcnQpOworCQllbHNlCisJCQliYWNvX3N1cHBvcnQgPSBmYWxzZTsKKwkJYnJlYWs7
CisJZGVmYXVsdDoKKwkJcmV0dXJuIGZhbHNlOworCX0KKworCXJldHVybiBiYWNvX3N1cHBvcnQ7
Cit9CisKIC8qc3RhdGljIGludCBzb2MxNV9zZXRfdXZkX2Nsb2NrKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCB1MzIgY2xvY2ssCiAJCQl1MzIgY250bF9yZWcsIHUzMiBzdGF0dXNfcmVnKQog
ewpAQCAtOTg5LDYgKzEwMTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9hc2ljX2Z1
bmNzIHNvYzE1X2FzaWNfZnVuY3MgPQogCS5nZXRfcGNpZV91c2FnZSA9ICZzb2MxNV9nZXRfcGNp
ZV91c2FnZSwKIAkubmVlZF9yZXNldF9vbl9pbml0ID0gJnNvYzE1X25lZWRfcmVzZXRfb25faW5p
dCwKIAkuZ2V0X3BjaWVfcmVwbGF5X2NvdW50ID0gJnNvYzE1X2dldF9wY2llX3JlcGxheV9jb3Vu
dCwKKwkuc3VwcG9ydHNfYmFjbyA9ICZzb2MxNV9zdXBwb3J0c19iYWNvLAogfTsKIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBhbWRncHVfYXNpY19mdW5jcyB2ZWdhMjBfYXNpY19mdW5jcyA9CkBAIC05
OTcsNiArMTAyMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2FzaWNfZnVuY3MgdmVn
YTIwX2FzaWNfZnVuY3MgPQogCS5yZWFkX2Jpb3NfZnJvbV9yb20gPSAmc29jMTVfcmVhZF9iaW9z
X2Zyb21fcm9tLAogCS5yZWFkX3JlZ2lzdGVyID0gJnNvYzE1X3JlYWRfcmVnaXN0ZXIsCiAJLnJl
c2V0ID0gJnNvYzE1X2FzaWNfcmVzZXQsCisJLnJlc2V0X21ldGhvZCA9ICZzb2MxNV9hc2ljX3Jl
c2V0X21ldGhvZCwKIAkuc2V0X3ZnYV9zdGF0ZSA9ICZzb2MxNV92Z2Ffc2V0X3N0YXRlLAogCS5n
ZXRfeGNsayA9ICZzb2MxNV9nZXRfeGNsaywKIAkuc2V0X3V2ZF9jbG9ja3MgPSAmc29jMTVfc2V0
X3V2ZF9jbG9ja3MsCkBAIC0xMDA5LDcgKzEwMzMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFt
ZGdwdV9hc2ljX2Z1bmNzIHZlZ2EyMF9hc2ljX2Z1bmNzID0KIAkuZ2V0X3BjaWVfdXNhZ2UgPSAm
dmVnYTIwX2dldF9wY2llX3VzYWdlLAogCS5uZWVkX3Jlc2V0X29uX2luaXQgPSAmc29jMTVfbmVl
ZF9yZXNldF9vbl9pbml0LAogCS5nZXRfcGNpZV9yZXBsYXlfY291bnQgPSAmc29jMTVfZ2V0X3Bj
aWVfcmVwbGF5X2NvdW50LAotCS5yZXNldF9tZXRob2QgPSAmc29jMTVfYXNpY19yZXNldF9tZXRo
b2QKKwkuc3VwcG9ydHNfYmFjbyA9ICZzb2MxNV9zdXBwb3J0c19iYWNvLAogfTsKIAogc3RhdGlj
IGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
