Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C2E48F26
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2D789B68;
	Mon, 17 Jun 2019 19:30:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F65B89B60
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:30:54 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so12221025qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JKGOUKLxJA7HRTNUVGHWgiYNvyrxGdL+yFH4aXclaI0=;
 b=G1Tr3hHRjNya3IrHtLcOeX2CPkWcW5u3POHB0bDEqan9pIFBWgvQ7bVUn6y+kR7MQ6
 jlpA9JHMNYg6HhRVGxB20/PWhdrgoXGbzeyo4o6y8xOJvUTIs6QKNPus0WJ07yZexgxT
 rhEfxDYQgweei6ujhhrybAlL55AeQKvC0CwH4eJ6bP9C4vDaQbv1mc2DynV8EkgDBHEL
 ai736hokETSweEoRppLQ+sSLnA+VlVD4OAhxwpo2V8U9gbQFKezPIzAEvfuK/5yQLt12
 vGHLkrvm+6ZQhSDSjl+gvb+Dp2dFXGq8N9L8gD25/1O0ziU3Okoh0e/uINW7Vl4BLVQu
 XYfw==
X-Gm-Message-State: APjAAAWadtPCCJ87TwVm7+jpO0wLAfxp+UhG7oIoCdCEyinTc7/ZJiYB
 0/AifML8kz+QO7syqnNjg31axHfQTWg=
X-Google-Smtp-Source: APXvYqzkBHKPa49iU1hHcvGZsj5Q7I8Nulqa/pb8HWApmdIDIFVnUrtD9bLQzZBr4V7KOPxbjL29eg==
X-Received: by 2002:a0c:d604:: with SMTP id c4mr22684546qvj.27.1560799853458; 
 Mon, 17 Jun 2019 12:30:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id o54sm8328992qtb.63.2019.06.17.12.30.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:30:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 197/459] drm/amd/powerplay: add new interface for vcn
 powergating
Date: Mon, 17 Jun 2019 14:30:40 -0500
Message-Id: <20190617193042.18183-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193042.18183-1-alexander.deucher@amd.com>
References: <20190617193042.18183-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKGOUKLxJA7HRTNUVGHWgiYNvyrxGdL+yFH4aXclaI0=;
 b=dKMTU5Tj45rrJeJRIdUJAixol5Xfpt2+tG8RReXcqjwyo5XRI1jt5Vj80hYlOippPU
 wqymtNf73Kf3MERA8EmkSbuEoNyEJ1LEzixjChhX5stU/1ealPdzMNiyE7I4GGXFbtS3
 Cpj+zu4isSOMi3uWNJuc/4WXOspCYN83jHYUMsSeWdc7WuJfJARSahdSHkZXDj9JwyBk
 v2pFRzMKN8POfrUpUwHfypLOpABWuFbIVxBT2hUSgX952iVAVOUW2GNmPTEAC9glf2L+
 a5r1YBqVeU0CeGWhT6RQ5shZScY+y9RKK1mamcRYFbxZD4UGPGm6Q7cBQSXEw4WtBVY3
 c8Yw==
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
 Huang Rui <ray.huang@amd.com>, Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCmFkZCBuZXcgaW50ZXJm
