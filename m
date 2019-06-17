Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430FB48EEC
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289FE89A98;
	Mon, 17 Jun 2019 19:28:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0440289AB3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:26 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id t8so6967714qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s0SB2stxC45nP1Gnmrg5Ka52RS/xgrkg6bm4BeIbjF4=;
 b=CptFSy6rXukhP9ZlLtDSW/U1qg/ZJLTarxJorWImYQiVTYHQGDPc3sb8tX+vVJM4aK
 PZWngyYZH0Oua6wupVUoNPpSI4pbF5F8KHkreTlMOk3m0FmHF7s8h2+q1xfVKlkAJAYz
 c109jgv+ZnM39BuWxbw8aG6o8HpulnaYZf3jMe5/U3TleQcbA74aplRF6S3lL6kAM1LO
 ZZcs5ubeHBYx1g7uLw2pn3SnO/t2KAzR63mZCHCFN3llrM0w0Ns3ORju9tOrqPxRGOEL
 GUJrCSkj4M2dXn1l1ce7VSA6RowuPZfkcwm90MkKCHB0pyNC7hUkekpDMJvRKxVCk5wT
 T2gA==
X-Gm-Message-State: APjAAAUfSd9Yf/nuzsKgGFo26LCBNc389KTxCxdacHKFjH94omvkQ+MQ
 3fY3P5p842ev7G87KFkaBSvT4FGE9dQ=
X-Google-Smtp-Source: APXvYqx70E6OgGux9/jd/eU8XskG8TMsk0UsaCbwyi0SwqU93W8cp1GCKFHR5bDaFMxs4i+R6vRszA==
X-Received: by 2002:a37:8741:: with SMTP id j62mr20326965qkd.78.1560799704189; 
 Mon, 17 Jun 2019 12:28:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 177/459] drm/amd/powerplay/smu11: remove
 smu_update_table_with_arg
Date: Mon, 17 Jun 2019 14:26:42 -0500
Message-Id: <20190617192704.18038-78-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s0SB2stxC45nP1Gnmrg5Ka52RS/xgrkg6bm4BeIbjF4=;
 b=nC8jt2QuPZl6ebuAO6pYxSUmrNlrUG4sncLnsvluZZsU1GtpGG/H8HGkivM1xUv0ax
 ptV0dYMm6+jXpww2bWPNQasPxFrlsg5ZNxupoEB6pHyeK2EX6ewfxqqGTXg45FKX1sON
 Hbl/uH8J8NRI9rIpVY69148/0jeDrLBeSjWQcZNvWAxPc7Z9hkGNMoXrQrOdM/H0j9TK
 zlbjR4GWLB88lWhGbjaOxCT3Tof6kLYMPWV5OExQsSfvz457TCX6TqZRHRYOQj3UnBcI
 i0jgVJeDZisUgolPsyuFvsOwWVRYt1IrmX+ONqLufgfMYRdtayWTg4q7sdJK5Ivjl3WX
 RpCg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm90aGluZyB3YXMgdXNpbmcgaXQuICBKdXN0IHJlcGxhY2Ugd2l0aCBzbXVfdXBkYXRlX3RhYmxl
CndoaWNoIGlzIHdoYXQgZXZlcnl0aGluZyB3YXMgdXNpbmcgdmlhIGEgd3JhcHBlciBhbnl3YXku
CgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jICAgICB8IDYg
KystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oIHwg
NCArLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKaW5kZXggOTllMTAz
MTNhZmEyLi44YmI3OGZkYzc4MmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
bWRncHVfc211LmMKQEAgLTEyNywxOSArMTI3LDE3IEBAIGludCBzbXVfY29tbW9uX3JlYWRfc2Vu
c29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9wcF9zZW5zb3JzIHNlbnNvciwK
IAlyZXR1cm4gcmV0OwogfQogCi1pbnQgc211X3VwZGF0ZV90YWJsZV93aXRoX2FyZyhzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgdGFibGVfaWQsIHVpbnQxNl90IGV4YXJnLAoraW50
IHNtdV91cGRhdGVfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IHRhYmxl
X2luZGV4LAogCQkgICAgIHZvaWQgKnRhYmxlX2RhdGEsIGJvb2wgZHJ2MnNtdSkKIHsKIAlzdHJ1
Y3Qgc211X3RhYmxlX2NvbnRleHQgKnNtdV90YWJsZSA9ICZzbXUtPnNtdV90YWJsZTsKIAlzdHJ1
Y3Qgc211X3RhYmxlICp0YWJsZSA9IE5VTEw7CiAJaW50IHJldCA9IDA7Ci0JdWludDMyX3QgdGFi
bGVfaW5kZXg7CisJaW50IHRhYmxlX2lkID0gdGFibGVfaW5kZXggJiAweGZmZmY7CiAKIAlpZiAo
IXRhYmxlX2RhdGEgfHwgdGFibGVfaWQgPj0gc211X3RhYmxlLT50YWJsZV9jb3VudCkKIAkJcmV0
dXJuIC1FSU5WQUw7CiAKLQl0YWJsZV9pbmRleCA9IChleGFyZyA8PCAxNikgfCB0YWJsZV9pZDsK
LQogCXRhYmxlID0gJnNtdV90YWJsZS0+dGFibGVzW3RhYmxlX2lkXTsKIAogCWlmIChkcnYyc211
KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9z
bXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKaW5k
ZXggNTdhYjIzZDlkZGZkLi45YmUzZTc1OWUzMzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaApAQCAtODcxLDEwICs4NzEsOCBAQCBleHRlcm4g
aW50IHNtdV9mZWF0dXJlX2lzX3N1cHBvcnRlZChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIGV4
dGVybiBpbnQgc211X2ZlYXR1cmVfc2V0X3N1cHBvcnRlZChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwKIAkJCQkgICAgIGVudW0gc211X2ZlYXR1cmVfbWFzayBtYXNrLCBib29sIGVuYWJsZSk7CiAK
LWludCBzbXVfdXBkYXRlX3RhYmxlX3dpdGhfYXJnKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1
aW50MTZfdCB0YWJsZV9pZCwgdWludDE2X3QgZXhhcmcsCitpbnQgc211X3VwZGF0ZV90YWJsZShz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QgdGFibGVfaW5kZXgsCiAJCSAgICAgdm9p
ZCAqdGFibGVfZGF0YSwgYm9vbCBkcnYyc211KTsKLSNkZWZpbmUgc211X3VwZGF0ZV90YWJsZShz
bXUsIHRhYmxlX2lkLCB0YWJsZV9kYXRhLCBkcnYyc211KSBcCi0Jc211X3VwZGF0ZV90YWJsZV93
aXRoX2FyZygoc211KSwgKHRhYmxlX2lkKSwgMCwgKHRhYmxlX2RhdGEpLCAoZHJ2MnNtdSkpCiAK
IGJvb2wgaXNfc3VwcG9ydF9zd19zbXUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50
IHNtdV9yZXNldChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
