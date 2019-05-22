Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7127026429
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 15:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D5089A1A;
	Wed, 22 May 2019 12:59:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEEC89904;
 Wed, 22 May 2019 12:59:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f204so2151475wme.0;
 Wed, 22 May 2019 05:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cuUnCEs6sCylLKrbx0ulSoQvBHMZAAWNV5julbMrEXE=;
 b=gpYCKodO54jUqMb2LExbpTYsZBwRM4Bl70qY+vvda5ricQh+e55ats8sfVqXohhDWH
 E3A23q22nlYUAzbw6YyFh5X46BbT9YNWKcHNyp3Df8313UVhM2FIp2l60qUvKla9VvfB
 enJIX1pfml7UUhMXN9km+CxmvnKQNk5Iv79gqE8mipMmSebjoFwhG93ZkqZUI9av2A2x
 EYwP0jYW1I8fB883Z2fjagQkv+iimZj8VWJ02PS7JovJ3tQRXAvKyC3yHi0oQB/iDPmw
 jjHvRjEc9Km/ZXkjUdj7d/D2DI5ekXW93i+xod1XSzclVWbRLXslS5xl3Jdl66fRrDpR
 0WIQ==
X-Gm-Message-State: APjAAAWVuHcgdEPBiR4WhvuPYHMWdsl5l4nS9+y15FblUukqm91e3bco
 Qu42cs9UiR8ciXm/FeAIdMU=
X-Google-Smtp-Source: APXvYqyk34Z1ONqydoUabwO0FG1e7nebmCVXz3NrWf6yAia89igBW2WA90JWPtMkT/ahaQ4rZTduSA==
X-Received: by 2002:a1c:a904:: with SMTP id s4mr7200288wme.92.1558529993805;
 Wed, 22 May 2019 05:59:53 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b94a:dfe1:fb43:c858])
 by smtp.gmail.com with ESMTPSA id 197sm9723523wma.36.2019.05.22.05.59.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 05:59:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/10] drm/ttm: fix busy memory to fail other user v10
Date: Wed, 22 May 2019 14:59:43 +0200
Message-Id: <20190522125947.4592-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522125947.4592-1-christian.koenig@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cuUnCEs6sCylLKrbx0ulSoQvBHMZAAWNV5julbMrEXE=;
 b=QFw5N3tc2TWGHQ7GQYHEhXUC4kVel6FNWXRQsgChwUkoanVqeEvmspauZ7+h02Actw
 w6lEo0GZDmvbhF9gj/bVBDXz+Oa0ei9ojQ+BDf5kmqRZOVPB7UEPTmqy/eYcf6MzBBIU
 VzAhKQbrN01znFSSvpl0RIluKRT3vbKL2slF212wP9NE+1HIUEtJhuDXlYZVCfGjU9uO
 YjNgYBzOTDN6+QfG9qyQdwk5gdb4DdJhtQoOi20g3KBBJKtvHAcZeXopR35TX3/otYjm
 eYp+zl2iqdd1kQ1JDm4TsHonSDa2ypFANHvW7bW3Q5EjJFm99gekNQXtLPKehAx3M6Ex
 FeJg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Qk9zIG9uIHRoZSBMUlUgbWlnaHQgYmUgYmxvY2tlZCBkdXJpbmcgY29tbWFuZCBzdWJtaXNzaW9u
