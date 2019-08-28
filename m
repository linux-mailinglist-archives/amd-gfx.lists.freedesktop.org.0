Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA03A0ADD
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6003F89EEB;
	Wed, 28 Aug 2019 19:56:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5A289EBB
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:51 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id y22so849901qkb.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FgAXXME7Fm/mM5M8CZ2oLAL17wvOT8Ny1UrhUj5+Xgs=;
 b=qrCuFppfO+/IzJJ+M6Bt52UT+zNP/2U4OyNZJAza6C2f9cH79aidMO8VXfjjaZgT6g
 uR+iZw9eUlF5VISjk/t/URJgWrNt271RfUoV284QS1ncnSefIZh+7ZSPaEx3FDWH/+cJ
 D0SUzS4oWgUtEi1UdBQ4QmZZPxuoEjKS2moRSGUE0AKvyLOegcPNWOHTT+jl7s7JdCAf
 wI7zi/tjUqwhF1T1MfP0mSDrd64NlxesJC4YJxZNy7dKmv8AN38LxIRN8LyuNsKH4j+C
 OHY5O1oxa7APNF4Ge3ymTh6FjdrsrRbJcMYEOxVNZrzr2o/eboF3iOjhPystNgbaapnP
 /nhg==
X-Gm-Message-State: APjAAAXk1bLlHek3b/bYdMiwW/DG27qVOGVjMMS4gvCAwWSQ8Ysqv28Y
 gSgrmWt+khdpgVoDAaugQUuVZOlx
X-Google-Smtp-Source: APXvYqxRuGXnEquQU63I59HkIl3KAm6X+ZKzK+nY8C3C/DACbCtNcvNn53aUi1EJg8ew68jQYh6fJQ==
X-Received: by 2002:a05:620a:13a4:: with SMTP id
 m4mr6029341qki.430.1567022210011; 
 Wed, 28 Aug 2019 12:56:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 17/23] drm/amd/display: add dal_asic_id for renoir
Date: Wed, 28 Aug 2019 14:56:16 -0500
Message-Id: <20190828195622.28941-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FgAXXME7Fm/mM5M8CZ2oLAL17wvOT8Ny1UrhUj5+Xgs=;
 b=uqgFdojctYnr7nhqEhJum1qP1200q2vHG3BFyT2SwI9HPPAcImVHr/nBvYYILxYWLi
 Ultk0oXCDEnM5AASe3FaZ2ofDAe9y+Q/eT4WiQT+Hv1WFyCYzR3hzid/gt2zp/CdUXjQ
 iLM4hh867gK3Dp+tD523A68jUtPxxgsH25gvx0lm1AtuElUCP1CKaNJLiXj/L4OnxVns
 xU1/sSF1X0GDenm4HrsjvfcT+/qmFFaZH6vTq1ZP7Gt74g/KZuBzmz33PSpFftD0KdLm
 REnuBP4eBp5DmgI9K/GcYkZ9fI8JzJKH0ypuXRv1EHOf3Prans43KUuTCcXQrRIYtoa5
 UKdw==
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

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpTaWdu
ZWQtb2ZmLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmggfCA1
ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmgKaW5kZXggZDJlMzgwZDhj
OWEwLi4xZjE2ODkyZjBhZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9pbmNsdWRlL2RhbF9hc2ljX2lkLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2luY2x1ZGUvZGFsX2FzaWNfaWQuaApAQCAtMTYyLDYgKzE2MiwxMSBAQCBlbnVtIHsKICNkZWZp
bmUgQVNJQ1JFVl9JU19OQVZJMTJfUChlQ2hpcFJldikgICAgICAgICgoZUNoaXBSZXYgPj0gTlZf
TkFWSTEyX1BfQTApICYmIChlQ2hpcFJldiA8IE5WX05BVkkxNF9NX0EwKSkKICNkZWZpbmUgQVNJ
Q1JFVl9JU19OQVZJMTRfTShlQ2hpcFJldikgICAgICAgICgoZUNoaXBSZXYgPj0gTlZfTkFWSTE0
X01fQTApICYmIChlQ2hpcFJldiA8IE5WX1VOS05PV04pKQogI2VuZGlmCisjaWYgZGVmaW5lZChD
T05GSUdfRFJNX0FNRF9EQ19EQ04yXzEpCisjZGVmaW5lIFJFTk9JUl9BMCAweDkxCisjZGVmaW5l
IERFVklDRV9JRF9SRU5PSVJfMTYzNiAweDE2MzYgICAvLyBSZW5vaXIKKyNkZWZpbmUgQVNJQ1JF
Vl9JU19SRU5PSVIoZUNoaXBSZXYpICgoZUNoaXBSZXYgPj0gUkVOT0lSX0EwKSAmJiAoZUNoaXBS
ZXYgPCAweEZGKSkKKyNlbmRpZgogCiAvKgogICogQVNJQyBjaGlwIElECi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
