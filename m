Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35B7D0132
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 21:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E2C6E898;
	Tue,  8 Oct 2019 19:29:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E74E6E897
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 19:29:45 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id c21so26920245qtj.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 12:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pz4QYGf2Zg3/zjJuUyxphgZOPJNIgCph8DI1FANXOnw=;
 b=ksjULRRkiVxxwsVG2SkjWhw0zGbLk9wCKaVQUu+CwCGqzrQW0hwP2Dqezq2VKUp3io
 ZlrLFhb68PR6/TgEX6bCR7JGMtOVwyT+iLBPfgAExrNPtbRTDJkV+EG3Z4SYbrtTRry9
 L2rnsAYkcWoRVtG5DrWPjg834SsgQqQPckVPuB8/4rws4kf+056440rMiQZFfn0Gq2N6
 IN5zAn1dLaGkXlih7AZNCmpoylpWh+A03Z9Pace2xDA0ful0lrbMU2v5h0EUpGJqp64P
 5NmizPeHA1Keuf/n0Dy7+lS4tD/wdBAoTgWOJ+vWbH6552VoN3FxY3hZetQuuvSPvk/0
 1K1g==
X-Gm-Message-State: APjAAAU576qFyi2+iF2UgyyOIoX6yXEi1qIZaoS9PxboYfWgDrGnf7sc
 Y91NkOQyBZ6FbfQ5buJStYDDXj2n
X-Google-Smtp-Source: APXvYqzZqUDROCYL5fG/cRYQyKkI901MtryGpvbbtKWuLWzV/vQtL01SvpWN8fJ4W6iv9kgZxLyPXA==
X-Received: by 2002:ac8:2f9b:: with SMTP id l27mr13615805qta.235.1570562983976; 
 Tue, 08 Oct 2019 12:29:43 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id z141sm9453272qka.126.2019.10.08.12.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 12:29:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/amdgpu: add a generic fb accessing helper function
Date: Tue,  8 Oct 2019 14:29:28 -0500
Message-Id: <20191008192934.5481-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008192934.5481-1-alexander.deucher@amd.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pz4QYGf2Zg3/zjJuUyxphgZOPJNIgCph8DI1FANXOnw=;
 b=fEIs5F2HMAHVqAizuCs1TE39Nry6M3hmYYMdcNO4BLzJPc9sEtWPL4S1Dpsw3M4O59
 Z4iE3E3M6VPd5TyCd4RM44k8+DVcrgcyAgsxMiiCbohgeMcYssieW3p+UsaqKrvcdFN7
 PB+CBJHpCXRTkTAQ/R8ytjDPERhD1AxMNZRCZzgfbkRWvhAExe8+BZ10llSjs1eCGBJw
 u3FqfQ6L0uMxHY3nG0D/pIIPH53lhiyE28FTAYSID9ab1dNCkHPANCQ8mQ/JWKYOfUc2
 sSanN3HDWrLQVt1GajeUuv2ilzca9qdtC11bef+RNPhyGKe7ccnBhb2kJsspYh+vLhc1
 RYpQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, "Tianci.Yin" <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgphZGQgYSBnZW5lcmljIGhl
