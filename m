Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F467998F
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A34B6E29F;
	Mon, 29 Jul 2019 20:15:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EDE6E296
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:43 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id h28so41853503vsl.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RdiGA5Y1b0u6bLmqp1GBVBPGdM69K9WPAZ3yDWpAHUQ=;
 b=FHbprkS1Q8s3d0t6PHSqSMsi2JPtzDYWse+O55HFUgAoNXdvurSO0ntt0ggmE9+3cS
 kI8RG8xZAA/1+b1AOSfBWcmF5Q5fAbh/puyev1puy1VYVxKsllLPSMgyEjnsCIIZt7v4
 5qP9MtM9eloPnPAfNNAyWWwkdb8Rtf7o5qoydNR2ihLiQwZQDTDTdyckKpmU/cZFugVm
 wY67rM/6VBIho4jeXR5CsLi9sLrms5wGZIRORr6JQURadf3r8OI+Vr+ecaKbYM21meBd
 /vmdVnuciJu7BTmxxhF4eO/FTqgV3SJrA6mSJPrjBZXT/udj+UQA35RGJiJPSDfOzwXT
 neaQ==
X-Gm-Message-State: APjAAAUZhsumGXoRL9uVhEJprEINieg8YQ0KN197KJuq/AW4jZI1QgFQ
 CFk3UrO2mtCSdP3KhaICx4Q8ofr/
X-Google-Smtp-Source: APXvYqy5/+4r4UWcOv8UfmtKlzW/8OlSe+qb3wIuC2HORqpqc2wsrXxXY8S+aPiNGcZlwrfxCTp6QA==
X-Received: by 2002:a67:ff0b:: with SMTP id v11mr35781475vsp.14.1564431342004; 
 Mon, 29 Jul 2019 13:15:42 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 24/30] drm/amd/powerplay: remove redundancy debug log in smu
Date: Mon, 29 Jul 2019 15:15:02 -0500
Message-Id: <20190729201508.16136-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RdiGA5Y1b0u6bLmqp1GBVBPGdM69K9WPAZ3yDWpAHUQ=;
 b=e1/RKc51BlmyEiqo11OHJe2WO+6EcWCvYLzdXwgDIL0Ch/forSSngDayztcJ9vGysu
 WkR+k1zVWJ6LL06+lemsFlaSG7nxhIIr7hE+3+tiSQkzqlBRbIYt8do9OdLvELag29uw
 lGTkXadIn9+ykhoS0E3w+Uu9BTzxldhcny/FhC0Y+325X0bGC7wSHUc6Y2jD5p1Y0OAN
 SP86lX3oS0Z2gb0kVRzecTKhfbHC92LwHK5V7ln19IUHOGusDTAgW/Xb1xQubvz3ELcn
 +/AtVW1OQzJwzGKIl4Gaqh0D5Co17b23Ac4xT77Uywn5TBc0V0LeowUyeMggjUTk7h0C
 AuUw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnJlbW92ZSByZWR1bmRhY3kg
ZGVidWcgbG9nIGluIHNtdS4KZWc6ClsgNjg5Ny45Njk0NDddIGFtZGdwdTogW3Bvd2VycGxheV0g
c211IDExIGNsayBkcG0gZmVhdHVyZSAxIGlzIG5vdCBlbmFibGVkClsgNjg5Ny45Njk0NDhdIGFt
ZGdwdTogW3Bvd2VycGxheV0gc211IDExIGNsayBkcG0gZmVhdHVyZSAxIGlzIG5vdCBlbmFibGVk
ClsgNjg5Ny45Njk0NDhdIGFtZGdwdTogW3Bvd2VycGxheV0gc211IDExIGNsayBkcG0gZmVhdHVy
ZSAxIGlzIG5vdCBlbmFibGVkClsgNjg5OS4wMjQxMTRdIGFtZGdwdTogW3Bvd2VycGxheV0gVW5z
dXBwb3J0ZWQgU01VIG1lc3NhZ2U6IDM4ClsgNjg5OS4wMjQxNTFdIGFtZGdwdTogW3Bvd2VycGxh
eV0gc211IDExIGNsayBkcG0gZmVhdHVyZSAxIGlzIG5vdCBlbmFibGVkClsgNjg5OS4wMjQxNTFd
IGFtZGdwdTogW3Bvd2VycGxheV0gc211IDExIGNsayBkcG0gZmVhdHVyZSAxIGlzIG5vdCBlbmFi
bGVkClsgNjg5OS4wMjQxNTJdIGFtZGdwdTogW3Bvd2VycGxheV0gc211IDExIGNsayBkcG0gZmVh
dHVyZSAxIGlzIG5vdCBlbmFibGVkClsgNjkwMC4wNzgyOTZdIGFtZGdwdTogW3Bvd2VycGxheV0g
VW5zdXBwb3J0ZWQgU01VIG1lc3NhZ2U6IDM4ClsgNjkwMC4wNzgzMzJdIGFtZGdwdTogW3Bvd2Vy
cGxheV0gc211IDExIGNsayBkcG0gZmVhdHVyZSAxIGlzIG5vdCBlbmFibGVkClsgNjkwMC4wNzgz
MzJdIGFtZGdwdTogW3Bvd2VycGxheV0gc211IDExIGNsayBkcG0gZmVhdHVyZSAxIGlzIG5vdCBl
bmFibGVkClsgNjkwMC4wNzgzMzNdIGFtZGdwdTogW3Bvd2VycGxheV0gc211IDExIGNsayBkcG0g
ZmVhdHVyZSAxIGlzIG5vdCBlbmFibGVkClsgNjkwMS4xMzMyMzBdIGFtZGdwdTogW3Bvd2VycGxh
eV0gVW5zdXBwb3J0ZWQgU01VIG1lc3NhZ2U6IDM4CgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5n
IDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRo
LmZlbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVz
X3BwdC5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVy
dXNfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwpp
bmRleCBlYWNhMDM4MWU4YmQuLjMwMzE3Y2Y5ZGM5YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKQEAgLTE4MSwxMCArMTgxLDggQEAgc3RhdGljIGlu
dCBhcmN0dXJ1c19nZXRfc211X21zZ19pbmRleChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtYywgdWlu
dDMyX3QgaW5kZXgpCiAJCXJldHVybiAtRUlOVkFMOwogCiAJbWFwcGluZyA9IGFyY3R1cnVzX21l
c3NhZ2VfbWFwW2luZGV4XTsKLQlpZiAoIShtYXBwaW5nLnZhbGlkX21hcHBpbmcpKSB7Ci0JCXBy
X3dhcm4oIlVuc3VwcG9ydGVkIFNNVSBtZXNzYWdlOiAlZFxuIiwgaW5kZXgpOworCWlmICghKG1h
cHBpbmcudmFsaWRfbWFwcGluZykpCiAJCXJldHVybiAtRUlOVkFMOwotCX0KIAogCXJldHVybiBt
YXBwaW5nLm1hcF90bzsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
