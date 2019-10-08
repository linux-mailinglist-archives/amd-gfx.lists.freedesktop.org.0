Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437ED0137
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 21:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9516E8A0;
	Tue,  8 Oct 2019 19:29:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBF16E89C
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 19:29:51 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id y189so17943890qkc.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 12:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lWFnQIdA8UjB0v1T0h8LC86uAJE7EWGgplfAKPs20so=;
 b=RgePGNhe4L5AhnBo/zh7gwok0jd8bwEeKGuRPdDOrAE8DiKnur4VI+zOdYL9959kl8
 dk5NXXDoyRTJsuBT+6rjhazWkQf8kt1ocbLqOIZRgp11+IN1HNiQzgyBQy3ZucCwptF+
 oE9+0OFZFeMgsJbjmdN0etNSr/u9K0+Vc58ulGBN/eELydR09EamIMCjrbIfok/cd5bQ
 b2D3xe4uHWuLmEAJls1W0/hjFs0zqSwgXHyfycWzuCdr1qzZ7kKGC3A57UMcUpQyrOMa
 QPevZmtCJptS4ErgI+ckBYjcClGfTCuX13QXcSLvlLn8p49CEvVVwrlvs5IeUH0k5gqy
 /l8w==
X-Gm-Message-State: APjAAAWwnuZPLau2zvlzYaLda3tzuM9dWNUoHtjLMOEwuEr6IeWU6VGA
 G/36JehGANfpzM50tDiF502ZwB9t
X-Google-Smtp-Source: APXvYqyBlrFDgMI7rwTZeB194T6ClOYlMIfxGBkJqq9VwaER5VUliqEDxf4fCHOqNA0hdza5ho/bkw==
X-Received: by 2002:a37:a409:: with SMTP id n9mr9057748qke.485.1570562990524; 
 Tue, 08 Oct 2019 12:29:50 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id z141sm9453272qka.126.2019.10.08.12.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 12:29:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Date: Tue,  8 Oct 2019 14:29:33 -0500