bHBlciBmdW5jdGlvbiBmb3IgYWNjZXNzaW5nIGZyYW1lYnVmZmVyIHZpYSBNTUlPCgpDaGFuZ2Ut
SWQ6IEk0YmFhMGFhNTNjOTNhOTRjMmVmZjk4YzYyMTFhNjFmMzY5MjM5OTgyClJldmlld2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IFRpYW5jaS5ZaW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaCAgICAgICAgICAgfCAgMiArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCA0MiArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMgfCAxMyArLS0tLS0KIDMgZmls
ZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCAxN2NjYjkwMTUxNDEuLjBkNjBjMmU2YzU5MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTk4NSw2ICs5ODUsOCBAQCBpbnQgYW1k
Z3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogdm9pZCBhbWRncHVf
ZGV2aWNlX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFtZGdwdV9ncHVf
d2FpdF9mb3JfaWRsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAKK2ludCBhbWRncHVf
ZGV2aWNlX3ZyYW1fYWNjZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBsb2ZmX3QgcG9z
LAorCQkgICAgICAgdWludDMyX3QgKmJ1Ziwgc2l6ZV90IHNpemUsIGJvb2wgd3JpdGUpOwogdWlu
dDMyX3QgYW1kZ3B1X21tX3JyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90
IHJlZywKIAkJCXVpbnQzMl90IGFjY19mbGFncyk7CiB2b2lkIGFtZGdwdV9tbV93cmVnKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcsIHVpbnQzMl90IHYsCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggZjI1Mjc1YWJmNDA4Li41
M2NlMjI3Zjc1OWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKQEAgLTE1Myw2ICsxNTMsNDggQEAgYm9vbCBhbWRncHVfZGV2aWNlX2lzX3B4KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpCiAJcmV0dXJuIGZhbHNlOwogfQogCisvKioKKyAqIFZSQU0gYWNjZXNz
IGhlbHBlciBmdW5jdGlvbnMuCisgKgorICogYW1kZ3B1X2RldmljZV92cmFtX2FjY2VzcyAtIHJl
YWQvd3JpdGUgYSBidWZmZXIgaW4gdnJhbQorICoKKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBv
aW50ZXIKKyAqIEBwb3M6IG9mZnNldCBvZiB0aGUgYnVmZmVyIGluIHZyYW0KKyAqIEBidWY6IHZp
cnR1YWwgYWRkcmVzcyBvZiB0aGUgYnVmZmVyIGluIHN5c3RlbSBtZW1vcnkKKyAqIEBzaXplOiBy
ZWFkL3dyaXRlIHNpemUsIHNpemVvZihAYnVmKSBtdXN0ID4gQHNpemUKKyAqIEB3cml0ZTogdHJ1
ZSAtIHdyaXRlIHRvIHZyYW0sIG90aGVyd2lzZSAtIHJlYWQgZnJvbSB2cmFtCisgKgorICogUmV0
dXJucyAwIG9uIHN1Y2Nlc3Mgb3IgYW4gLWVycm9yIG9uIGZhaWx1cmUuCisgKi8KK2ludCBhbWRn
cHVfZGV2aWNlX3ZyYW1fYWNjZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBsb2ZmX3Qg
cG9zLAorCQkgICAgICAgdWludDMyX3QgKmJ1Ziwgc2l6ZV90IHNpemUsIGJvb2wgd3JpdGUpCit7
CisJdWludDY0X3QgZW5kID0gcG9zICsgc2l6ZTsKKwl1bnNpZ25lZCBsb25nIGZsYWdzOworCisJ
aWYgKElTX0VSUl9PUl9OVUxMKGJ1ZikgfHwKKwkgICAgKGFkZXYtPmdtYy5tY192cmFtX3NpemUg
PiAwICYmCisJICAgICBlbmQgPiBhZGV2LT5nbWMubWNfdnJhbV9zaXplKSkgeworCQlEUk1fRVJS
T1IoInBhcmFtZXRlciBlcnJvciEgcG9zOiVsbHgsIGJ1ZjolbGx4LCBzaXplOiV6eC5cbiIsCisJ
CQkgIHBvcywgKHU2NClidWYsIHNpemUpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwl3aGls
ZSAocG9zIDwgZW5kKSB7CisJCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5tbWlvX2lkeF9sb2Nr
LCBmbGFncyk7CisJCVdSRUczMl9OT19LSVEobW1NTV9JTkRFWCwgKCh1aW50MzJfdClwb3MpIHwg
MHg4MDAwMDAwMCk7CisJCVdSRUczMl9OT19LSVEobW1NTV9JTkRFWF9ISSwgcG9zID4+IDMxKTsK
KwkJaWYgKHdyaXRlKQorCQkJV1JFRzMyX05PX0tJUShtbU1NX0RBVEEsICpidWYrKyk7CisJCWVs
c2UKKwkJCSpidWYrKyA9IFJSRUczMl9OT19LSVEobW1NTV9EQVRBKTsKKwkJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmYWRldi0+bW1pb19pZHhfbG9jaywgZmxhZ3MpOworCQlwb3MgKz0gNDsKKwl9
CisKKwlyZXR1cm4gMDsKK30KKwogLyoKICAqIE1NSU8gcmVnaXN0ZXIgYWNjZXNzIGhlbHBlciBm
dW5jdGlvbnMuCiAgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kaXNjb3ZlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNj
b3ZlcnkuYwppbmRleCBkYjJkYWIzYTZkZmYuLjMyNGMyZDYwNWY1NCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpAQCAtMTM0LDIxICsxMzQsMTAg
QEAgc3RhdGljIGludCBod19pZF9tYXBbTUFYX0hXSVBdID0gewogCiBzdGF0aWMgaW50IGFtZGdw
dV9kaXNjb3ZlcnlfcmVhZF9iaW5hcnkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQ4
X3QgKmJpbmFyeSkKIHsKLQl1aW50MzJfdCAqcCA9ICh1aW50MzJfdCAqKWJpbmFyeTsKIAl1aW50
NjRfdCB2cmFtX3NpemUgPSAodWludDY0X3QpUlJFRzMyKG1tUkNDX0NPTkZJR19NRU1TSVpFKSA8
PCAyMDsKIAl1aW50NjRfdCBwb3MgPSB2cmFtX3NpemUgLSBCSU5BUllfTUFYX1NJWkU7Ci0JdW5z
aWduZWQgbG9uZyBmbGFnczsKLQotCXdoaWxlIChwb3MgPCB2cmFtX3NpemUpIHsKLQkJc3Bpbl9s
b2NrX2lycXNhdmUoJmFkZXYtPm1taW9faWR4X2xvY2ssIGZsYWdzKTsKLQkJV1JFRzMyX05PX0tJ
UShtbU1NX0lOREVYLCAoKHVpbnQzMl90KXBvcykgfCAweDgwMDAwMDAwKTsKLQkJV1JFRzMyX05P
X0tJUShtbU1NX0lOREVYX0hJLCBwb3MgPj4gMzEpOwotCQkqcCsrID0gUlJFRzMyX05PX0tJUSht
bU1NX0RBVEEpOwotCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5tbWlvX2lkeF9sb2Nr
LCBmbGFncyk7Ci0JCXBvcyArPSA0OwotCX0KIAotCXJldHVybiAwOworCXJldHVybiBhbWRncHVf
ZGV2aWNlX3ZyYW1fYWNjZXNzKGFkZXYsIHBvcywgKHVpbnQzMl90ICopYmluYXJ5LCBCSU5BUllf
TUFYX1NJWkUsIGZhbHNlKTsKIH0KIAogc3RhdGljIHVpbnQxNl90IGFtZGdwdV9kaXNjb3Zlcnlf
Y2FsY3VsYXRlX2NoZWNrc3VtKHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNpemUpCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
