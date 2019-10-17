Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F17CDB15F
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 17:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB07B6EAC1;
	Thu, 17 Oct 2019 15:45:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8647B6EAC1
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 15:45:06 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u184so2312887qkd.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 08:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FVxrsPXpBNz3vE56tAiF8r4FZb53CMY9iBZ1eOezyVg=;
 b=KxKYHuCHoB2WllxtJB7n7LYoPXDBcW6EO9jW6k9L6//lOsKbS7n+LyN4o5/FJC4XOm
 WhRbBpFae5xnYpDdVRvDoPtg6aWqjVAPIIFai+OKcYSp/XIZ4P7MnCn6wBZKiae/VHgS
 Ji/uP0p+AEsU9TTI+kQjbodwJJC+dsT8iTMfw26/wLPK3M3FocMpHmjHc0sezpwZytWz
 k3MypjZG/95H3P6coX1rpriPvb23LVAGYxEIgisIqIQYJDH9Ew/mANnrLAvubSj7u+he
 s8sIX6CrLcrcoI9mZadVyGW3zi9YxATLK/bvqEKt3yN4pinqQlGpJa//TWzXNYM4RNrA
 Nfrg==
X-Gm-Message-State: APjAAAVJcALtEfOoOgMUMn+QGuWGDD6iiT/FJbDQxwtU/YevAyQf/v8U
 0S8HziubojZvLSDCFwLB5xoAUQII
X-Google-Smtp-Source: APXvYqya/jzPHhQyJe0Ng2w4iJmOLNXsv4Y+FJo5oGV/u69twQH/q/8Ms86ByGGfezGWo1Mi2ZXYEw==
X-Received: by 2002:a37:5f46:: with SMTP id t67mr3808373qkb.220.1571327105246; 
 Thu, 17 Oct 2019 08:45:05 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p22sm986837qkk.92.2019.10.17.08.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 08:45:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/vce: make some functions static
Date: Thu, 17 Oct 2019 11:44:56 -0400
Message-Id: <20191017154456.335015-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017154456.335015-1-alexander.deucher@amd.com>
References: <20191017154456.335015-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FVxrsPXpBNz3vE56tAiF8r4FZb53CMY9iBZ1eOezyVg=;
 b=EufVujHw6dhUn3b2BXK7p+pwng3+r4YolzzMUDalEPYr8xXUupv6sv7udes99B7GZl
 EI+wnCnlHlQ7nFeoOkbBiEwY/TFKzroC2/Ke8rCp4rzz+RLljzIZvdv0bKlGWjf1DsNk
 xHy0Bd5ff3kkz+01xEP2SCtepK5EcEE1SNnEmnRGud7Pl6W2po3e/SrG4oxC2rjBPhNG
 Pd6LQJPH2J9vFmo8wslmP03zyf2TGDLBHmnZvbCvywHvz3/JUotd0NV5wnPqPxLbGxE9
 DWLPk4PpUoAVaZaZR0cvQPLbfSff/0xiO0Y2Vae53gIIKjbiR+o/ekSPlDqvnrc/WMWH
 XvXQ==
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

