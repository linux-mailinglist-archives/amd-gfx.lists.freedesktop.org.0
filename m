Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A304A0ADE
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC0F89EFF;
	Wed, 28 Aug 2019 19:56:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C119589EAC
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:47 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t12so953673qtp.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7LpjQ287B8mA83BUSEhAbKKspAUnXYxg6xApKgHASyk=;
 b=s7+N3RypuDzTLhvJ2fL98rS0YzpLGgIQxKPUlQiZseRDO6fGqQOtOOQlFuWc7TCdvb
 eUZrLwcVuzIjUkYUH9ayW/fuLvbijHjh7CnGUO4ZfaS9yx0Fb4TGrL71VKHs3/MyyBSW
 jq0exGj1ddZ64aN3t3R/JVbVVSGPr3CTXru6w6p22PYm02YbrksEoIEidyaG1zJyA1lQ
 1yrDysN6qoD8v6bN/TXQ6/qZ/KK+DRFyVlFKZDHSWykthNX2PfvZ8vREUZ09nec39EAj
 Wudndc2g6JvB/o2SR+DiOZdDMVUMAUZoCj7T+42Xf613RK1v8yJ71BOFQ8xRxTFtMt+w
 Z65A==
X-Gm-Message-State: APjAAAXw6oGsWpYqQy/h8ohCeMLJiBVOs3pxal2SF0MJ3voj0nnH00UW
 anrCFVe2eSpdbf9nWZhrXSPqzHsw
X-Google-Smtp-Source: APXvYqx/HkT9IB5HOkSHL3/SGJe6s34efqyVk/tksJ1fFoDmFgF7GJnaULiZ/cNtUjND5x3DnP1yhg==
X-Received: by 2002:ac8:40cc:: with SMTP id f12mr6082172qtm.256.1567022206707; 
 Wed, 28 Aug 2019 12:56:46 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/23] drm/amd/display: Fix register names
Date: Wed, 28 Aug 2019 14:56:12 -0500
Message-Id: <20190828195622.28941-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7LpjQ287B8mA83BUSEhAbKKspAUnXYxg6xApKgHASyk=;
 b=E+MsI96A7s+MNePI0A7lF+4fDiId+Kwh/CCwJcch6JpBlBLtKjDxBkDvYgsC5H/FId
 B9veSoDmuQCgb+k7b70nk960hJmtJMgSimXOuOzP3N5F26SlxuWqCLKdB9X6JVyCZLff
 rjvAe6N0HqEcFaFkB/VzHOCByEdv7jr/lHcMmfY7RG8MsEU2ujG24YVvbjy2AI9tbwvj
 nQvm5trQqueCb0xu5wFMX50lG2lt69IXSe8osz9NWe18ybgRH5NNEexJdDxyOKgqZ279
 lhnUSnTB7tiJ36mtHArYMkH5jzr3rcq6PGDJsOUx45DPworHjshWE9fyX3mWxviOr7O+
 1jQw==
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

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpyZW5h
bWUgVk1fQ09OVEVYVDAgdG8gIE1NVk1fQ09OVEVYVDAgYXMgdGhhdCBpcyB0aGUgbmFtZSBkZWZp
bmVkIGluCnRoZSByZWdpc3RlciBmaWxlcwoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFr
aGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RjZV9od3NlcS5oIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2h3c2VxLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9od3NlcS5oCmluZGV4IGI3NzY3ZDZiZTFiNC4uYWMwNGQ3NzA1OGYwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9od3NlcS5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2h3c2VxLmgKQEAg
LTY0Myw4ICs2NDMsOCBAQCBzdHJ1Y3QgZGNlX2h3c2VxX3JlZ2lzdGVycyB7CiAjZGVmaW5lIEhX
U0VRX0RDTjIxX01BU0tfU0hfTElTVChtYXNrX3NoKVwKIAlIV1NFUV9EQ05fTUFTS19TSF9MSVNU
KG1hc2tfc2gpLCBcCiAJSFdTX1NGKCwgRENIVUJCVUJfR0xPQkFMX1RJTUVSX0NOVEwsIERDSFVC
QlVCX0dMT0JBTF9USU1FUl9SRUZESVYsIG1hc2tfc2gpLCBcCi0JSFdTX1NGKCwgVk1fQ09OVEVY
VDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfSEkzMiwgUEFHRV9ESVJFQ1RPUllfRU5UUllfSEkzMiwg
bWFza19zaCksXAotCUhXU19TRigsIFZNX0NPTlRFWFQwX1BBR0VfVEFCTEVfQkFTRV9BRERSX0xP
MzIsIFBBR0VfRElSRUNUT1JZX0VOVFJZX0xPMzIsIG1hc2tfc2gpLFwKKwlIV1NfU0YoLCBNTVZN
X0NPTlRFWFQwX1BBR0VfVEFCTEVfQkFTRV9BRERSX0hJMzIsIFBBR0VfRElSRUNUT1JZX0VOVFJZ
X0hJMzIsIG1hc2tfc2gpLFwKKwlIV1NfU0YoLCBNTVZNX0NPTlRFWFQwX1BBR0VfVEFCTEVfQkFT
RV9BRERSX0xPMzIsIFBBR0VfRElSRUNUT1JZX0VOVFJZX0xPMzIsIG1hc2tfc2gpLFwKIAlIV1Nf
U0YoLCBET01BSU4wX1BHX0NPTkZJRywgRE9NQUlOMF9QT1dFUl9GT1JDRU9OLCBtYXNrX3NoKSwg
XAogCUhXU19TRigsIERPTUFJTjBfUEdfQ09ORklHLCBET01BSU4wX1BPV0VSX0dBVEUsIG1hc2tf
c2gpLCBcCiAJSFdTX1NGKCwgRE9NQUlOMV9QR19DT05GSUcsIERPTUFJTjFfUE9XRVJfRk9SQ0VP
TiwgbWFza19zaCksIFwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