CmFuZCBjYXVzZSBPT00gc2l0dWF0aW9ucy4KCkF2b2lkIHRoaXMgYnkgYmxvY2tpbmcgZm9yIHRo
ZSBmaXJzdCBidXN5IEJPIG5vdCBsb2NrZWQgYnkKdGhlIHNhbWUgdGlja2V0IGFzIHRoZSBCTyB3
ZSBhcmUgc2VhcmNoaW5nIHNwYWNlIGZvci4KCnYxMDogY29tcGxldGVseSBzdGFydCBvdmVyIHdp
dGggdGhlIHBhdGNoIHNpbmNlIHdlIGRpZG4ndAogICAgIGhhbmRsZWQgYSB3aG9sZSBidW5jaCBv
ZiBjb3JuZXIgY2FzZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDc3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDY2
IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IDRj
NjM4OWQ4NDllZC4uODYxZmFjYWMzM2Q0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTc3MSwzMiAr
NzcxLDcyIEBAIEVYUE9SVF9TWU1CT0wodHRtX2JvX2V2aWN0aW9uX3ZhbHVhYmxlKTsKICAqIGIu
IE90aGVyd2lzZSwgdHJ5bG9jayBpdC4KICAqLwogc3RhdGljIGJvb2wgdHRtX2JvX2V2aWN0X3N3
YXBvdXRfYWxsb3dhYmxlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCi0JCQlzdHJ1Y3Qg
dHRtX29wZXJhdGlvbl9jdHggKmN0eCwgYm9vbCAqbG9ja2VkKQorCQkJc3RydWN0IHR0bV9vcGVy
YXRpb25fY3R4ICpjdHgsIGJvb2wgKmxvY2tlZCwgYm9vbCAqYnVzeSkKIHsKIAlib29sIHJldCA9
IGZhbHNlOwogCi0JKmxvY2tlZCA9IGZhbHNlOwogCWlmIChiby0+cmVzdiA9PSBjdHgtPnJlc3Yp
IHsKIAkJcmVzZXJ2YXRpb25fb2JqZWN0X2Fzc2VydF9oZWxkKGJvLT5yZXN2KTsKIAkJaWYgKGN0
eC0+ZmxhZ3MgJiBUVE1fT1BUX0ZMQUdfQUxMT1dfUkVTX0VWSUNUCiAJCSAgICB8fCAhbGlzdF9l
bXB0eSgmYm8tPmRkZXN0cm95KSkKIAkJCXJldCA9IHRydWU7CisJCSpsb2NrZWQgPSBmYWxzZTsK
KwkJaWYgKGJ1c3kpCisJCQkqYnVzeSA9IGZhbHNlOwogCX0gZWxzZSB7Ci0JCSpsb2NrZWQgPSBy
ZXNlcnZhdGlvbl9vYmplY3RfdHJ5bG9jayhiby0+cmVzdik7Ci0JCXJldCA9ICpsb2NrZWQ7CisJ
CXJldCA9IHJlc2VydmF0aW9uX29iamVjdF90cnlsb2NrKGJvLT5yZXN2KTsKKwkJKmxvY2tlZCA9
IHJldDsKKwkJaWYgKGJ1c3kpCisJCQkqYnVzeSA9ICFyZXQ7CiAJfQogCiAJcmV0dXJuIHJldDsK
IH0KIAorLyoqCisgKiB0dG1fbWVtX2V2aWN0X3dhaXRfYnVzeSAtIHdhaXQgZm9yIGEgYnVzeSBC
TyB0byBiZWNvbWUgYXZhaWxhYmxlCisgKgorICogQGJ1c3lfYm86IEJPIHdoaWNoIGNvdWxkbid0
IGJlIGxvY2tlZCB3aXRoIHRyeWxvY2sKKyAqIEBjdHg6IG9wZXJhdGlvbiBjb250ZXh0CisgKiBA
dGlja2V0OiBhY3F1aXJlIHRpY2tldAorICoKKyAqIFRyeSB0byBsb2NrIGEgYnVzeSBidWZmZXIg
b2JqZWN0IHRvIGF2b2lkIGZhaWxpbmcgZXZpY3Rpb24uCisgKi8KK3N0YXRpYyBpbnQgdHRtX21l
bV9ldmljdF93YWl0X2J1c3koc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpidXN5X2JvLAorCQkJ
CSAgIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAorCQkJCSAgIHN0cnVjdCB3d19hY3F1
aXJlX2N0eCAqdGlja2V0KQoreworCWludCByOworCisJaWYgKCFidXN5X2JvIHx8ICF0aWNrZXQp
CisJCXJldHVybiAtRUJVU1k7CisKKwlpZiAoY3R4LT5pbnRlcnJ1cHRpYmxlKQorCQlyID0gcmVz
ZXJ2YXRpb25fb2JqZWN0X2xvY2tfaW50ZXJydXB0aWJsZShidXN5X2JvLT5yZXN2LAorCQkJCQkJ
CSAgdGlja2V0KTsKKwllbHNlCisJCXIgPSByZXNlcnZhdGlvbl9vYmplY3RfbG9jayhidXN5X2Jv
LT5yZXN2LCB0aWNrZXQpOworCisJLyoKKwkgKiBUT0RPOiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
a2VlcCB0aGUgQk8gbG9ja2VkIHVudGlsIGFsbG9jYXRpb24gaXMgYXQKKwkgKiBsZWFzdCB0cmll
ZCBvbmUgbW9yZSB0aW1lLCBidXQgdGhhdCB3b3VsZCBtZWFuIGEgbXVjaCBsYXJnZXIgcmV3b3Jr
CisJICogb2YgVFRNLgorCSAqLworCWlmICghcikKKwkJcmVzZXJ2YXRpb25fb2JqZWN0X3VubG9j
ayhidXN5X2JvLT5yZXN2KTsKKworCXJldHVybiByID09IC1FREVBRExLID8gLUVBR0FJTiA6IHI7
Cit9CisKIHN0YXRpYyBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwKIAkJCSAgICAgICB1aW50MzJfdCBtZW1fdHlwZSwKIAkJCSAgICAgICBjb25zdCBz
dHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSwKLQkJCSAgICAgICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9j
dHggKmN0eCkKKwkJCSAgICAgICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwKKwkJCSAg
ICAgICBzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKnRpY2tldCkKIHsKKwlzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvID0gTlVMTCwgKmJ1c3lfYm8gPSBOVUxMOwogCXN0cnVjdCB0dG1fYm9fZ2xv
YmFsICpnbG9iID0gYmRldi0+Z2xvYjsKIAlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
biA9ICZiZGV2LT5tYW5bbWVtX3R5cGVdOwotCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8g
PSBOVUxMOwogCWJvb2wgbG9ja2VkID0gZmFsc2U7CiAJdW5zaWduZWQgaTsKIAlpbnQgcmV0OwpA
QCAtODA0LDggKzg0NCwxNSBAQCBzdGF0aWMgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7CiAJZm9y
IChpID0gMDsgaSA8IFRUTV9NQVhfQk9fUFJJT1JJVFk7ICsraSkgewogCQlsaXN0X2Zvcl9lYWNo
X2VudHJ5KGJvLCAmbWFuLT5scnVbaV0sIGxydSkgewotCQkJaWYgKCF0dG1fYm9fZXZpY3Rfc3dh
cG91dF9hbGxvd2FibGUoYm8sIGN0eCwgJmxvY2tlZCkpCisJCQlib29sIGJ1c3k7CisKKwkJCWlm
ICghdHRtX2JvX2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKGJvLCBjdHgsICZsb2NrZWQsCisJCQkJ
CQkJICAgICZidXN5KSkgeworCQkJCWlmIChidXN5ICYmICFidXN5X2JvICYmCisJCQkJICAgIGJv
LT5yZXN2LT5sb2NrLmN0eCAhPSB0aWNrZXQpCisJCQkJCWJ1c3lfYm8gPSBibzsKIAkJCQljb250
aW51ZTsKKwkJCX0KIAogCQkJaWYgKHBsYWNlICYmICFiZGV2LT5kcml2ZXItPmV2aWN0aW9uX3Zh
bHVhYmxlKGJvLAogCQkJCQkJCQkgICAgICBwbGFjZSkpIHsKQEAgLTgyNCw4ICs4NzEsMTMgQEAg
c3RhdGljIGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2
LAogCX0KIAogCWlmICghYm8pIHsKKwkJaWYgKGJ1c3lfYm8pCisJCQl0dG1fYm9fZ2V0KGJ1c3lf
Ym8pOwogCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOwotCQlyZXR1cm4gLUVCVVNZOwor
CQlyZXQgPSB0dG1fbWVtX2V2aWN0X3dhaXRfYnVzeShidXN5X2JvLCBjdHgsIHRpY2tldCk7CisJ
CWlmIChidXN5X2JvKQorCQkJdHRtX2JvX3B1dChidXN5X2JvKTsKKwkJcmV0dXJuIHJldDsKIAl9
CiAKIAlrcmVmX2dldCgmYm8tPmxpc3Rfa3JlZik7CkBAIC05MTEsNyArOTYzLDggQEAgc3RhdGlj
IGludCB0dG1fYm9fbWVtX2ZvcmNlX3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
CiAJCQlyZXR1cm4gcmV0OwogCQlpZiAobWVtLT5tbV9ub2RlKQogCQkJYnJlYWs7Ci0JCXJldCA9
IHR0bV9tZW1fZXZpY3RfZmlyc3QoYmRldiwgbWVtLT5tZW1fdHlwZSwgcGxhY2UsIGN0eCk7CisJ
CXJldCA9IHR0bV9tZW1fZXZpY3RfZmlyc3QoYmRldiwgbWVtLT5tZW1fdHlwZSwgcGxhY2UsIGN0
eCwKKwkJCQkJICBiby0+cmVzdi0+bG9jay5jdHgpOwogCQlpZiAodW5saWtlbHkocmV0ICE9IDAp
KQogCQkJcmV0dXJuIHJldDsKIAl9IHdoaWxlICgxKTsKQEAgLTE0MjYsNyArMTQ3OSw4IEBAIHN0
YXRpYyBpbnQgdHRtX2JvX2ZvcmNlX2xpc3RfY2xlYW4oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJk
ZXYsCiAJZm9yIChpID0gMDsgaSA8IFRUTV9NQVhfQk9fUFJJT1JJVFk7ICsraSkgewogCQl3aGls
ZSAoIWxpc3RfZW1wdHkoJm1hbi0+bHJ1W2ldKSkgewogCQkJc3Bpbl91bmxvY2soJmdsb2ItPmxy
dV9sb2NrKTsKLQkJCXJldCA9IHR0bV9tZW1fZXZpY3RfZmlyc3QoYmRldiwgbWVtX3R5cGUsIE5V
TEwsICZjdHgpOworCQkJcmV0ID0gdHRtX21lbV9ldmljdF9maXJzdChiZGV2LCBtZW1fdHlwZSwg
TlVMTCwgJmN0eCwKKwkJCQkJCSAgTlVMTCk7CiAJCQlpZiAocmV0KQogCQkJCXJldHVybiByZXQ7
CiAJCQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsKQEAgLTE3OTcsNyArMTg1MSw4IEBAIGlu
dCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiwgc3RydWN0IHR0bV9v
cGVyYXRpb25fY3R4ICpjdHgpCiAJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7CiAJZm9yIChp
ID0gMDsgaSA8IFRUTV9NQVhfQk9fUFJJT1JJVFk7ICsraSkgewogCQlsaXN0X2Zvcl9lYWNoX2Vu
dHJ5KGJvLCAmZ2xvYi0+c3dhcF9scnVbaV0sIHN3YXApIHsKLQkJCWlmICh0dG1fYm9fZXZpY3Rf
c3dhcG91dF9hbGxvd2FibGUoYm8sIGN0eCwgJmxvY2tlZCkpIHsKKwkJCWlmICh0dG1fYm9fZXZp
Y3Rfc3dhcG91dF9hbGxvd2FibGUoYm8sIGN0eCwgJmxvY2tlZCwKKwkJCQkJCQkgICBOVUxMKSkg
ewogCQkJCXJldCA9IDA7CiAJCQkJYnJlYWs7CiAJCQl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
