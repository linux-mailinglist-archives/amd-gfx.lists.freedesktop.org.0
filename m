Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B318754C5
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309506E7A4;
	Thu, 25 Jul 2019 16:58:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93CD6E7A2
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:08 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 201so36939915qkm.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Y442JIP5LYwW3v88JmKI21M5xqZ/ttV5ywnhGQty+4=;
 b=ipZGQChIV3mO6zVk6FutC1/MADI/YGoEZ3DTORQV+d2QpquwE4wQoVsHJCil/C86Cc
 C1q/F13GbAbxSJlrFeiyDNzAAiYxPXMdStwhAWCuDPWXytcKTjHJpY29Xnlpu7/KRAY7
 huxKabEu3ZUuvYTHh2qVsZ2Grr3FKyVZ7mJdIMKYpaMyzD9sEyaYdDCFZQLsEypT3RfJ
 7Ly6ayttBnEEodFdOZbFtmSw/Idg6Co2FGf8U20eEUV+0txmYbGSrix3FWi32D4lWY6r
 /YYrbNgAljmaObSnBsP0QOONGD0HlhPyMMjCfmyaGWlOBANrD4f8hS+/hCTup1CLmyk/
 Am+A==
X-Gm-Message-State: APjAAAUIH4ieO0hRJUddnyXT4DC4WdbuZzJQIfy0hXz2jv+CJFMY14NH
 VZ8jhoRejiEoau2GAj856zfD59ie
X-Google-Smtp-Source: APXvYqzd6I0wPvGiSOAcAN0aQN/MHQ1ShKTdn+qFjeJIYaLzZtcTau9R/+JSOR5jnd+Q95lxUEwTGg==
X-Received: by 2002:a37:c81:: with SMTP id 123mr61259256qkm.474.1564073887858; 
 Thu, 25 Jul 2019 09:58:07 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:07 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/12] drm/amdgpu: add reset_method asic callback for vi
Date: Thu, 25 Jul 2019 11:57:50 -0500
Message-Id: <20190725165758.16928-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Y442JIP5LYwW3v88JmKI21M5xqZ/ttV5ywnhGQty+4=;
 b=ahboM9UF94hTXzbAVzrBE+at915qCRauKVcr/yF+8a1Az2Ia4j5Ik8oJND1UO6gLtO
 eWb47+sdNuwM651nCcMxNVpI3BfRAhxp8OyimetdOCPW8y9anddz/LmhY5V99JjUEVe1
 dJcCSsUdlQpNt8vAmtCxmJEN8YUOQHMuKJU9rrNCJnIn8YybiEY1GJIvO2mEAQfml/pp
 yU5dTJIOu6BrWn/zbPdFqLrkkQHpgvikKHHVm6MId7bsIu/pH46obxLn/OxfLkrzMdMa
 JVkG2DtuBhsDli/jUbEzPUbS+FVPTiw+1rtqPw5YALSVNq0TaTJn6ODJZR+Nm6wgetyF
 mRrg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VkkgYWx3YXlzIHVzZXMgdGhlIGxlZ2FjeSBwY2kgYmFzZWQgcmVzZXQuCgpSZXZpZXdlZC1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3ZpLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmkuYwppbmRleCBmZmZhZTRjMjk3M2IuLjU2Yzg4MmIzZWEzYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS92aS5jCkBAIC03MDksNiArNzA5LDEyIEBAIHN0YXRpYyBpbnQgdmlf
YXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1cm4gcjsKIH0KIAor
c3RhdGljIGVudW0gYW1kX3Jlc2V0X21ldGhvZAordmlfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJcmV0dXJuIEFNRF9SRVNFVF9NRVRIT0RfTEVHQUNZ
OworfQorCiBzdGF0aWMgdTMyIHZpX2dldF9jb25maWdfbWVtc2l6ZShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIHsKIAlyZXR1cm4gUlJFRzMyKG1tQ09ORklHX01FTVNJWkUpOwpAQCAtMTAy
MSw2ICsxMDI3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfYXNpY19mdW5jcyB2aV9h
c2ljX2Z1bmNzID0KIAkucmVhZF9iaW9zX2Zyb21fcm9tID0gJnZpX3JlYWRfYmlvc19mcm9tX3Jv
bSwKIAkucmVhZF9yZWdpc3RlciA9ICZ2aV9yZWFkX3JlZ2lzdGVyLAogCS5yZXNldCA9ICZ2aV9h
c2ljX3Jlc2V0LAorCS5yZXNldF9tZXRob2QgPSAmdmlfYXNpY19yZXNldF9tZXRob2QsCiAJLnNl
dF92Z2Ffc3RhdGUgPSAmdmlfdmdhX3NldF9zdGF0ZSwKIAkuZ2V0X3hjbGsgPSAmdmlfZ2V0X3hj
bGssCiAJLnNldF91dmRfY2xvY2tzID0gJnZpX3NldF91dmRfY2xvY2tzLAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
