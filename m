Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B284902D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46B46E027;
	Mon, 17 Jun 2019 19:47:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFDD89FCE
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:17 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id x18so6964318qkn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ki9DNAJySqpHioLJJUaiaIBuhsT2vBBbzMm6No7DIcE=;
 b=aMPfvMmtSEQx+dvMM8JR3YWuNFpLhn+zgKzwfKtTc9j5+OGcg00MX7KGnlkT+OBcYr
 lzBIj5fH9m2BBXV9QHHKf5rb7ECmDER0gMjK6jKgHYrqF+3bvU9uBHLBX2ajqCNdJISq
 5GlxvCFMlNAvAD0eC/tGKZCJWi0IJj+qZr6gN25fNTehVd88KLFdI8fKwUQbCC9ck9xv
 h4m8yo0f6jnGTHGYDHE33yE9p303twWHPBe1yzITTexkWJxXgNgPFIFR0RD6axDJNEBX
 mDQ4MjtiVN5Pmx2a5tzfZJWkhGYsYmgwig2WV/M/Ht3sH5nBW1ugt4VrY90fjrh5Tamq
 NGxQ==
X-Gm-Message-State: APjAAAXhNFOilf5ko1GfRBtzQ70cScoPHXU9thscAYzRPrIR9PaBXeTg
 1J9ZCh/U8RPvvTUYc8aeSKTc7Zwucrr0Pg==
X-Google-Smtp-Source: APXvYqxW+5KxpjCd7UEH+Ll8yADvz+lwCOynDExlHRwC6758mzE+w+rTICFmmSb1m91pxtWhXrJ0eg==
X-Received: by 2002:a05:620a:1329:: with SMTP id
 p9mr23156528qkj.224.1560800835516; 
 Mon, 17 Jun 2019 12:47:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 379/459] drm/amd/display: Add some tm3dlut flags
Date: Mon, 17 Jun 2019 14:45:20 -0500
Message-Id: <20190617194540.18497-80-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ki9DNAJySqpHioLJJUaiaIBuhsT2vBBbzMm6No7DIcE=;
 b=YyKTBv5wbx3VB56slYCPKVLCXH64v2J1vtYZf9kuh5C3X3zEa61YSgQTscUEwjRLgv
 UySUdT/RkoB+qekWfU79u8b/77Vf52W0q7XLGK7DCw1D0iAWgmYZ49aBGKPiLw4GtWAo
 XadcxDJTQRzxHfZaiD4LaUgy2aWWlHYa1MgAnP3GWncRY1CvofVLOYKeDkfuRRA1OD1f
 OGZTJOS0dCV1/rbBhGPcDJAqEOgp/ZF/h73VpKpxP+PV1vqBaA4vxc4w06ul5xcnAI1+
 cx35+c8YwXpG2d2apJXiID+M/SZzLu5HmJR8byokmOjLIKXVSfFaBi+97D3KLF+0+aCx
 UNqQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Vitaly Prosyak <Vitaly.Prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+CgpNb3ZlIGZsYWdz
