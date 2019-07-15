Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA669E55
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4346E027;
	Mon, 15 Jul 2019 21:26:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28706E037
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:26:07 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so17250463qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7j0i7HPYqnZhcb5DVabi9urba5s0dIIxzuLI3ZAwpiU=;
 b=ntK56qRLgXhpfWSBqvHkwy5h0KGv6kvHGSzXRN7tHgdJvUFN8A2ZKobUVRf4jQjqdU
 mUkaBkSxEFOzBvWwB+l2a9cmmpMIHuJ6OPTAJKMsWIrLjMTbu0MoFg21vb8foLahOZYw
 XMdgBj+EHJiqDe/C25os894/T6qxXBJozrBbBUzwPCb199fo2NMs3jR6H+pMPYwlOwan
 8IsHel+Rrubvo2jptaOv7nouzAnnzWPIE7rItWD2IUbhA+/ht9Opga34Pkv1kmj97Ohq
 3HAyGgc/8boix3DjeY+t/4FNpQA7g2/dQZ3riGXce+IOPv2xR4V01caKNJngen9C90to
 I9Ew==
X-Gm-Message-State: APjAAAVmLYqP60uLrIDQ/CBq+ywEOQOyhn2EXIZCWDbnt0EMQHDN1RkU
 xPwb0b+so7CGpA/F+cooslAnGXgu
X-Google-Smtp-Source: APXvYqwCBei4jEPh63D2vEID2KuiaA30il+KjWvOLYGTZXciZro7lEuZLKyktAZus5XdmLxqSLKmtw==
X-Received: by 2002:a0c:acef:: with SMTP id n44mr21235592qvc.39.1563225966556; 
 Mon, 15 Jul 2019 14:26:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.26.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:26:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 089/102] drm/amdgpu: init gds config for arct
Date: Mon, 15 Jul 2019 16:24:24 -0500
Message-Id: <20190715212437.31793-87-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7j0i7HPYqnZhcb5DVabi9urba5s0dIIxzuLI3ZAwpiU=;
 b=VH4utl3yYRCbq2dIqzRy6rO8F5bAoFPTklfrzHTdulLjQSRzOr+reDxGsxs9g9QP+Z
 Ie+Tj5jja24B5Qfpm/VwmsT8e4Lci7XodFjgtorrVXrFgtcPNPD1PSoeXnhHUzgx2sSO
 kQ5yavIeYC5VJo4j3gFv94Jw6tBAizcaJWkRv9L5ycG69m58nNInMcxSFq185Z5E+lHV
 NCTWnwxxJNcqEj4df7Ja2qUDZI/GFj0zf6jKQfAeAPq+oIECCJ61zfdWgqzAu+O/3E2Q
 EHxpl7eVCm4h7DOVHDS9dRG//vQaCefb+wljoh0bhaZ/GHPxmn6uFTvlTg1SbGKqnHxM
 FKBw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKYXJjdCBoYXMgNEtC
IGdkcyAoNCBiYW5rcyBpbnNpZGUpLiB0aGVyZSBhcmUgMzIgKiAxMjggKENVcykKc28gdGhlIG1h
eF93YXZlX2lkIHNob3VsZCBiZSAweGZmZgoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8
SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogTGUgTWEgPExlLk1hQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMKaW5kZXggNTYwZTYwN2U3MDQ5Li4yZjU1MzU5NWE4OTggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtNTQ4Miw2ICs1NDgyLDcgQEAgc3RhdGljIHZvaWQgZ2Z4
X3Y5XzBfc2V0X2dkc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlhZGV2LT5n
ZHMuZ2RzX3NpemUgPSAweDEwMDAwOwogCQlicmVhazsKIAljYXNlIENISVBfUkFWRU46CisJY2Fz
ZSBDSElQX0FSQ1RVUlVTOgogCQlhZGV2LT5nZHMuZ2RzX3NpemUgPSAweDEwMDA7CiAJCWJyZWFr
OwogCWRlZmF1bHQ6CkBAIC01NTAzLDYgKzU1MDQsOSBAQCBzdGF0aWMgdm9pZCBnZnhfdjlfMF9z
ZXRfZ2RzX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWVsc2UKIAkJCWFkZXYt
Pmdkcy5nZHNfY29tcHV0ZV9tYXhfd2F2ZV9pZCA9IDB4MTVmOyAvKiByYXZlbjEgKi8KIAkJYnJl
YWs7CisJY2FzZSBDSElQX0FSQ1RVUlVTOgorCQlhZGV2LT5nZHMuZ2RzX2NvbXB1dGVfbWF4X3dh
dmVfaWQgPSAweGZmZjsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJLyogdGhpcyByZWFsbHkgZGVw
ZW5kcyBvbiB0aGUgY2hpcCAqLwogCQlhZGV2LT5nZHMuZ2RzX2NvbXB1dGVfbWF4X3dhdmVfaWQg
PSAweDdmZjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
