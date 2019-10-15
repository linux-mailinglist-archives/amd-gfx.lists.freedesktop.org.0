Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BB9D8370
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 00:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E13D6E8A3;
	Tue, 15 Oct 2019 22:18:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96876E8A0
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 22:18:32 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id u40so33015833qth.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 15:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C6hpeHLKQ9T2OtQLd05ij3b4t3zXscHfw9OBRdUPGA4=;
 b=Y61v3bOFyMUfnTV9eli6ZDdalKANXeIXnuKu+uVoc9xAx/GNWGFUE5JzpFWGBeacLI
 Pm9NV60N1732raF9iUk2TOB6yEvuSjBiuRXil2DHeIwZEU43NL9Z1DSJsudEosaOoyQ0
 whQVgT9Vd8M3QXNvVxjqPfZPiIFfWMM7nCVMv641Rj8T25fDoPj/ITfN0PlqyoaMj1ox
 Oh5+l38IY7qOnj4ftODMXsWKUScx7tys1+1qZgR9rT46EHO/eN2QVf+WXArA2BMuteyQ
 6hibIZvcAg7XVHEauResnMZO92S/iFwPmbSFIOs+JZa0WxGlQz2Dwq5gPfZsOjknmwWN
 jpgA==
X-Gm-Message-State: APjAAAVkYu/cOhm8nlphKNt8b/l6lDbKcoMawetS4vWEZr+Bb50sg9xS
 fK+jMNoRzDjnw8JC7mC9ce58pAZB
X-Google-Smtp-Source: APXvYqxkHkDxOmkvDIgq1AG8gHoCzQrU/Dwj0AXp7Lat61ncP0jEwbFi3ZoWqSQM0SAz7mR0LinJmg==
X-Received: by 2002:a05:6214:304:: with SMTP id
 i4mr21797144qvu.147.1571177911475; 
 Tue, 15 Oct 2019 15:18:31 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p4sm625424qkf.112.2019.10.15.15.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 15:18:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu/vcn: fix allocation size in enc ring test
Date: Tue, 15 Oct 2019 18:18:13 -0400
Message-Id: <20191015221813.625024-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015221813.625024-1-alexander.deucher@amd.com>
References: <20191015221813.625024-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C6hpeHLKQ9T2OtQLd05ij3b4t3zXscHfw9OBRdUPGA4=;
 b=nT/xEaSy52QfX2WCYC84ZkuVmfqbWrL1DAXEiRfQGmWnC74sVGYnlAwvnOHMk0ei0Y
 ADpaGDGyPBZycuPulIpksMfIpr+mzh725SBMeZz5m17z/14D/7nNh7NuJhbbAarLwrQU
 0PKtTAAPH/ukkizSJhTlykF/gESjoE5fd3tW/7HI3ukK6bv26m+Xc2+9rg4oeG6WuG7R
 wa/tj6T0rRGljqbofnwu7IKAmOttoo6IcbtIkVgJN98MQNJ3SDMqzo95N7lDeYqJE+Wk
 tChtgK7XzeTSk+G7hLJQ0IYHlEFY1H6BetXl5J27dLEQLabD2/1WGUEnVVFMdomshbcx
 REgA==
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