VGhleSBhcmUgbm90IHVzZWQgb3V0c2lkZSBvZiB0aGUgZmlsZSB0aGV5IGFyZSBkZWZpbmVkIGlu
LgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYyB8IDE1ICsrKysr
KysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5oIHwgIDUg
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jCmluZGV4IDY1MDQ0YjFiM2Q0
Yy4uNzAzNjc3ZjJmZjZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5j
CkBAIC04MCw2ICs4MCwxMSBAQCBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVfVkVHQTEyKTsKIE1P
RFVMRV9GSVJNV0FSRShGSVJNV0FSRV9WRUdBMjApOwogCiBzdGF0aWMgdm9pZCBhbWRncHVfdmNl
X2lkbGVfd29ya19oYW5kbGVyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7CitzdGF0aWMgaW50
IGFtZGdwdV92Y2VfZ2V0X2NyZWF0ZV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50
MzJfdCBoYW5kbGUsCisJCQkJICAgICBzdHJ1Y3QgYW1kZ3B1X2JvICpibywKKwkJCQkgICAgIHN0
cnVjdCBkbWFfZmVuY2UgKipmZW5jZSk7CitzdGF0aWMgaW50IGFtZGdwdV92Y2VfZ2V0X2Rlc3Ry
b3lfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgaGFuZGxlLAorCQkJCSAg
ICAgIGJvb2wgZGlyZWN0LCBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpOwogCiAvKioKICAqIGFt
ZGdwdV92Y2VfaW5pdCAtIGFsbG9jYXRlIG1lbW9yeSwgbG9hZCB2Y2UgZmlybXdhcmUKQEAgLTQy
OCw5ICs0MzMsOSBAQCB2b2lkIGFtZGdwdV92Y2VfZnJlZV9oYW5kbGVzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApCiAgKgogICogT3BlbiB1cCBhIHN0
cmVhbSBmb3IgSFcgdGVzdAogICovCi1pbnQgYW1kZ3B1X3ZjZV9nZXRfY3JlYXRlX21zZyhzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZSwKLQkJCSAgICAgIHN0cnVjdCBh
bWRncHVfYm8gKmJvLAotCQkJICAgICAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKQorc3RhdGlj
IGludCBhbWRncHVfdmNlX2dldF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywg
dWludDMyX3QgaGFuZGxlLAorCQkJCSAgICAgc3RydWN0IGFtZGdwdV9ibyAqYm8sCisJCQkJICAg
ICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpCiB7CiAJY29uc3QgdW5zaWduZWQgaWJfc2l6ZV9k
dyA9IDEwMjQ7CiAJc3RydWN0IGFtZGdwdV9qb2IgKmpvYjsKQEAgLTUwOCw4ICs1MTMsOCBAQCBp
bnQgYW1kZ3B1X3ZjZV9nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVp
bnQzMl90IGhhbmRsZSwKICAqCiAgKiBDbG9zZSB1cCBhIHN0cmVhbSBmb3IgSFcgdGVzdCBvciBp
ZiB1c2Vyc3BhY2UgZmFpbGVkIHRvIGRvIHNvCiAgKi8KLWludCBhbWRncHVfdmNlX2dldF9kZXN0
cm95X21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZSwKLQkJCSAg
ICAgICBib29sIGRpcmVjdCwgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKQorc3RhdGljIGludCBh
bWRncHVfdmNlX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQz
Ml90IGhhbmRsZSwKKwkJCQkgICAgICBib29sIGRpcmVjdCwgc3RydWN0IGRtYV9mZW5jZSAqKmZl
bmNlKQogewogCWNvbnN0IHVuc2lnbmVkIGliX3NpemVfZHcgPSAxMDI0OwogCXN0cnVjdCBhbWRn
cHVfam9iICpqb2I7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmgKaW5kZXgg
ZTgwMmY3ZDlkYjBhLi5kNmQ4M2EzZWM4MDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92Y2UuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmNlLmgKQEAgLTU4LDExICs1OCw2IEBAIGludCBhbWRncHVfdmNlX3N3X2Zpbmkoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFtZGdwdV92Y2VfZW50aXR5X2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50IGFtZGdwdV92Y2Vfc3VzcGVuZChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7CiBpbnQgYW1kZ3B1X3ZjZV9yZXN1bWUoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpOwotaW50IGFtZGdwdV92Y2VfZ2V0X2NyZWF0ZV9tc2coc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUsCi0JCQkgICAgICBzdHJ1Y3QgYW1kZ3B1
X2JvICpibywKLQkJCSAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSk7Ci1pbnQgYW1kZ3B1
X3ZjZV9nZXRfZGVzdHJveV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBo
YW5kbGUsCi0JCQkgICAgICAgYm9vbCBkaXJlY3QsIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSk7
CiB2b2lkIGFtZGdwdV92Y2VfZnJlZV9oYW5kbGVzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHApOwogaW50IGFtZGdwdV92Y2VfcmluZ19wYXJzZV9jcyhz
dHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwgdWludDMyX3QgaWJfaWR4KTsKIGludCBhbWRncHVf
dmNlX3JpbmdfcGFyc2VfY3Nfdm0oc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsIHVpbnQzMl90
IGliX2lkeCk7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