Message-Id: <20191008192934.5481-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008192934.5481-1-alexander.deucher@amd.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lWFnQIdA8UjB0v1T0h8LC86uAJE7EWGgplfAKPs20so=;
 b=bXtADH0Lr6PbealpNrl3kHrcs66PAg00vOD/0voBLHD2uvAXe0rVNjkdHgqSCiGkV+
 7WzzAe6uuXqpW3AZfbVor/QhqPAMsdzVXJH2euEjOCen863LtRGOx/eqtdG0aQELd/i5
 JWapWNig3/hEQ6r3odcoYeZSt2C1qv43FctGeQe0CnQlAtW8z2OVdDKh/nbpy4mO2aUz
 aqmbiwN//nK3x5QB2NVm+HBNs1Cz3/3jmd7JEhN4WbunSmcwpm4CF7ABD2bUUOhPjuNm
 V8JN1hbmcYv0+AlDBR36nzeLWPAfy9x7woLt0uoR9T3LmRvux2LyM5CNw3aKwHp+9fyi
 ttBA==
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

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgptZW1vcnkgdHJhaW5pbmcg
dXNpbmcgc3BlY2lmaWMgZml4ZWQgdnJhbSBzZWdtZW50LCByZXNlcnZlIHRoZXNlCnNlZ21lbnRz
IGJlZm9yZSBhbnlvbmUgbWF5IGFsbG9jYXRlIGl0LgoKQ2hhbmdlLUlkOiBJMTQzNjc1NTgxM2E1
NjU2MDhhMjg1N2E2ODNmNTM1Mzc3NjIwYTYzNwpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaWFuY2kuWWluIDx0aWFu
Y2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDk2IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXgg
NzRhOWJkOTRmMTBjLi4wODE5NzIxYWYxNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMKQEAgLTE2NjcsNiArMTY2Nyw5MyBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1f
ZndfcmVzZXJ2ZV92cmFtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQkJCSAg
JmFkZXYtPmZ3X3ZyYW1fdXNhZ2UudmEpOwogfQogCisvKgorICogTWVtb3kgdHJhaW5pbmcgcmVz
ZXJ2YXRpb24gZnVuY3Rpb25zCisgKi8KKy8qKgorICogYW1kZ3B1X3R0bV90cmFpbmluZ19yZXNl
cnZlX3ZyYW1fZmluaSAtIGZyZWUgbWVtb3J5IHRyYWluaW5nIHJlc2VydmVkIHZyYW0KKyAqCisg
KiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCisgKgorICogZnJlZSBtZW1vcnkgdHJhaW5p
bmcgcmVzZXJ2ZWQgdnJhbSBpZiBpdCBoYXMgYmVlbiByZXNlcnZlZC4KKyAqLworc3RhdGljIGlu
dCBhbWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9maW5pKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQoreworCWludCByZXQgPSAwOworCXN0cnVjdCBwc3BfbWVtb3J5X3RyYWluaW5n
X2NvbnRleHQgKmN0eCA9ICZhZGV2LT5wc3AubWVtX3RyYWluX2N0eDsKKworCWN0eC0+aW5pdCA9
IFBTUF9NRU1fVFJBSU5fTk9UX1NVUFBPUlQ7CisJaWYoY3R4LT5jMnBfYm8pIHsKKwkJYW1kZ3B1
X2JvX2ZyZWVfa2VybmVsKCZjdHgtPmMycF9ibywgTlVMTCwgTlVMTCk7CisJCWN0eC0+YzJwX2Jv
ID0gTlVMTDsKKwl9CisJaWYoY3R4LT5wMmNfYm8pIHsKKwkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVs
KCZjdHgtPnAyY19ibywgTlVMTCwgTlVMTCk7CisJCWN0eC0+cDJjX2JvID0gTlVMTDsKKwl9CisK
KwlyZXR1cm4gcmV0OworfQorCisvKioKKyAqIGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92
cmFtX2luaXQgLSBjcmVhdGUgYm8gdnJhbSByZXNlcnZhdGlvbiBmcm9tIG1lbW9yeSB0cmFpbmlu
ZworICoKKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqCisgKiBjcmVhdGUgYm8g
dnJhbSByZXNlcnZhdGlvbiBmcm9tIG1lbW9yeSB0cmFpbmluZy4KKyAqLworc3RhdGljIGludCBh
bWRncHVfdHRtX3RyYWluaW5nX3Jlc2VydmVfdnJhbV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQoreworCWludCByZXQgPSAwOworCXN0cnVjdCBwc3BfbWVtb3J5X3RyYWluaW5nX2Nv
bnRleHQgKmN0eCA9ICZhZGV2LT5wc3AubWVtX3RyYWluX2N0eDsKKworCW1lbXNldChjdHgsIDAs
IHNpemVvZigqY3R4KSk7CisJaWYoIWFkZXYtPmZ3X3ZyYW1fdXNhZ2UubWVtX3RyYWluX3N1cHBv
cnQpIHsKKwkJRFJNX0RFQlVHKCJtZW1vcnkgdHJhaW5pbmcgZG9lcyBub3Qgc3VwcG9ydCFcbiIp
OworCQlyZXR1cm4gMDsKKwl9CisKKwljdHgtPmMycF90cmFpbl9kYXRhX29mZnNldCA9IGFkZXYt
PmZ3X3ZyYW1fdXNhZ2UubWVtX3RyYWluX2ZiX2xvYzsKKwljdHgtPnAyY190cmFpbl9kYXRhX29m
ZnNldCA9IChhZGV2LT5nbWMubWNfdnJhbV9zaXplIC0gR0REUjZfTUVNX1RSQUlOSU5HX09GRlNF
VCk7CisJY3R4LT50cmFpbl9kYXRhX3NpemUgPSBHRERSNl9NRU1fVFJBSU5JTkdfREFUQV9TSVpF
X0lOX0JZVEVTOworCisJRFJNX0RFQlVHKCJ0cmFpbl9kYXRhX3NpemU6JWxseCxwMmNfdHJhaW5f
ZGF0YV9vZmZzZXQ6JWxseCxjMnBfdHJhaW5fZGF0YV9vZmZzZXQ6JWxseC5cbiIsCisJCSAgY3R4
LT50cmFpbl9kYXRhX3NpemUsCisJCSAgY3R4LT5wMmNfdHJhaW5fZGF0YV9vZmZzZXQsCisJCSAg
Y3R4LT5jMnBfdHJhaW5fZGF0YV9vZmZzZXQpOworCisJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9r
ZXJuZWxfYXQoYWRldiwKKwkJCQkJIGN0eC0+cDJjX3RyYWluX2RhdGFfb2Zmc2V0LAorCQkJCQkg
Y3R4LT50cmFpbl9kYXRhX3NpemUsCisJCQkJCSBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAorCQkJ
CQkgJmN0eC0+cDJjX2JvLAorCQkJCQkgTlVMTCk7CisJaWYocmV0KSB7CisJCURSTV9FUlJPUigi
YWxsb2MgcDJjX2JvIGZhaWxlZCglZCkhXG4iLCByZXQpOworCQlyZXQgPSAtRU5PTUVNOworCQln
b3RvIGVycl9vdXQ7CisJfQorCisJcmV0ID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRl
diwKKwkJCQkJIGN0eC0+YzJwX3RyYWluX2RhdGFfb2Zmc2V0LAorCQkJCQkgY3R4LT50cmFpbl9k
YXRhX3NpemUsCisJCQkJCSBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLAorCQkJCQkgJmN0eC0+YzJw
X2JvLAorCQkJCQkgTlVMTCk7CisJaWYocmV0KSB7CisJCURSTV9FUlJPUigiYWxsb2MgYzJwX2Jv
IGZhaWxlZCglZCkhXG4iLCByZXQpOworCQlyZXQgPSAtRU5PTUVNOworCQlnb3RvIGVycl9vdXQ7
CisJfQorCisJY3R4LT5pbml0ID0gUFNQX01FTV9UUkFJTl9SRVNFUlZFX1NVQ0NFU1M7CisJcmV0
dXJuIDA7CisKK2Vycl9vdXQ6CisJYW1kZ3B1X3R0bV90cmFpbmluZ19yZXNlcnZlX3ZyYW1fZmlu
aShhZGV2KTsKKwlyZXR1cm4gcmV0OworfQorCiAvKioKICAqIGFtZGdwdV90dG1faW5pdCAtIElu
aXQgdGhlIG1lbW9yeSBtYW5hZ2VtZW50ICh0dG0pIGFzIHdlbGwgYXMgdmFyaW91cwogICogZ3R0
L3ZyYW0gcmVsYXRlZCBmaWVsZHMuCkBAIC0xNzQwLDYgKzE4MjcsMTQgQEAgaW50IGFtZGdwdV90
dG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJcmV0dXJuIHI7CiAJfQogCisJ
LyoKKwkgKlRoZSByZXNlcnZlZCB2cmFtIGZvciBtZW1vcnkgdHJhaW5pbmcgbXVzdCBiZSBwaW5u
ZWQgdG8gdGhlIHNwZWNpZmllZAorCSAqcGxhY2Ugb24gdGhlIFZSQU0sIHNvIHJlc2VydmUgaXQg
ZWFybHkuCisJICovCisJciA9IGFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2luaXQo
YWRldik7CisJaWYgKHIpCisJCXJldHVybiByOworCiAJLyogYWxsb2NhdGUgbWVtb3J5IGFzIHJl
cXVpcmVkIGZvciBWR0EKIAkgKiBUaGlzIGlzIHVzZWQgZm9yIFZHQSBlbXVsYXRpb24gYW5kIHBy
ZS1PUyBzY2Fub3V0IGJ1ZmZlcnMgdG8KIAkgKiBhdm9pZCBkaXNwbGF5IGFydGlmYWN0cyB3aGls
ZSB0cmFuc2l0aW9uaW5nIGJldHdlZW4gcHJlLU9TCkBAIC0xODI1LDYgKzE5MjAsNyBAQCB2b2lk
IGFtZGdwdV90dG1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJcmV0dXJuOwog
CiAJYW1kZ3B1X3R0bV9kZWJ1Z2ZzX2ZpbmkoYWRldik7CisJYW1kZ3B1X3R0bV90cmFpbmluZ19y
ZXNlcnZlX3ZyYW1fZmluaShhZGV2KTsKIAlhbWRncHVfdHRtX2Z3X3Jlc2VydmVfdnJhbV9maW5p
KGFkZXYpOwogCWlmIChhZGV2LT5tbWFuLmFwZXJfYmFzZV9rYWRkcikKIAkJaW91bm1hcChhZGV2
LT5tbWFuLmFwZXJfYmFzZV9rYWRkcik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
