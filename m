Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E44A0AE3
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8AE89F08;
	Wed, 28 Aug 2019 19:57:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5937C89EBB
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:50 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id f10so872938qkg.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBIvMdQ3kwclGEI3WaSWcxDLxMcVzelZHM0N/oaGdRY=;
 b=bIpdoH+eezy/DXQzg3n4egR2tyfUENGbxtU/eK+6MsHuwwj2PSYefQv4vJJ+ww6OYQ
 J6i17iUjDbAARbGL77PqgHd0sNeW7Kmmv/pqv4jj76eKkDUlVe2HVd3x3VQmpq4fnuDR
 kPEt1VU8+ug457wqdlmv5llnw6xfLk24B+VA8/Z9E+cOcVUdY91j3DeZEyeGcCfoTwfA
 RnuchCBpngjWdvveVhKp7J8jMQAPZBulF6M6igz9Gr/YoQs/GJuia+Q1FdlNPnuDOv7j
 +id93pUBmVBWShUhovHQ1RTGxgA8rwwkYd5lap98uFA6XUyVUWloLQYpS8jSDFpoid6e
 WtZg==
X-Gm-Message-State: APjAAAWVFu9Dt/wiag+OYeQf0GQ2sE7/2EL0jq4uNIy3UVCpftf1kHbQ
 d2Ox8Zas2u+9mMTJVnVZ7IQr5bOO
X-Google-Smtp-Source: APXvYqwt3ZfIWtBNlhaQcXhYOc2YcHwXJULktEV8c8ZTh9jdAnzPRHKtvhUGIyEWMein1vNb51xsWw==
X-Received: by 2002:a37:660d:: with SMTP id a13mr5991070qkc.36.1567022209223; 
 Wed, 28 Aug 2019 12:56:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 16/23] drm/amd/display: call update_bw_bounding_box
Date: Wed, 28 Aug 2019 14:56:15 -0500
Message-Id: <20190828195622.28941-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBIvMdQ3kwclGEI3WaSWcxDLxMcVzelZHM0N/oaGdRY=;
 b=sy3IV0QWM/GRjIYVBEu+w99MGyG9TXVy5HmlKgIL1V9zRv/P63Q3V4nV2zsLH2nTvQ
 ML1zmcUwPiGEfbXO5ce5YOlK5NLbN1xH4UAYo5uH+iLB6MwdReamoIOK4B1drFxDzgm6
 3SBuqY/hez6lc8FwyecWOvNoR6yw6yHJeapp4yx8Ml92UZCmgf5Gwjdey5XUlt5AKGrF
 TAC+72JjSp1hhqZPgDO3hgf6tUAqz+K2Y1MsXt7WT5B0+94g0XkrxbWxxJhJ6+z7GGyJ
 Ou1Uk6IqVvrmW5CyKVdHaXEhJVe6nNlc5qJyvNjPnp4w59/TAhOeXG0l8kdYlVXbFyHN
 gKcw==
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
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpjYWxs
IHVwZGF0ZV9id19ib3VuZGluZ19ib3ggaW4gREMgY29uc3RydWN0CgpTaWduZWQtb2ZmLWJ5OiBC
aGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAgICAgIHwgNSArKysrKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmggfCA1ICsrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYwppbmRleCBlNDZhYWZmNTVmYjkuLjAwZTM2NzkwMjRmYyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCkBAIC02ODYsNiArNjg2LDExIEBAIHN0
YXRpYyBib29sIGNvbnN0cnVjdChzdHJ1Y3QgZGMgKmRjLAogCWlmICghZGMtPmNsa19tZ3IpCiAJ
CWdvdG8gZmFpbDsKIAorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMQorCWlmIChkYy0+
cmVzX3Bvb2wtPmZ1bmNzLT51cGRhdGVfYndfYm91bmRpbmdfYm94KQorCQlkYy0+cmVzX3Bvb2wt
PmZ1bmNzLT51cGRhdGVfYndfYm91bmRpbmdfYm94KGRjLCBkYy0+Y2xrX21nci0+YndfcGFyYW1z
KTsKKyNlbmRpZgorCiAJLyogQ3JlYXRpb24gb2YgY3VycmVudF9zdGF0ZSBtdXN0IG9jY3VyIGFm
dGVyIGRjLT5kbWwKIAkgKiBpcyBpbml0aWFsaXplZCBpbiBkY19jcmVhdGVfcmVzb3VyY2VfcG9v
bCBiZWNhdXNlCiAJICogb24gY3JlYXRpb24gaXQgY29waWVzIHRoZSBjb250ZW50cyBvZiBkYy0+
ZG1sCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVf
dHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvY29yZV90eXBlcy5o
CmluZGV4IGRmMjhmYmM0YzYzYy4uODcyNmJkN2RkOTEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVfdHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVfdHlwZXMuaApAQCAtMTQyLDYgKzE0MiwxMSBAQCBz
dHJ1Y3QgcmVzb3VyY2VfZnVuY3MgewogCQkJZGlzcGxheV9lMmVfcGlwZV9wYXJhbXNfc3QgKnBp
cGVzLAogCQkJaW50IHBpcGVfY250KTsKICNlbmRpZgorI2lmIGRlZmluZWQoQ09ORklHX0RSTV9B
TURfRENfRENOMl8xKQorCXZvaWQgKCp1cGRhdGVfYndfYm91bmRpbmdfYm94KSgKKwkJCXN0cnVj
dCBkYyAqZGMsCisJCQlzdHJ1Y3QgY2xrX2J3X3BhcmFtcyAqYndfcGFyYW1zKTsKKyNlbmRpZgog
CiB9OwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
