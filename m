Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A848F50
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC3A89C0D;
	Mon, 17 Jun 2019 19:31:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C896F89BC2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:36 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j19so12193976qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U1c3lPWuaifbuZY0Sbxb0rkmdLLweuy+Wx0d/SLIiVI=;
 b=SYiGnsDmrYvCFrh1guaun6wNvdDTuP0TXNj8wEJG0ukOlXShlRRpruAAZQCoZgE/Uk
 s04eucjNGiOeEgf9OjSpstZFkQHr8yEq5MUmz2osE+w/3FHBLns7pFe793hFAa1YGtEF
 oFHW3AqEjCxY/Xi9vKO1T+DXRUKEkRZZQU3pF40VcjWKESotsXdvEd4FBWTXJI9sbrj+
 3fAKwBlM1cTkIkaS6Q0iAldB8jWqxASVBlXPvImeJKEHYMppOLcXn1elgcoK7ksPI4Vy
 DdYILpBOcN+nlsNxdW+7G4/Kl4+18X1mYKaHjz9LwfudhLtUOAfkExPE7RY/uLZP3DnV
 Q1bg==
X-Gm-Message-State: APjAAAVRRLO3+0ZRxyW4s30N1j6m+QFwnUAtqbhXpQN1TDczYDI7eZvB
 XZtJpe96TB0Ren4VbQkhg4wei80fNWI=
X-Google-Smtp-Source: APXvYqwL+Zc/dFJRCXgJTdbDdxm9J00yG8AqKxTa7Qm2tQIvag6D0TbmGSD1RnQj+JOxOTPbrk9t9g==
X-Received: by 2002:a0c:b07b:: with SMTP id l56mr23041934qvc.114.1560799895763; 
 Mon, 17 Jun 2019 12:31:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 225/459] drm/amdgpu/gfx10: remove unnecessary waiting on gfx
 inactive
Date: Mon, 17 Jun 2019 14:29:52 -0500
Message-Id: <20190617193106.18231-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U1c3lPWuaifbuZY0Sbxb0rkmdLLweuy+Wx0d/SLIiVI=;
 b=ve9X9RqOzd1cxkd0QwJdzCcMnfnvB3iE0WaLvNfOdgzLRgYfTCm8Kz7+2qgps0M7oo
 qJjn+7vCzf23okKDN5cPirsD6FDGpkLv4pWCEflpUB3hx4DiUxZubuZbFS6/r54SBdps
 sGyt55+NVAQ/sPuezTHEUYzR4hcGae54oE2M03IOD02BZstzJ7ozspvlffjATIzBVIM1
 O1sBHjt3sKNxLCzS2NF+wib0QaIGCzg8Aao0uuAGQ6+khs6pdBuMk2XToCTdNdPmUpLu
 aRkjN/sl3TLdFcmMV6aSPoBstGVGtCd6YD99EVszrrWCb+vap7HFz2GAf5Nmf5ExGO/O
 qnWw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClRoZSBmb2xsb3dpbmcgS0lRIHJp
bmcgdGVzdCBjb3VsZCBndWFyYW50ZWUgdGhlIHByZXZpb3VzIHVubWFwCmhhcyBiZWVuIGRvbmUu
CgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpSZXZpZXdlZC1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAzNSArKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCAyNjJjNDAwNDkzOWYuLmZjNmI5
NWZlNjg3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTM1NjQs
OSArMzU2NCw4IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQog
c3RhdGljIGludCBnZnhfdjEwXzBfa2lxX2Rpc2FibGVfa2dxKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogewogCXN0cnVjdCBhbWRncHVfa2lxICpraXEgPSAmYWRldi0+Z2Z4LmtpcTsKLQlz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsICpraXFfcmluZyA9ICZraXEtPnJpbmc7Ci0Jc3RydWN0
IHYxMF9nZnhfbXFkICptcWQ7Ci0JaW50IHIsIGksIGo7CisJc3RydWN0IGFtZGdwdV9yaW5nICpr
aXFfcmluZyA9ICZraXEtPnJpbmc7CisJaW50IGk7CiAKIAlpZiAoIWtpcS0+cG1mIHx8ICFraXEt
PnBtZi0+a2lxX3VubWFwX3F1ZXVlcykKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0zNTc1LDMzICsz
NTc0LDkgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfa2lxX2Rpc2FibGVfa2dxKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCQkJCQlhZGV2LT5nZngubnVtX2dmeF9yaW5ncykpCiAJCXJldHVy
biAtRU5PTUVNOwogCi0JZm9yIChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fZ2Z4X3JpbmdzOyBp
KyspIHsKLQkJcmluZyA9ICZhZGV2LT5nZnguZ2Z4X3JpbmdbaV07Ci0KLQkJciA9IGFtZGdwdV9i
b19yZXNlcnZlKHJpbmctPm1xZF9vYmosIGZhbHNlKTsKLQkJaWYgKHVubGlrZWx5KHIgIT0gMCkp
Ci0JCQlyZXR1cm4gcjsKLQotCQlyID0gYW1kZ3B1X2JvX2ttYXAocmluZy0+bXFkX29iaiwgKHZv
aWQgKiopJnJpbmctPm1xZF9wdHIpOwotCQlpZiAoIXIpIHsKLQkJCWtpcS0+cG1mLT5raXFfdW5t
YXBfcXVldWVzKGtpcV9yaW5nLCByaW5nLAotCQkJCQkJICAgUFJFRU1QVF9RVUVVRVMsIDAsIDAp
OwotCQkJbXFkID0gcmluZy0+bXFkX3B0cjsKLQotCQkJZm9yIChqID0gMDsgaiA8IGFkZXYtPnVz
ZWNfdGltZW91dDsgaisrKSB7Ci0JCQkJaWYgKCFtcWQtPmNwX2dmeF9ocWRfYWN0aXZlKQotCQkJ
CQlicmVhazsKLQkJCQl1ZGVsYXkoMSk7Ci0JCQl9Ci0KLQkJCWlmIChqID09IGFkZXYtPnVzZWNf
dGltZW91dCkKLQkJCQlEUk1fRVJST1IoImZhaWxlZCB0byB3YWl0IGZvciBnZnggaW5hY3RpdmVc
biIpOwotCi0JCQlhbWRncHVfYm9fa3VubWFwKHJpbmctPm1xZF9vYmopOwotCQkJcmluZy0+bXFk
X3B0ciA9IE5VTEw7Ci0JCX0KLQkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShyaW5nLT5tcWRfb2JqKTsK
LQl9CisJZm9yIChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fZ2Z4X3JpbmdzOyBpKyspCisJCWtp
cS0+cG1mLT5raXFfdW5tYXBfcXVldWVzKGtpcV9yaW5nLCAmYWRldi0+Z2Z4LmdmeF9yaW5nW2ld
LAorCQkJCQkgICBQUkVFTVBUX1FVRVVFUywgMCwgMCk7CiAKIAlyZXR1cm4gYW1kZ3B1X3Jpbmdf
dGVzdF9yaW5nKGtpcV9yaW5nKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
