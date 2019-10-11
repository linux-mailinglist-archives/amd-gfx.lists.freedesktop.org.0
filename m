Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0323FD3748
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829CF6EB9E;
	Fri, 11 Oct 2019 01:46:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921A86EB94
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:55 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 3so11701787qta.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zxRtpQw8Vk+9QvI2wNbrxSfg35xXDap+BmqYPXH8u8=;
 b=LAEpc1kLYEPY0jWoFfnvNwSux1j/akR6pJtSPacJiIqR3tcNh7/Inh5KZTCQJ5lYnL
 64ww6/+ig7yVPHl5hJMWoCISehiU1hk/b1NitB7RUlo/rAGtri9eBcacTjE+CTJjYwni
 UZsz62l/vgeGNAj8AHHnci14S7t4/u2dgAfJAolhgCtJO4/VBv3oCLYiDUq21gh99pZP
 7by8cE+ni/eFISpLngSb4rAenGGwSM2MdDVysn8Ewis777UTU1cP0554TZ+VaSCHjxtm
 MHnGhElc0oxvXt7i3kR0DHqF7oRX9wxUIjnqogfw+gqJZ8sfXIIOa4Wq4LMtRucr+45f
 b1Sg==
X-Gm-Message-State: APjAAAUMsOUSkBPSvGZ/5V2HsMDKO3k37fz3Z5O3RHFx9DmJ/4QWQc2k
 bWLByQGedFb5eK1PLn98AoPopT0q
X-Google-Smtp-Source: APXvYqxCl7QzkwDX/5hZBTLRFusSpyM7pwXjj/bCptl5vTaiCLcvH1xMVJRsyaRxJ3SKyCGX4INXwA==
X-Received: by 2002:ac8:6146:: with SMTP id d6mr14322058qtm.271.1570758354475; 
 Thu, 10 Oct 2019 18:45:54 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 09/19] drm/amdgpu: add additional boco checks to runtime
 suspend/resume
Date: Thu, 10 Oct 2019 20:45:26 -0500
Message-Id: <20191011014536.10869-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7zxRtpQw8Vk+9QvI2wNbrxSfg35xXDap+BmqYPXH8u8=;
 b=NtHxtxtal51J71V6v0Tikk2TGKRilFZtZIS0CQpOhN8QJqnBVEfKaTKMpfUZEx42rc
 p04Q7IuP1ZEA2JLibdE7C8B3krYLze72aOaBqi4RbFc6I/Yn3gzfuz5IvhppHKJdv2bK
 3yj4SZfQqfcwHV5lIQP/WBFgbgBhL/5cuoKk7u9tE+uFgvC2VnJ6DJ5Ow470cjcCHIQz
 4HiGYHgtn9UzIhEbsgDBfGRZ+gdiWYimFJbnUixq9Vu5RHSG+7O3FiARjVTvVqdD6ZUl
 rEpGwQ6atkl0L4PQIcz6ndlUaGHStw2FHsCMrPxtK35PCfoNtQvHDv3RBkmQLpBmtx2K
 K5Tw==
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