V2UgbmVlZCB0byBhbGxvY2F0ZSBhIGxhcmdlIGVub3VnaCBidWZmZXIgZm9yIHRoZQpzZXNzaW9u
IGluZm8sIG90aGVyd2lzZSB0aGUgSUIgdGVzdCBjYW4gb3ZlcndyaXRlCm90aGVyIG1lbW9yeS4K
Ci0gU2Vzc2lvbiBpbmZvIGlzIDEyOEsgYWNjb3JkaW5nIHRvIG1lc2EKLSBVc2UgdGhlIHNhbWUg
c2Vzc2lvbiBpbmZvIGZvciBjcmVhdGUgYW5kIGRlc3Ryb3kKCkJ1ZzogaHR0cHM6Ly9idWd6aWxs
YS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDM1ICsrKysrKysrKysrKysrKystLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKaW5kZXggN2E2YmViMmU3YzRlLi4zMTk5ZTRh
NWZmMTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKQEAgLTU2OSwx
MyArNTY5LDE0IEBAIGludCBhbWRncHVfdmNuX2VuY19yaW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcpCiB9CiAKIHN0YXRpYyBpbnQgYW1kZ3B1X3Zjbl9lbmNfZ2V0X2NyZWF0
ZV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUsCi0JCQkgICAg
ICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpCisJCQkJCSBzdHJ1Y3QgYW1kZ3B1X2JvICpibywK
KwkJCQkJIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSkKIHsKIAljb25zdCB1bnNpZ25lZCBpYl9z
aXplX2R3ID0gMTY7CiAJc3RydWN0IGFtZGdwdV9qb2IgKmpvYjsKIAlzdHJ1Y3QgYW1kZ3B1X2li
ICppYjsKIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmID0gTlVMTDsKLQl1aW50NjRfdCBkdW1teTsKKwl1
aW50NjRfdCBhZGRyOwogCWludCBpLCByOwogCiAJciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0aF9p
YihyaW5nLT5hZGV2LCBpYl9zaXplX2R3ICogNCwgJmpvYik7CkBAIC01ODMsMTQgKzU4NCwxNCBA
QCBzdGF0aWMgaW50IGFtZGdwdV92Y25fZW5jX2dldF9jcmVhdGVfbXNnKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywgdWludDMyX3QgaGFuZAogCQlyZXR1cm4gcjsKIAogCWliID0gJmpvYi0+aWJz
WzBdOwotCWR1bW15ID0gaWItPmdwdV9hZGRyICsgMTAyNDsKKwlhZGRyID0gYW1kZ3B1X2JvX2dw
dV9vZmZzZXQoYm8pOwogCiAJaWItPmxlbmd0aF9kdyA9IDA7CiAJaWItPnB0cltpYi0+bGVuZ3Ro
X2R3KytdID0gMHgwMDAwMDAxODsKIAlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSAweDAwMDAw
MDAxOyAvKiBzZXNzaW9uIGluZm8gKi8KIAlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSBoYW5k
bGU7Ci0JaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gdXBwZXJfMzJfYml0cyhkdW1teSk7Ci0J
aWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gZHVtbXk7CisJaWItPnB0cltpYi0+bGVuZ3RoX2R3
KytdID0gdXBwZXJfMzJfYml0cyhhZGRyKTsKKwlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSBh
ZGRyOwogCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IDB4MDAwMDAwMGI7CiAKIAlpYi0+cHRy
W2liLT5sZW5ndGhfZHcrK10gPSAweDAwMDAwMDE0OwpAQCAtNjIxLDEzICs2MjIsMTQgQEAgc3Rh
dGljIGludCBhbWRncHVfdmNuX2VuY19nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmcsIHVpbnQzMl90IGhhbmQKIH0KIAogc3RhdGljIGludCBhbWRncHVfdmNuX2VuY19nZXRf
ZGVzdHJveV9tc2coc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUsCi0J
CQkJc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKQorCQkJCQkgIHN0cnVjdCBhbWRncHVfYm8gKmJv
LAorCQkJCQkgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSkKIHsKIAljb25zdCB1bnNpZ25lZCBp
Yl9zaXplX2R3ID0gMTY7CiAJc3RydWN0IGFtZGdwdV9qb2IgKmpvYjsKIAlzdHJ1Y3QgYW1kZ3B1
X2liICppYjsKIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmID0gTlVMTDsKLQl1aW50NjRfdCBkdW1teTsK
Kwl1aW50NjRfdCBhZGRyOwogCWludCBpLCByOwogCiAJciA9IGFtZGdwdV9qb2JfYWxsb2Nfd2l0
aF9pYihyaW5nLT5hZGV2LCBpYl9zaXplX2R3ICogNCwgJmpvYik7CkBAIC02MzUsMTQgKzYzNywx
NCBAQCBzdGF0aWMgaW50IGFtZGdwdV92Y25fZW5jX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbgogCQlyZXR1cm4gcjsKIAogCWliID0gJmpvYi0+
aWJzWzBdOwotCWR1bW15ID0gaWItPmdwdV9hZGRyICsgMTAyNDsKKwlhZGRyID0gYW1kZ3B1X2Jv
X2dwdV9vZmZzZXQoYm8pOwogCiAJaWItPmxlbmd0aF9kdyA9IDA7CiAJaWItPnB0cltpYi0+bGVu
Z3RoX2R3KytdID0gMHgwMDAwMDAxODsKIAlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSAweDAw
MDAwMDAxOwogCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IGhhbmRsZTsKLQlpYi0+cHRyW2li
LT5sZW5ndGhfZHcrK10gPSB1cHBlcl8zMl9iaXRzKGR1bW15KTsKLQlpYi0+cHRyW2liLT5sZW5n
dGhfZHcrK10gPSBkdW1teTsKKwlpYi0+cHRyW2liLT5sZW5ndGhfZHcrK10gPSB1cHBlcl8zMl9i
aXRzKGFkZHIpOworCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IGFkZHI7CiAJaWItPnB0cltp
Yi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAwYjsKIAogCWliLT5wdHJbaWItPmxlbmd0aF9kdysr
XSA9IDB4MDAwMDAwMTQ7CkBAIC02NzUsMTMgKzY3NywyMCBAQCBzdGF0aWMgaW50IGFtZGdwdV92
Y25fZW5jX2dldF9kZXN0cm95X21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90
IGhhbgogaW50IGFtZGdwdV92Y25fZW5jX3JpbmdfdGVzdF9pYihzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmcsIGxvbmcgdGltZW91dCkKIHsKIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9IE5VTEw7
CisJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBOVUxMOwogCWxvbmcgcjsKIAotCXIgPSBhbWRncHVf
dmNuX2VuY19nZXRfY3JlYXRlX21zZyhyaW5nLCAxLCBOVUxMKTsKKwlyID0gYW1kZ3B1X2JvX2Ny
ZWF0ZV9yZXNlcnZlZChyaW5nLT5hZGV2LCAxMjggKiAxMDI0LCBQQUdFX1NJWkUsCisJCQkJICAg
ICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKKwkJCQkgICAgICAmYm8sIE5VTEwsIE5VTEwpOwor
CWlmIChyKQorCQlyZXR1cm4gcjsKKworCXIgPSBhbWRncHVfdmNuX2VuY19nZXRfY3JlYXRlX21z
ZyhyaW5nLCAxLCBibywgTlVMTCk7CiAJaWYgKHIpCiAJCWdvdG8gZXJyb3I7CiAKLQlyID0gYW1k
Z3B1X3Zjbl9lbmNfZ2V0X2Rlc3Ryb3lfbXNnKHJpbmcsIDEsICZmZW5jZSk7CisJciA9IGFtZGdw
dV92Y25fZW5jX2dldF9kZXN0cm95X21zZyhyaW5nLCAxLCBibywgJmZlbmNlKTsKIAlpZiAocikK
IAkJZ290byBlcnJvcjsKIApAQCAtNjkzLDYgKzcwMiw4IEBAIGludCBhbWRncHVfdmNuX2VuY19y
aW5nX3Rlc3RfaWIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBsb25nIHRpbWVvdXQpCiAKIGVy
cm9yOgogCWRtYV9mZW5jZV9wdXQoZmVuY2UpOworCWFtZGdwdV9ib191bnJlc2VydmUoYm8pOwor
CWFtZGdwdV9ib191bnJlZigmYm8pOwogCXJldHVybiByOwogfQogCi0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
