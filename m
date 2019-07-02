Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD9B5D61E
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 20:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5FD6E02A;
	Tue,  2 Jul 2019 18:29:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ADB6E02A
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 18:29:07 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id r185so39371639iod.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 11:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHXbYGQvqljgtRtnznXqUQB9zKd02RaBhm4LBL2Sh8w=;
 b=tne48StZkAPS3zQ+oW/ZXexwO6wMNsDvhH3x/YBry5dtELPbxds8J0kutIiaFx+Q+L
 0Pmv+beDN9Y9njkCbNBcsknLWSDX/733VWq/MgETlIuCQK8EA5NNTYjELmNdPhox/eUZ
 tDCP6n7CS5r0THlf9bYiI/uEjtR5T8yuH0fXTlucFvxBs/yhif3kdtSNF7Wd1FsoaGgU
 RPZKP7JN+TeXMiDe2IC57X7NYn0ie3/7f6p3aqotkrZp2+62SadoffDMeTIXnCcb3ZPg
 VbkHQlkkIp4oXV1pwWldV3Ujddo1yfm+t2vk7h/hZM3BqcK8jh2jUxj1jmh5SoC+AI/g
 dNqg==
X-Gm-Message-State: APjAAAV305cET3JUmKixk6ZzWNwZ/g7GcD8QL2R6PeT+nGF8kaFaL/WK
 xqfTtez1zDWSkLJq9U66nPTO4BOO
X-Google-Smtp-Source: APXvYqxo/PhRs9tINBZHhttxz9dygiB0c0LMffQGTaYfi88jh5nx7cZlcIIP6OcyNk7Rvi2Ck11l2g==
X-Received: by 2002:a02:4484:: with SMTP id o126mr37640781jaa.34.1562092146464; 
 Tue, 02 Jul 2019 11:29:06 -0700 (PDT)
Received: from crimson.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id y18sm17591089iob.64.2019.07.02.11.29.05
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 11:29:06 -0700 (PDT)
From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: don't invalidate caches in RELEASE_MEM,
 only do the writeback
Date: Tue,  2 Jul 2019 14:29:01 -0400
Message-Id: <20190702182901.22491-1-maraeo@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHXbYGQvqljgtRtnznXqUQB9zKd02RaBhm4LBL2Sh8w=;
 b=uCHhi5RsXlcKNnpy2AU1CK8d2Me5NznmfNZwKI347hS19k0nsJMNTK4jgh7WQ8WTJm
 BPzTr7PeY9KKRTKqvD4Txe/ndQ0GTAG6cq4Xa+WKBK65j+6p+emyVQMWIbdBtuc00jh3
 9wjElrM5oUrQFnCDPhWF0sya/qMwl1hfPHjGUERNb1tFPRcYbXUq84cpg8gKgtME4PZw
 vdGLRf1vDSDtgvHmXQGLO0OTv6N52+wJy9PmG2r1Kd/xqlGFfaWLCesBqD8g4a4NrtuJ
 2tGik18NFD+AXGX+vv0Fr/jU35wJ9ASSObBQn6ibnxHlVhP708zI7prsIYcHoWA+8ZIZ
 2EIw==
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

RnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KClRoaXMgUkVMRUFTRV9N
RU0gdXNlIGhhcyB0aGUgUmVsZWFzZSBzZW1hbnRpYywgd2hpY2ggbWVhbnMgd2Ugc2hvdWxkIHdy
aXRlCmJhY2sgYnV0IG5vdCBpbnZhbGlkYXRlLiBJbnZhbGlkYXRpb25zIG9ubHkgbWFrZSBzZW5z
ZSB3aXRoIHRoZSBBY3F1aXJlCnNlbWFudGljIChBQ1FVSVJFX01FTSksIG9yIHdoZW4gUkVMRUFT
RV9NRU0gaXMgdXNlZCB0byBkbyB0aGUgY29tYmluZWQKQWNxdWlyZS1SZWxlYXNlIHNlbWFudGlj
LCB3aGljaCBpcyBhIGJhcnJpZXIsIG5vdCBhIGZlbmNlLgoKVGhlIHVuZGVzaXJhYmxlIHNpZGUg
ZWZmZWN0IG9mIGRvaW5nIGludmFsaWRhdGlvbnMgZm9yIHRoZSBSZWxlYXNlIHNlbWFudGljCmlz
IHRoYXQgaXQgaW52YWxpZGF0ZXMgY2FjaGVzIHdoaWxlIHNoYWRlcnMgYXJlIHJ1bm5pbmcsIGJl
Y2F1c2UgdGhlIFJlbGVhc2UKY2FuIGV4ZWN1dGUgaW4gdGhlIG1pZGRsZSBvZiB0aGUgbmV4dCBJ
Qi4KClVNRHMgc2hvdWxkIHVzZSBBQ1FVSVJFX01FTSBhdCB0aGUgYmVnaW5uaW5nIG9mIElCcy4g
RG9pbmcgY2FjaGUKaW52YWxpZGF0aW9ucyBmb3IgYSBmZW5jZSAobGlrZSBpbiB0aGlzIGNhc2Up
IGRvZXNuJ3QgZG8gYW55dGhpbmcKZm9yIGNvcnJlY3RuZXNzLgoKU2lnbmVkLW9mZi1ieTogTWFy
ZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYyB8IDYgKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAu
YwppbmRleCAyMTBkMjQ1MTFkYzYuLmEzMGY1ZDQ5MTNiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTQyOTYsMjUgKzQyOTYsMjEgQEAgc3RhdGljIHZvaWQgZ2Z4
X3YxMF8wX3JpbmdfZW1pdF9mZW5jZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHU2NCBhZGRy
LAogCWJvb2wgaW50X3NlbCA9IGZsYWdzICYgQU1ER1BVX0ZFTkNFX0ZMQUdfSU5UOwogCiAJLyog
SW50ZXJydXB0IG5vdCB3b3JrIGZpbmUgb24gR0ZYMTAuMSBtb2RlbCB5ZXQuIFVzZSBmYWxsYmFj
ayBpbnN0ZWFkICovCiAJaWYgKGFkZXYtPnBkZXYtPmRldmljZSA9PSAweDUwKQogCQlpbnRfc2Vs
ID0gZmFsc2U7CiAKIAkvKiBSRUxFQVNFX01FTSAtIGZsdXNoIGNhY2hlcywgc2VuZCBpbnQgKi8K
IAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzKFBBQ0tFVDNfUkVMRUFTRV9NRU0sIDYp
KTsKIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAoUEFDS0VUM19SRUxFQVNFX01FTV9HQ1JfU0VR
IHwKIAkJCQkgUEFDS0VUM19SRUxFQVNFX01FTV9HQ1JfR0wyX1dCIHwKLQkJCQkgUEFDS0VUM19S
RUxFQVNFX01FTV9HQ1JfR0wyX0lOViB8Ci0JCQkJIFBBQ0tFVDNfUkVMRUFTRV9NRU1fR0NSX0dM
Ml9VUyB8Ci0JCQkJIFBBQ0tFVDNfUkVMRUFTRV9NRU1fR0NSX0dMMV9JTlYgfAotCQkJCSBQQUNL
RVQzX1JFTEVBU0VfTUVNX0dDUl9HTFZfSU5WIHwKLQkJCQkgUEFDS0VUM19SRUxFQVNFX01FTV9H
Q1JfR0xNX0lOViB8CisJCQkJIFBBQ0tFVDNfUkVMRUFTRV9NRU1fR0NSX0dMTV9JTlYgfCAvKiBt
dXN0IGJlIHNldCB3aXRoIEdMTV9XQiAqLwogCQkJCSBQQUNLRVQzX1JFTEVBU0VfTUVNX0dDUl9H
TE1fV0IgfAogCQkJCSBQQUNLRVQzX1JFTEVBU0VfTUVNX0NBQ0hFX1BPTElDWSgzKSB8CiAJCQkJ
IFBBQ0tFVDNfUkVMRUFTRV9NRU1fRVZFTlRfVFlQRShDQUNIRV9GTFVTSF9BTkRfSU5WX1RTX0VW
RU5UKSB8CiAJCQkJIFBBQ0tFVDNfUkVMRUFTRV9NRU1fRVZFTlRfSU5ERVgoNSkpKTsKIAlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCAoUEFDS0VUM19SRUxFQVNFX01FTV9EQVRBX1NFTCh3cml0ZTY0
Yml0ID8gMiA6IDEpIHwKIAkJCQkgUEFDS0VUM19SRUxFQVNFX01FTV9JTlRfU0VMKGludF9zZWwg
PyAyIDogMCkpKTsKIAogCS8qCiAJICogdGhlIGFkZHJlc3Mgc2hvdWxkIGJlIFF3b3JkIGFsaWdu
ZWQgaWYgNjRiaXQgd3JpdGUsIER3b3JkCiAJICogYWxpZ25lZCBpZiBvbmx5IHNlbmQgMzJiaXQg
ZGF0YSBsb3cgKGRpc2NhcmQgZGF0YSBoaWdoKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
