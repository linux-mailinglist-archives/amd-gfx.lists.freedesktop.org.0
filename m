Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534C84907B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9421A6E081;
	Mon, 17 Jun 2019 19:50:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B403A6E071
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:38 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id s15so12291386qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6omSjc1Ak0Fz+Z9aj0cEZyJZC+Zneqx5yhKNbEKyecU=;
 b=RbLLPfF2g8G0r02BzghPZp8/rspEAb4fAB70LIjv9ulyD2T+wsiU7ajOSB+vgqC22W
 Uy+U1D50yOKP8vkvFxDbMhlbzWbK+DHkMcWGZTz9VUhO9aAR1Y3FyNqYwEqrGuRV/dWp
 fH3wlCPzOhgxksNtGFqe2AhhfGTU4ISJ+J9KUT0AKxZs8CaXGGFWqAI5YVSFu7tHlyra
 MRecNbtcL+S0rm4ILxudIVVCfOyrK7wiK5FGD285YqAowSuzybSNSspf5RQ30lDb3P/X
 DhLiDeoATSmKJZiR2hlp/1w1sdGKoJJ50KpCl5w7SquM/GG75f6X1QX7niINtjMmSQJT
 DS7A==
X-Gm-Message-State: APjAAAUX+APkcFXenPKImDyp9HXW3gLkJq2ayZ2uGD7LlwE1JAgMqFDB
 FTP/rQpZYg/hre0vRhHGfIdWdCnLYw8mkg==
X-Google-Smtp-Source: APXvYqxwgk0B3fxqRNoQvCI/LJNtt4ae/ItxqR/4lknGng50LBJvi4GVyxh1d8cg5kVMW6Msl8JKCg==
X-Received: by 2002:ac8:2d56:: with SMTP id o22mr45238141qta.171.1560801037320; 
 Mon, 17 Jun 2019 12:50:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 441/459] drm/amd/display: add support for forcing DCFCLK
 without affecting watermarks
Date: Mon, 17 Jun 2019 14:49:30 -0500
Message-Id: <20190617194948.18667-42-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6omSjc1Ak0Fz+Z9aj0cEZyJZC+Zneqx5yhKNbEKyecU=;
 b=iMtnqV6JcTH05ldbk80ZqEr+QcDizizNkZAljk4j1Z2I31q21aj+jPIXran6w2MK4g
 wUV+NTBMrSeldGb//CWLlTKhl+enixBR5b7cu3rxxb6z8/fTU8bowoqhES4MNFLGIYXI
 twuFcpn1y/3YJV/AHW9OdFcI22GkeMooVhzq2w7gx/JOWxdIUfqzlywLNFoPRBnLj/To
 qE7atH83dJYxJBo8m6X2zf9f5cvSEgcTQ8xDOMOpFFg11kuO976/+9EZGePptUv0KZr6
 pfi3YmAiWUmsLsR+aOP1CKFXwGPZyPn1xNordEz0NFpJScKbbQIEmjLHJshUrlOrupJp
 DV8g==
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KdXNlZnVsIGZvciBkZWJ1Z2dp
bmcKCltob3ddCnBsdW1iIGEgZGVidWcgb3B0aW9uIGluIGRjCgpTaWduZWQtb2ZmLWJ5OiBKdW4g
TGVpIDxKdW4uTGVpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5n
QGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNu
MjBfY2xrX21nci5jICB8IDQgKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
LmggICAgICAgICAgICAgICAgICAgICAgIHwgOCArKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jCmluZGV4IGRlNDcxY2E4N2Vk
Ny4uZTNjMWRlYmYyNTk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jCkBAIC0xNzIsNiArMTcy
LDEwIEBAIHZvaWQgZGNuMl91cGRhdGVfY2xvY2tzKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdyX2Jh
c2UsCiAJCQlwcF9zbXUtPnNldF92b2x0YWdlX2J5X2ZyZXEoJnBwX3NtdS0+cHBfc211LCBQUF9T
TVVfTlZfUEhZQ0xLLCBjbGtfbWdyX2Jhc2UtPmNsa3MucGh5Y2xrX2toeiAvIDEwMDApOwogCX0K
IAorCWlmIChkYy0+ZGVidWcuZm9yY2VfbWluX2RjZmNsa19taHogPiAwKQorCQluZXdfY2xvY2tz
LT5kY2ZjbGtfa2h6ID0gKG5ld19jbG9ja3MtPmRjZmNsa19raHogPiAoZGMtPmRlYnVnLmZvcmNl
X21pbl9kY2ZjbGtfbWh6ICogMTAwMCkpID8KKwkJCQluZXdfY2xvY2tzLT5kY2ZjbGtfa2h6IDog
KGRjLT5kZWJ1Zy5mb3JjZV9taW5fZGNmY2xrX21oeiAqIDEwMDApOworCiAJaWYgKHNob3VsZF9z
ZXRfY2xvY2soc2FmZV90b19sb3dlciwgbmV3X2Nsb2Nrcy0+ZGNmY2xrX2toeiwgY2xrX21ncl9i
YXNlLT5jbGtzLmRjZmNsa19raHopKSB7CiAJCWNsa19tZ3JfYmFzZS0+Y2xrcy5kY2ZjbGtfa2h6
ID0gbmV3X2Nsb2Nrcy0+ZGNmY2xrX2toejsKIAkJaWYgKHBwX3NtdSAmJiBwcF9zbXUtPnNldF9o
YXJkX21pbl9kY2ZjbGtfYnlfZnJlcSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5k
ZXggNTNhMzg3Njg0MWNjLi44MGMxMThmMGQ2ZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kYy5oCkBAIC0zNjksNiArMzY5LDEwIEBAIHN0cnVjdCBkY19kZWJ1Z19vcHRpb25zIHsKICNp
ZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAogCWJvb2wgZGlzYWJsZV9mZWM7CiAj
ZW5kaWYKKwkvKiBUaGlzIGZvcmNlcyBhIGhhcmQgbWluIG9uIHRoZSBEQ0ZDTEsgcmVxdWVzdGVk
IHRvIFNNVS9QUAorCSAqIHdhdGVybWFya3MgYXJlIG5vdCBhZmZlY3RlZC4KKwkgKi8KKwl1bnNp
Z25lZCBpbnQgZm9yY2VfbWluX2RjZmNsa19taHo7CiB9OwogCiBzdHJ1Y3QgZGNfZGVidWdfZGF0
YSB7CkBAIC00MTgsNiArNDIyLDEwIEBAIHN0cnVjdCBkY19ib3VuZGluZ19ib3hfb3ZlcnJpZGVz
IHsKIAlpbnQgdXJnZW50X2xhdGVuY3lfbnM7CiAJaW50IHBlcmNlbnRfb2ZfaWRlYWxfZHJhbWJ3
OwogCWludCBkcmFtX2Nsb2NrX2NoYW5nZV9sYXRlbmN5X25zOworCS8qIFRoaXMgZm9yY2VzIGEg
aGFyZCBtaW4gb24gdGhlIERDRkNMSyB3ZSB1c2UKKwkgKiBmb3IgRE1MLiAgVW5saWtlIHRoZSBk
ZWJ1ZyBvcHRpb24gZm9yIGZvcmNpbmcKKwkgKiBEQ0ZDTEssIHRoaXMgb3ZlcnJpZGUgYWZmZWN0
cyB3YXRlcm1hcmsgY2FsY3VsYXRpb25zCisJICovCiAJaW50IG1pbl9kY2ZjbGtfbWh6OwogfTsK
IAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
