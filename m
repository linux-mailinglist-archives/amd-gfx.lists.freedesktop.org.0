Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35149032
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDDB6E02D;
	Mon, 17 Jun 2019 19:47:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE496E029
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:26 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x47so12258889qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5K+GoFCstn5cSdbDUUQEE0gw/DhDUe9Ct45WhTCgkhE=;
 b=aXn3w3hkeyi+u0pxkSLhqpG7oE8WZ0ZP3LGXGVZPISxVAVTGoLeaQ2bzgVq7ETVrcq
 FiSa4TOXijjuhcUeaNiNgXRFe2ht78z55DANX1/6ZwHDTSLcf8SSrtriDoV6KcNIroTs
 G6wEIkBVQC/SzvzBLC9DLZLVoW7Tf3OLmisNW1wDiARJFN5/zjw0wj+FVDLGpr4f7wM9
 ansFxdDkSy3wlF/mhBFNMWRHZyDJY3t/aAIrLXaMh9O1UjfGU9dWWYHFJ1gsN+poeHI1
 zlV8GWeWYo5OfQkg3CSOmnigBqtr+o5h5JaYmW52lbZsksnfI2r+oHHMbigPX01spTuh
 HALg==
X-Gm-Message-State: APjAAAVP2DDKYj0IjIDR5OX/7QF2wZ+l2zAIoaRB9IR4ejcMXj3T0ncS
 bEnPLqQH0Sx+f6VC/S6YfHrCyTOrwi/M1A==
X-Google-Smtp-Source: APXvYqyfZyGOZ6Aupr5UBluWn3dN+cSS5/A4PfOR72u7wb6J8Crlp+4cfBSZv1+pPNhprlQLnL90FQ==
X-Received: by 2002:a0c:e705:: with SMTP id d5mr22832947qvn.11.1560800844244; 
 Mon, 17 Jun 2019 12:47:24 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 388/459] drm/amd/display: Remove REFCYC regs
Date: Mon, 17 Jun 2019 14:45:29 -0500
Message-Id: <20190617194540.18497-89-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5K+GoFCstn5cSdbDUUQEE0gw/DhDUe9Ct45WhTCgkhE=;
 b=D6XPhooTyQeyhPjgOIPGp4kIuftYN6+N5+iROmY1lIhqyGrbWCcYicid+Xxft2Uex9
 p0zK3ld5sAs/JQrIViSorGoIUJPe4ul9BzokFmuB76Q1bTLz3zKuCnSHwXmdzH9DCX9q
 gSM4R+UisEdsltYo8WTZT1jCWyMc70ZShTKBYVil+fptPkeGZN3lcKrblrs64Lc5lqNH
 Rd1f1W/9oF/K4ezoaW0VRqt1+V4Vyf+8chZcPuWXLYegbGgaHarsYSPxuG0UnIauFfM0
 wmbSeJVIMUuodBCWu2+WXUZX7Ou78aUazzrEK+ttHEBkpWTcE3VE8Qg3dZHXeuzMZpmj
 w1Ig==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgoKW1doeV0KU29tZSBy
ZWdpc3RlciBmaWVsZHMgYXJlIG5vdCBuZWVkZWQuCgpbSG93XQpyZW1vdmUgdGhlbQoKU2lnbmVk
LW9mZi1ieTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgpSZXZpZXdlZC1i
eTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQg
TGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHVicC5oIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9odWJwLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHVicC5oCmluZGV4IDlmNjg1OGMzMmIyMi4u
OWY1NmMxZDJkMTg4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHVicC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9odWJwLmgKQEAgLTE3NiwxMSArMTc2LDggQEAKIAl0eXBlIEhVQlBSRVFfTUFT
VEVSX1VQREFURV9MT0NLX1NUQVRVUztcCiAJdHlwZSBTVVJGQUNFX0dTTF9FTkFCTEU7XAogCXR5
cGUgU1VSRkFDRV9UUklQTEVfQlVGRkVSX0VOQUJMRTtcCi0JdHlwZSBWTUlEO1wKLQl0eXBlIFJF
RkNZQ19QRVJfVk1fR1JPVVBfRkxJUDtcCi0JdHlwZSBSRUZDWUNfUEVSX1ZNX1JFUV9GTElQO1wK
LQl0eXBlIFJFRkNZQ19QRVJfVk1fR1JPVVBfVkJMQU5LO1wKLQl0eXBlIFJFRkNZQ19QRVJfVk1f
UkVRX1ZCTEFOSworCXR5cGUgVk1JRAorCiAKIHN0cnVjdCBkY25faHVicDJfcmVnaXN0ZXJzIHsK
IAlEQ04yX0hVQlBfUkVHX0NPTU1PTl9WQVJJQUJMRV9MSVNUOwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
