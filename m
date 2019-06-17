Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BCD4907C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B23A6E07F;
	Mon, 17 Jun 2019 19:50:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B71C6E07F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:49 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m29so12343215qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3HqGI0wBsYMDJnzyN4s1pjRV25dQ4x40vgBwnw4szc=;
 b=DNYO/F4TEL3OnyGlQXHvKEcpqtcQ5vuk1F/WFufEoUXjlVkQpMGcRUWfpS+fpU0NV2
 Oq5c4ZFf3AIcP3FtHCBBGcGhFvKU+olk2UjRuIfiN1G3kpIl8eK7qPYk3mpGDpSJUveP
 apKTZYVysxt5Q0ZmQw84LrT5mnpKR9yT0J+OnHOso2L1VFIcs2Jp4+4hTrNeeDYtXjPF
 kQn8usmzFmfxnRAHe/beEWap/9iOeT4ml6WvPEazu70M0Jffr21XzXvpwBbgaFrxtEYi
 3UVz0rJ/59vyGHL7zOsfw7jtn7XpuWkKFzS2Yecz1s8K3U0MzJrGuJGueUJpqbMTE+lk
 SCnQ==
X-Gm-Message-State: APjAAAXlH8UL6yG7LwEngGSCtwB2cmZYCci1OcHC8rYenPY0Yusyb/GL
 uSFxzGiMI1RHailJHoPAEG69mjjl3e7Fhw==
X-Google-Smtp-Source: APXvYqxMpwgaj3hJWeIcoBHVm4dggVf8aDNBWJgDqIh1mPSFxePvdmhWzI68Dz9lk5NLUeiZjM4p0w==
X-Received: by 2002:ac8:ce:: with SMTP id d14mr53525461qtg.149.1560801047860; 
 Mon, 17 Jun 2019 12:50:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 451/459] drm/amd/display: update DCN2 uclk switch time
Date: Mon, 17 Jun 2019 14:49:40 -0500
Message-Id: <20190617194948.18667-52-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3HqGI0wBsYMDJnzyN4s1pjRV25dQ4x40vgBwnw4szc=;
 b=emi4MmZjvqy/otnY8cLlqode1qORueGHh7f726SyqRKMhSYR3Ihzs9vOso91UWk+dK
 MNCuWUTmnSOsSLenvahN3amqbzEzINTh4mnM76442lFWd614trJxN469aXADFg/vKLAt
 j1jrUMQxiqEbi91rbaNylP9JvtMIIKE1cEy8vbpCmlGi4ErgeiHTFENdRVOig0BlumOT
 tY1I9G2gIy7v3YAtjox77bfSGLBo7LhmlRu1GNt8zPaV49P/G5eHk5r/xNumOiIhcMaa
 boWP80VrBnHqILBJfVSmPPFHsHGqx6OpYRpCd+0STZZQLRwtLfEzgpSpGT5qg4qh9vEV
 HqnQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KdmFsdWUgY29tbWl0ZWQgdG8g