V2Ugd2lsbCB0YWtlIHNsaWdodGx5IGRpZmZlcmVudCBwYXRocyBmb3IgYm9jbyBhbmQgYmFjby4K
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCA0NiArKysrKysr
KysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMjAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4
IGJkMjJmMGNlNGQ0Ny4uMTk5YjI0MDgxMWRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jCkBAIC0xMTU5LDE4ICsxMTU5LDIxIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Bt
b3BzX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldHVybiAtRUJVU1k7
CiAJfQogCi0JZHJtX2Rldi0+c3dpdGNoX3Bvd2VyX3N0YXRlID0gRFJNX1NXSVRDSF9QT1dFUl9D
SEFOR0lORzsKKwlpZiAoYW1kZ3B1X2RldmljZV9zdXBwb3J0c19ib2NvKGRybV9kZXYpKQorCQlk
cm1fZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX0NIQU5HSU5HOwog
CWRybV9rbXNfaGVscGVyX3BvbGxfZGlzYWJsZShkcm1fZGV2KTsKIAogCXJldCA9IGFtZGdwdV9k
ZXZpY2Vfc3VzcGVuZChkcm1fZGV2LCBmYWxzZSwgZmFsc2UpOwotCXBjaV9zYXZlX3N0YXRlKHBk
ZXYpOwotCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKLQlwY2lfaWdub3JlX2hvdHBsdWcocGRl
dik7Ci0JaWYgKGFtZGdwdV9pc19hdHB4X2h5YnJpZCgpKQotCQlwY2lfc2V0X3Bvd2VyX3N0YXRl
KHBkZXYsIFBDSV9EM2NvbGQpOwotCWVsc2UgaWYgKCFhbWRncHVfaGFzX2F0cHhfZGdwdV9wb3dl
cl9jbnRsKCkpCi0JCXBjaV9zZXRfcG93ZXJfc3RhdGUocGRldiwgUENJX0QzaG90KTsKLQlkcm1f
ZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX0RZTkFNSUNfT0ZGOwor
CWlmIChhbWRncHVfZGV2aWNlX3N1cHBvcnRzX2JvY28oZHJtX2RldikpIHsKKwkJcGNpX3NhdmVf
c3RhdGUocGRldik7CisJCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKKwkJcGNpX2lnbm9yZV9o
b3RwbHVnKHBkZXYpOworCQlpZiAoYW1kZ3B1X2lzX2F0cHhfaHlicmlkKCkpCisJCQlwY2lfc2V0
X3Bvd2VyX3N0YXRlKHBkZXYsIFBDSV9EM2NvbGQpOworCQllbHNlIGlmICghYW1kZ3B1X2hhc19h
dHB4X2RncHVfcG93ZXJfY250bCgpKQorCQkJcGNpX3NldF9wb3dlcl9zdGF0ZShwZGV2LCBQQ0lf
RDNob3QpOworCQlkcm1fZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VS
X0RZTkFNSUNfT0ZGOworCX0KIAogCXJldHVybiAwOwogfQpAQCAtMTE4NCwyMCArMTE4NywyMyBA
QCBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpCiAJaWYgKCFhbWRncHVfZGV2aWNlX3N1cHBvcnRzX2JvY28oZHJtX2RldikpCiAJCXJldHVy
biAtRUlOVkFMOwogCi0JZHJtX2Rldi0+c3dpdGNoX3Bvd2VyX3N0YXRlID0gRFJNX1NXSVRDSF9Q
T1dFUl9DSEFOR0lORzsKLQotCWlmIChhbWRncHVfaXNfYXRweF9oeWJyaWQoKSB8fAotCSAgICAh
YW1kZ3B1X2hhc19hdHB4X2RncHVfcG93ZXJfY250bCgpKQotCQlwY2lfc2V0X3Bvd2VyX3N0YXRl
KHBkZXYsIFBDSV9EMCk7Ci0JcGNpX3Jlc3RvcmVfc3RhdGUocGRldik7Ci0JcmV0ID0gcGNpX2Vu
YWJsZV9kZXZpY2UocGRldik7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKLQlwY2lfc2V0X21h
c3RlcihwZGV2KTsKKwlpZiAoYW1kZ3B1X2RldmljZV9zdXBwb3J0c19ib2NvKGRybV9kZXYpKQor
CQlkcm1fZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX0NIQU5HSU5H
OwogCisJaWYgKGFtZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYm9jbyhkcm1fZGV2KSkgeworCQlpZiAo
YW1kZ3B1X2lzX2F0cHhfaHlicmlkKCkgfHwKKwkJICAgICFhbWRncHVfaGFzX2F0cHhfZGdwdV9w
b3dlcl9jbnRsKCkpCisJCQlwY2lfc2V0X3Bvd2VyX3N0YXRlKHBkZXYsIFBDSV9EMCk7CisJCXBj
aV9yZXN0b3JlX3N0YXRlKHBkZXYpOworCQlyZXQgPSBwY2lfZW5hYmxlX2RldmljZShwZGV2KTsK
KwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJCXBjaV9zZXRfbWFzdGVyKHBkZXYpOworCX0K
IAlyZXQgPSBhbWRncHVfZGV2aWNlX3Jlc3VtZShkcm1fZGV2LCBmYWxzZSwgZmFsc2UpOwogCWRy
bV9rbXNfaGVscGVyX3BvbGxfZW5hYmxlKGRybV9kZXYpOwotCWRybV9kZXYtPnN3aXRjaF9wb3dl
cl9zdGF0ZSA9IERSTV9TV0lUQ0hfUE9XRVJfT047CisJaWYgKGFtZGdwdV9kZXZpY2Vfc3VwcG9y
dHNfYm9jbyhkcm1fZGV2KSkKKwkJZHJtX2Rldi0+c3dpdGNoX3Bvd2VyX3N0YXRlID0gRFJNX1NX
SVRDSF9QT1dFUl9PTjsKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