YWNlIGZvciB2Y24gcG93cmVyZ2F0aW5nIGFuZCB2Y24gZHBtIGFzIHdlbGwuCgpTaWduZWQtb2Zm
LWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBK
YWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVh
bmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUu
aCAgICB8ICA0ICsrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
ICAgIHwgMjggKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2Ft
ZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211
LmgKaW5kZXggNWZkZjk4M2Q2ZGM2Li44YWI5ZDI1OWI0NTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApAQCAtMjI0LDYgKzIyNCwxMCBAQCBl
bnVtIHNtdV9tZXNzYWdlX3R5cGUKIAlTTVVfTVNHX1ByZXBhcmVNcDFGb3JTaHV0ZG93biwKIAlT
TVVfTVNHX1NldE1HcHVGYW5Cb29zdExpbWl0UnBtLAogCVNNVV9NU0dfR2V0QVZGU1ZvbHRhZ2VC
eURwbSwKKwlTTVVfTVNHX1Bvd2VyVXBWY24sCisJU01VX01TR19Qb3dlckRvd25WY24sCisJU01V
X01TR19Qb3dlclVwSnBlZywKKwlTTVVfTVNHX1Bvd2VyRG93bkpwZWcsCiAJU01VX01TR19NQVhf
Q09VTlQsCiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMK
aW5kZXggN2ZjN2ZkN2MyZmEwLi5lMGQwMmEyNDU4YzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTk3LDYgKzk3LDEwIEBAIHN0YXRpYyBpbnQgbmF2
aTEwX21lc3NhZ2VfbWFwW1NNVV9NU0dfTUFYX0NPVU5UXSA9IHsKIAlNU0dfTUFQKEV4aXRCYWNv
LAkJCVBQU01DX01TR19FeGl0QmFjbyksCiAJTVNHX01BUChQcmVwYXJlTXAxRm9yUmVzZXQsCQlQ
UFNNQ19NU0dfUHJlcGFyZU1wMUZvclJlc2V0KSwKIAlNU0dfTUFQKFByZXBhcmVNcDFGb3JTaHV0
ZG93biwJCVBQU01DX01TR19QcmVwYXJlTXAxRm9yU2h1dGRvd24pLAorCU1TR19NQVAoUG93ZXJV
cFZjbiwJCVBQU01DX01TR19Qb3dlclVwVmNuKSwKKwlNU0dfTUFQKFBvd2VyRG93blZjbiwJCVBQ
U01DX01TR19Qb3dlckRvd25WY24pLAorCU1TR19NQVAoUG93ZXJVcEpwZWcsCQlQUFNNQ19NU0df
UG93ZXJVcEpwZWcpLAorCU1TR19NQVAoUG93ZXJEb3duSnBlZywJCVBQU01DX01TR19Qb3dlckRv
d25KcGVnKSwKIH07CiAKIHN0YXRpYyBpbnQgbmF2aTEwX2Nsa19tYXBbU01VX0NMS19DT1VOVF0g
PSB7CkBAIC00NzAsNiArNDc0LDI5IEBAIHN0YXRpYyBpbnQgbmF2aTEwX3NldF9kZWZhdWx0X2Rw
bV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGlj
IGludCBuYXZpMTBfZHBtX3NldF91dmRfZW5hYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBi
b29sIGVuYWJsZSkKK3sKKwlpbnQgcmV0ID0gMDsKKwlzdHJ1Y3Qgc211X3Bvd2VyX2NvbnRleHQg
KnNtdV9wb3dlciA9ICZzbXUtPnNtdV9wb3dlcjsKKwlzdHJ1Y3Qgc211X3Bvd2VyX2dhdGUgKnBv
d2VyX2dhdGUgPSAmc211X3Bvd2VyLT5wb3dlcl9nYXRlOworCisJaWYgKGVuYWJsZSAmJiBwb3dl
cl9nYXRlLT51dmRfZ2F0ZWQpIHsKKwkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFt
KHNtdSwgU01VX01TR19Qb3dlclVwVmNuLCAxKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7
CisJCXBvd2VyX2dhdGUtPnV2ZF9nYXRlZCA9IGZhbHNlOworCX0gZWxzZSB7CisJCWlmICghZW5h
YmxlICYmICFwb3dlcl9nYXRlLT51dmRfZ2F0ZWQpIHsKKwkJCXJldCA9IHNtdV9zZW5kX3NtY19t
c2coc211LCBTTVVfTVNHX1Bvd2VyRG93blZjbik7CisJCQlpZiAocmV0KQorCQkJCXJldHVybiBy
ZXQ7CisJCQlwb3dlcl9nYXRlLT51dmRfZ2F0ZWQgPSB0cnVlOworCQl9CisJfQorCisJcmV0dXJu
IDA7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1
bmNzID0gewogCS50YWJsZXNfaW5pdCA9IG5hdmkxMF90YWJsZXNfaW5pdCwKIAkuYWxsb2NfZHBt
X2NvbnRleHQgPSBuYXZpMTBfYWxsb2NhdGVfZHBtX2NvbnRleHQsCkBAIC00ODMsNiArNTEwLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7
CiAJLmdldF9zbXVfcG93ZXJfaW5kZXg9IG5hdmkxMF9nZXRfcHdyX3NyY19pbmRleCwKIAkuZ2V0
X2FsbG93ZWRfZmVhdHVyZV9tYXNrID0gbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzaywK
IAkuc2V0X2RlZmF1bHRfZHBtX3RhYmxlID0gbmF2aTEwX3NldF9kZWZhdWx0X2RwbV90YWJsZSwK
KwkuZHBtX3NldF91dmRfZW5hYmxlID0gbmF2aTEwX2RwbV9zZXRfdXZkX2VuYWJsZSwKIH07CiAK
IHZvaWQgbmF2aTEwX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