YnkgSFcgdGVhbSBpcyBnb2luZyB0byBiZSBoaWdoZXIKdGhhbiBwcmUtc2lsaWNvbiwgYW5kIHdp
bGwgY2F1c2UgdW5kZXJmbG93IGlmIGRyaXZlciBub3QKdXBkYXRlZAoKW2hvd10KdXBkYXRlIGhh
cmRjb2RlZCB2YWx1ZSwgdXBkYXRlIHBzdGF0ZSBzd2l0Y2hpbmcgbG9naWMKdG8gZml4IGNhc2Ug
d2hlcmUgd2l0aCBsb25nIHVjbGsgdGltZSB3ZSB3b24ndCBhbGxvdyBzd2l0Y2gKZXZlbiB3aGVu
IHdlIHNob3VsZAoKU2lnbmVkLW9mZi1ieTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpSZXZp
ZXdlZC1ieTogRXJpYyBZYW5nIDxlcmljLnlhbmcyQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5w
cmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jICB8IDggKysrLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21ncl9pbnRlcm5hbC5o
ICB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21n
ci9kY24yMC9kY24yMF9jbGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKaW5kZXggZTNjMWRlYmYyNTk3Li42ZjAxODMw
ZmMwMjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdy
L2RjbjIwL2RjbjIwX2Nsa19tZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKQEAgLTE5NSwxMiArMTk1LDEwIEBAIHZv
aWQgZGNuMl91cGRhdGVfY2xvY2tzKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdyX2Jhc2UsCiAJCQlw
cF9zbXUtPnNldF9oYXJkX21pbl9zb2NjbGtfYnlfZnJlcSgmcHBfc211LT5wcF9zbXUsIGNsa19t
Z3JfYmFzZS0+Y2xrcy5zb2NjbGtfa2h6IC8gMTAwMCk7CiAJfQogCi0JaWYgKCFzYWZlX3RvX2xv
d2VyICYmIHBwX3NtdSAmJiBwcF9zbXUtPnNldF9wc3RhdGVfaGFuZHNoYWtlX3N1cHBvcnQpIHsK
LQkJY2xrX21ncl9iYXNlLT5jbGtzLnBfc3RhdGVfY2hhbmdlX3N1cHBvcnQgPSBmYWxzZTsKLQkJ
cHBfc211LT5zZXRfcHN0YXRlX2hhbmRzaGFrZV9zdXBwb3J0KCZwcF9zbXUtPnBwX3NtdSwgZmFs
c2UpOwotCX0gZWxzZSBpZiAoc2FmZV90b19sb3dlciAmJiBwcF9zbXUgJiYgcHBfc211LT5zZXRf
cHN0YXRlX2hhbmRzaGFrZV9zdXBwb3J0KSB7CisJaWYgKHNob3VsZF91cGRhdGVfcHN0YXRlX3N1
cHBvcnQoc2FmZV90b19sb3dlciwgbmV3X2Nsb2Nrcy0+cF9zdGF0ZV9jaGFuZ2Vfc3VwcG9ydCwg
Y2xrX21ncl9iYXNlLT5jbGtzLnBfc3RhdGVfY2hhbmdlX3N1cHBvcnQpKSB7CiAJCWNsa19tZ3Jf
YmFzZS0+Y2xrcy5wX3N0YXRlX2NoYW5nZV9zdXBwb3J0ID0gbmV3X2Nsb2Nrcy0+cF9zdGF0ZV9j
aGFuZ2Vfc3VwcG9ydDsKLQkJcHBfc211LT5zZXRfcHN0YXRlX2hhbmRzaGFrZV9zdXBwb3J0KCZw
cF9zbXUtPnBwX3NtdSwgY2xrX21ncl9iYXNlLT5jbGtzLnBfc3RhdGVfY2hhbmdlX3N1cHBvcnQp
OworCQlpZiAocHBfc211ICYmIHBwX3NtdS0+c2V0X3BzdGF0ZV9oYW5kc2hha2Vfc3VwcG9ydCkK
KwkJCXBwX3NtdS0+c2V0X3BzdGF0ZV9oYW5kc2hha2Vfc3VwcG9ydCgmcHBfc211LT5wcF9zbXUs
IGNsa19tZ3JfYmFzZS0+Y2xrcy5wX3N0YXRlX2NoYW5nZV9zdXBwb3J0KTsKIAl9CiAKIAlpZiAo
c2hvdWxkX3NldF9jbG9jayhzYWZlX3RvX2xvd2VyLCBuZXdfY2xvY2tzLT5kcmFtY2xrX2toeiwg
Y2xrX21ncl9iYXNlLT5jbGtzLmRyYW1jbGtfa2h6KSkgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2Nsa19tZ3JfaW50ZXJuYWwuaAppbmRleCBj
MzIyZTQ2OTcyNDIuLjA4MzVhYzA0MWFjZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmgKQEAgLTI3NCw2ICsy
NzQsMTIgQEAgc3RhdGljIGlubGluZSBib29sIHNob3VsZF9zZXRfY2xvY2soYm9vbCBzYWZlX3Rv
X2xvd2VyLCBpbnQgY2FsY19jbGssIGludCBjdXJfY2wKIAlyZXR1cm4gKChzYWZlX3RvX2xvd2Vy
ICYmIGNhbGNfY2xrIDwgY3VyX2NsaykgfHwgY2FsY19jbGsgPiBjdXJfY2xrKTsKIH0KIAorc3Rh
dGljIGlubGluZSBib29sIHNob3VsZF91cGRhdGVfcHN0YXRlX3N1cHBvcnQoYm9vbCBzYWZlX3Rv
X2xvd2VyLCBib29sIGNhbGNfc3VwcG9ydCwgYm9vbCBjdXJfc3VwcG9ydCkKK3sKKwkvLyBXaGVu
ZXZlciB3ZSBhcmUgdHJhbnNpdGlvbmluZyBwc3RhdGUgc3VwcG9ydCwgd2UgYWx3YXlzIHdhbnQg
dG8gbm90aWZ5IHByaW9yIHRvIGNvbW1pdHRpbmcgc3RhdGUKKwlyZXR1cm4gKGNhbGNfc3VwcG9y
dCAhPSBjdXJfc3VwcG9ydCkgPyAhc2FmZV90b19sb3dlciA6IGZhbHNlOworfQorCiBpbnQgY2xr
X21ncl9oZWxwZXJfZ2V0X2FjdGl2ZV9kaXNwbGF5X2NudCgKIAkJc3RydWN0IGRjICpkYywKIAkJ
c3RydWN0IGRjX3N0YXRlICpjb250ZXh0KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