IGZyb20gY29sb3JfZ2FtbWEuaCB0byBtb2Rfc2hhcmVkLmgKYW5kIGFkZCBtb3JlIG9wdGlvbnMg
YW5kIHNldHRpbmcgc3RydWN0dXJlcwoKU2lnbmVkLW9mZi1ieTogVml0YWx5IFByb3N5YWsgPHZp
dGFseS5wcm9zeWFrQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBcmljIEN5ciA8QXJpYy5DeXJAYW1k
LmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQu
Y29tPgpBY2tlZC1ieTogVml0YWx5IFByb3N5YWsgPFZpdGFseS5Qcm9zeWFrQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiAuLi4vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5oICAgfCAxMiAtLS0t
LS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmMvbW9kX3NoYXJlZC5oICB8IDM3ICsr
KysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21v
ZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9t
b2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmgKaW5kZXggYzU2YzIwM2FiZmNiLi4zNjk5NTNmYWZh
ZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9y
L2NvbG9yX2dhbW1hLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMv
Y29sb3IvY29sb3JfZ2FtbWEuaApAQCAtODIsMTggKzgyLDYgQEAgc3RydWN0IGZyZWVzeW5jX2hk
cl90Zl9wYXJhbXMgewogCXVuc2lnbmVkIGludCBza2lwX3RtOyAvLyBza2lwIHRtCiB9OwogCi11
bmlvbiB0bTNkbHV0X2ZsYWdzIHsKLQl1bnNpZ25lZCBpbnQgcmF3OwotCXN0cnVjdCB7Ci0JCXVu
c2lnbmVkIGludCBkb2Nocm9tYV9zY2FsZQkJCToxOwotCQl1bnNpZ25lZCBpbnQgc3BlY192ZXJz
aW9uCQkJOjM7Ci0JCXVuc2lnbmVkIGludCBsZXNzX3RoYW5fZGNpcDMJCQk6MTsKLQkJdW5zaWdu
ZWQgaW50IGV4cF9zaGFwZXJfbWF4CQkJOjY7Ci0JCXVuc2lnbmVkIGludCB6ZXJvX2Rpc3BsYXlf
YmxhY2sJCQk6MTsKLQkJdW5zaWduZWQgaW50IHJlc2V2ZWQJCQkJOjIwOwotCX0gYml0czsKLX07
Ci0KIHZvaWQgc2V0dXBfeF9wb2ludHNfZGlzdHJpYnV0aW9uKHZvaWQpOwogdm9pZCBwcmVjb21w
dXRlX3BxKHZvaWQpOwogdm9pZCBwcmVjb21wdXRlX2RlX3BxKHZvaWQpOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9zaGFyZWQuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2luYy9tb2Rfc2hhcmVkLmgKaW5kZXgg
YjcxMWU3ZTZjMjA0Li41YTYzMTg1NGVmZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9tb2R1bGVzL2luYy9tb2Rfc2hhcmVkLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9zaGFyZWQuaApAQCAtNDUsNSArNDUsNDIgQEAg
ZW51bSB2cnJfcGFja2V0X3R5cGUgewogCVBBQ0tFVF9UWVBFX1ZURU0KIH07CiAKKyNpZiBkZWZp
bmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMCkKK3VuaW9uIHRtM2RsdXRfaW50ZXJuYWxfZmxh
Z3MgeworCXVuc2lnbmVkIGludCByYXc7CisJc3RydWN0IHsKKwkJdW5zaWduZWQgaW50IGRvY2hy
b21hX3NjYWxlCQkJOjE7CisJCXVuc2lnbmVkIGludCBzcGVjX3ZlcnNpb24JCQk6MzsKKwkJdW5z
aWduZWQgaW50IHVzZV96ZXJvX2Rpc3BsYXlfYmxhY2sgIDoxOworCQl1bnNpZ25lZCBpbnQgdXNl
X3plcm9fc291cmNlX2JsYWNrICA6MTsKKwkJdW5zaWduZWQgaW50IGZvcmNlX2Rpc3BsYXlfYmxh
Y2sJCTo2OworCQl1bnNpZ25lZCBpbnQgYXBwbHlfZGlzcGxheV9nYW1tYQk6MTsKKwkJdW5zaWdu
ZWQgaW50IGV4cF9zaGFwZXJfbWF4CQkJOjY7CisJCXVuc2lnbmVkIGludCB1bml0eTNkbHV0CQkJ
CToxOworCQl1bnNpZ25lZCBpbnQgYnlwYXNzM2RsdXQJCQk6MTsKKwkJdW5zaWduZWQgaW50IHVz
ZTNkbHV0CQkJCToxOworCQl1bnNpZ25lZCBpbnQgbGVzc190aGFuX2RjaXAzCQk6MTsKKwkJdW5z
aWduZWQgaW50IG92ZXJyaWRlX2x1bQkJCToxOworCQl1bnNpZ25lZCBpbnQgcmVzZXZlZAkJCQk6
ODsKKwl9IGJpdHM7Cit9OworCitlbnVtIHRtX3Nob3dfb3B0aW9uX2ludGVybmFsIHsKKwl0bV9z
aG93X29wdGlvbl9pbnRlcm5hbF9zaW5nbGVfZmlsZQkJPSAwLC8qZmxhZ3MyIG5vdCBpbiB1c2Uq
LworCXRtX3Nob3dfb3B0aW9uX2ludGVybmFsX2R1cGxpY2F0ZV9maWxlLC8qdXNlIGZsYWdzMiov
CisJdG1fc2hvd19vcHRpb25faW50ZXJuYWxfZHVwbGljYXRlX3NpZGVieXNpZGUvKnVzZSBmbGFn
czIqLworfTsKKworc3RydWN0IHRtM2RsdXRfc2V0dGluZ3MgeworCXVuc2lnbmVkIGNoYXIgdmVy
c2lvbjsKKwl1bmlvbiB0bTNkbHV0X2ludGVybmFsX2ZsYWdzIGZsYWdzOworCXVuaW9uIHRtM2Rs
dXRfaW50ZXJuYWxfZmxhZ3MgZmxhZ3MyOworCWVudW0gdG1fc2hvd19vcHRpb25faW50ZXJuYWwg
b3B0aW9uOworCXVuc2lnbmVkIGludCBtaW5fbHVtOy8qbXVsdGlwbGllZCBieSAxMDAqLworCXVu
c2lnbmVkIGludCBtYXhfbHVtOworCXVuc2lnbmVkIGludCBtaW5fbHVtMjsKKwl1bnNpZ25lZCBp
bnQgbWF4X2x1bTI7Cit9OworI2VuZGlmCiAKICNlbmRpZiAvKiBNT0RfU0hBUkVEX0hfICovCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
