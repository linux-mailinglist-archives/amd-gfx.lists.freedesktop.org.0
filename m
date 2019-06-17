Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041D48FCA
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33DB89B67;
	Mon, 17 Jun 2019 19:45:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBA089D7C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:31 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d17so7333346qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZFzL7HQOfoS+RHHDzjmgOa3mcDeJhbp9oTegvgCyyQo=;
 b=TM+735fFRBWEB3znqb2C8Vi13pVkjqae22X9II/5fIyg7lpRHm5vy6XRF3nTm6nn58
 d217LXeZzXegnpVqd7aMHGd1WqnCRMQCfk23NQEeqeRtsZ9LKReWjcvwR+ZYBNnBf4rV
 ixUijrBBZQ06kado+0yN1RBYr+Jao3n9X1V0Z7020P0w0L4RI8v7jX5y0fFpe8IvBttR
 MsfXoYOuFDJgidBqMJrNQzso9n2WF4LFueU3NHiR/pOvAaQV5d9scsWYczV1p+QILHTa
 OJWCLNCUEcczCzbSeQF+2Q3tJHXcS+S+qzLY9q/+PVR/J9voCGA0vKyEkJUAuq43eUYI
 /K0g==
X-Gm-Message-State: APjAAAV+0a5BTo4AxoHsvJ+WXYTZsyLqgb6nhvQOCxFEeOQFh+JWi6CX
 ySnqpEQVhOS2Z3nCUCPpZvwnfrFSk2Y=
X-Google-Smtp-Source: APXvYqzd7KwRYoLSmavHkcBIa1WQcxUF+wbReND6usVwQKkjD/J39o05GWu+J/9Fprhdg5E6SJT9VQ==
X-Received: by 2002:ac8:7a73:: with SMTP id w19mr75344640qtt.292.1560800730734; 
 Mon, 17 Jun 2019 12:45:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u63sm1490547qkh.85.2019.06.17.12.45.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 299/459] drm/amdgpu/VCN: add buffer for indirect SRAM usage
Date: Mon, 17 Jun 2019 14:45:20 -0500
Message-Id: <20190617194520.18449-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194520.18449-1-alexander.deucher@amd.com>
References: <20190617194520.18449-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZFzL7HQOfoS+RHHDzjmgOa3mcDeJhbp9oTegvgCyyQo=;
 b=OcTQWUK8M7apLQT2Cf7lwUEvGIRKKVJIYTPcm8DULbdpCgFppVDXj/TlDRCDakCDol
 uR1BzmQrzEmf0M9ouDD3IsB6fZ0FVQIAOTU6bQxkIS5z01Ba7P+b820+0mp/w4oh6BiD
 m5oT3NY7zaMDeAnsmbGquHN2eId06isUjwm//aSbyfsQ9PY3CkhCEB4931iUlBHHKMkx
 fWwsQoP5NkI6MKQ9xDYuzvmo+cyUsDz4DAh9DSU2Ne+zzK5IMf+eNM5nqTY2HKCxNh9Z
 gFZfrwnxdrtCRn1uuDAAGYy4XNId8hZWujkymVE7ebS/r4e81FSQxGx5Uk2DShG+ngGw
 YELQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKVGhpcyB3aWxsIGJlIHVzZWQgbGF0ZXIg
Zm9yIGluZGlyZWN0IFNSQU0gbW9kZQoKU2lnbmVkLW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBh
bWQuY29tPgpSZXZpZXdlZC1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDE2ICsrKysrKysrKysrKysr
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaCB8ICA2ICsrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Zjbi5jCmluZGV4IGQwYjk1ZTU4OTU5YS4uNzYyMTA3NzM3OGRkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCkBAIC0xMzcsNiArMTM3LDE2IEBAIGlu
dCBhbWRncHVfdmNuX3N3X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXJldHVy
biByOwogCX0KIAorCWlmIChhZGV2LT52Y24uaW5kaXJlY3Rfc3JhbSkgeworCQlyID0gYW1kZ3B1
X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwgNjQgKiAyICogNCwgUEFHRV9TSVpFLAorCQkJICAgIEFN
REdQVV9HRU1fRE9NQUlOX1ZSQU0sICZhZGV2LT52Y24uZHBnX3NyYW1fYm8sCisJCQkgICAgJmFk
ZXYtPnZjbi5kcGdfc3JhbV9ncHVfYWRkciwgJmFkZXYtPnZjbi5kcGdfc3JhbV9jcHVfYWRkcik7
CisJCWlmIChyKSB7CisJCQlkZXZfZXJyKGFkZXYtPmRldiwgIiglZCkgZmFpbGVkIHRvIGFsbG9j
YXRlIERQRyBib1xuIiwgcik7CisJCQlyZXR1cm4gcjsKKwkJfQorCX0KKwogCXJldHVybiAwOwog
fQogCkBAIC0xNDYsNiArMTU2LDEyIEBAIGludCBhbWRncHVfdmNuX3N3X2Zpbmkoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlrdmZyZWUoYWRldi0+dmNuLnNhdmVkX2JvKTsKIAorCWlm
IChhZGV2LT52Y24uaW5kaXJlY3Rfc3JhbSkgeworCQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFk
ZXYtPnZjbi5kcGdfc3JhbV9ibywKKwkJCSAgICAgICZhZGV2LT52Y24uZHBnX3NyYW1fZ3B1X2Fk
ZHIsCisJCQkgICAgICAodm9pZCAqKikmYWRldi0+dmNuLmRwZ19zcmFtX2NwdV9hZGRyKTsKKwl9
CisKIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPnZjbi52Y3B1X2JvLAogCQkJICAgICAg
JmFkZXYtPnZjbi5ncHVfYWRkciwKIAkJCSAgICAgICh2b2lkICoqKSZhZGV2LT52Y24uY3B1X2Fk
ZHIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCmluZGV4IDViMzg3OThm
OGJjMy4uNzYyY2ZmZWFmMzAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmNuLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zj
bi5oCkBAIC0xNjQsNiArMTY0LDEyIEBAIHN0cnVjdCBhbWRncHVfdmNuIHsKIAlzdHJ1Y3QgYW1k
Z3B1X3Zjbl9yZWcJaW50ZXJuYWwsIGV4dGVybmFsOwogCWludCAoKnBhdXNlX2RwZ19tb2RlKShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJc3RydWN0IGRwZ19wYXVzZV9zdGF0ZSAqbmV3
X3N0YXRlKTsKKworCWJvb2wJCQlpbmRpcmVjdF9zcmFtOworCXN0cnVjdCBhbWRncHVfYm8JKmRw
Z19zcmFtX2JvOworCXZvaWQJCQkqZHBnX3NyYW1fY3B1X2FkZHI7CisJdWludDY0X3QJCWRwZ19z
cmFtX2dwdV9hZGRyOworCXVpbnQzMl90CQkqZHBnX3NyYW1fY3Vycl9hZGRyOwogfTsKIAogaW50
IGFtZGdwdV92Y25fc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
