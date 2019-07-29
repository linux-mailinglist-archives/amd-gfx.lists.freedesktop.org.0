Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583E279991
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1324B6E29E;
	Mon, 29 Jul 2019 20:15:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1036E293
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:44 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id m8so41943716vsj.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ii6GYpOhMqUIz2TRHq1BYXvRnFCN5ErckndlxTV7ZRo=;
 b=Wgf8ldNsGP4kbC40ybzRYHty4Lm6XxB02igJ6NqlikhY7z9JsEnQ95fqoNiUiolY4U
 LgsfhtMOzeEltvU1gpEAwTpWBNAYfwOQ+yTNB9vV4b1V3gbZkvI2P/c3aP8q0xDomcHV
 BZBJr9FsEIJYlfJ54V33JFzbLPMbh55qVD2DkBwSBTv0D9LS+Frll4WWJtQQpXLXYnop
 TdWam9sUMRfbCqsLt+fHGwH0VQsZJW9FBN7krpxGnZ2hzW8uVv2jqkdqG/B1GA0LiwiT
 mJPK3uyk+jRXRJgk6FuhKoVWxeu7yQcgRND62yJxawWvrVtk0e0rcCWZoIGmmcxLRQtW
 glSg==
X-Gm-Message-State: APjAAAVndbMXOKRQ8E2phNsVMSGKxdOTkaVheFru/z1CLUG2MmIGG8WS
 +vBgbVV6ki/rITy/csFbipAxBBWo
X-Google-Smtp-Source: APXvYqyxVmX7I/fHWk5WZLQ06Ain9lxnX3cFh/e0gPFZxY1t9LWBAXSVVViS1j2GQuQeE9LWNqUesQ==
X-Received: by 2002:a67:e3d5:: with SMTP id k21mr10893298vsm.172.1564431342911; 
 Mon, 29 Jul 2019 13:15:42 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 25/30] drm/amd/powerplay: fix arcturus real-time clock
 frequency retrieval
Date: Mon, 29 Jul 2019 15:15:03 -0500
Message-Id: <20190729201508.16136-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ii6GYpOhMqUIz2TRHq1BYXvRnFCN5ErckndlxTV7ZRo=;
 b=mk4GtG1RlddLtn2jOj1rqWcN5FNvavNo4G32/NciGVIYIsnnsOtp2BRVhTeMmzb1WO
 5IZDd7XpxUZUEq6DgrcDdBpewMb3qZZ/TIKA89CpyxDfs77I8SkwkXyD4aW4ldfpJxHd
 8z/PYTn59qsKUxuXVBfLC9gCMUm0kLlanYVrOP5wqNZhFtTHizLxl7DIacEsXRcT3+JL
 dn3EBFR7KaQEn+JIOW3TXEjkn6kX3mQ9qL744R0Xo9q88jYWAYtx5i58iLCdfS1h5rst
 r1hK4Bh9HqHzDRmglLRY2i0Z7s42eha7W9I4TebQXpyfe4YUM50Ghr509RVgKqYp9DxJ
 YBFw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCk1ha2Ugc3VyZSB3ZSBjYW4gc3Rp
bGwgZ2V0IHRoZSBhY2N1cmF0ZSBnZnhjbGsvdWNsay9zb2NjbGsgZnJlcXVlbmN5CmV2ZW4gb24g
ZHBtIGRpc2FibGVkLgoKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDMwICsrKysrKysr
KysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVz
X3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKaW5k
ZXggMzAzMTdjZjlkYzlhLi4xYjZkNDFjMjQ2MmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCkBAIC0xMDUzLDcgKzEwNTMsMzUgQEAgc3RhdGljIGlu
dCBhcmN0dXJ1c19nZXRfY3VycmVudF9jbGtfZnJlcV9ieV90YWJsZShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JKnZhbHVlID0gbWV0cmljcy5D
dXJyQ2xvY2tbY2xrX2lkXTsKKwlzd2l0Y2ggKGNsa19pZCkgeworCWNhc2UgUFBDTEtfR0ZYQ0xL
OgorCQkvKgorCQkgKiBDdXJyQ2xvY2tbY2xrX2lkXSBjYW4gcHJvdmlkZSBhY2N1cmF0ZQorCQkg
KiAgIG91dHB1dCBvbmx5IHdoZW4gdGhlIGRwbSBmZWF0dXJlIGlzIGVuYWJsZWQuCisJCSAqIFdl
IGNhbiB1c2UgQXZlcmFnZV8qIGZvciBkcG0gZGlzYWJsZWQgY2FzZS4KKwkJICogICBCdXQgdGhp
cyBpcyBhdmFpbGFibGUgZm9yIGdmeGNsay91Y2xrL3NvY2Nsay4KKwkJICovCisJCWlmIChzbXVf
ZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfRFBNX0dGWENMS19CSVQpKQorCQkJ
KnZhbHVlID0gbWV0cmljcy5DdXJyQ2xvY2tbUFBDTEtfR0ZYQ0xLXTsKKwkJZWxzZQorCQkJKnZh
bHVlID0gbWV0cmljcy5BdmVyYWdlR2Z4Y2xrRnJlcXVlbmN5OworCQlicmVhazsKKwljYXNlIFBQ
Q0xLX1VDTEs6CisJCWlmIChzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVf
RFBNX1VDTEtfQklUKSkKKwkJCSp2YWx1ZSA9IG1ldHJpY3MuQ3VyckNsb2NrW1BQQ0xLX1VDTEtd
OworCQllbHNlCisJCQkqdmFsdWUgPSBtZXRyaWNzLkF2ZXJhZ2VVY2xrRnJlcXVlbmN5OworCQli
cmVhazsKKwljYXNlIFBQQ0xLX1NPQ0NMSzoKKwkJaWYgKHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQo
c211LCBTTVVfRkVBVFVSRV9EUE1fU09DQ0xLX0JJVCkpCisJCQkqdmFsdWUgPSBtZXRyaWNzLkN1
cnJDbG9ja1tQUENMS19TT0NDTEtdOworCQllbHNlCisJCQkqdmFsdWUgPSBtZXRyaWNzLkF2ZXJh
Z2VTb2NjbGtGcmVxdWVuY3k7CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCSp2YWx1ZSA9IG1ldHJp
Y3MuQ3VyckNsb2NrW2Nsa19pZF07CisJCWJyZWFrOworCX0KIAogCXJldHVybiByZXQ7CiB9Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
