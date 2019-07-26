Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EBB75D52
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1CB6E865;
	Fri, 26 Jul 2019 03:22:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D296E865
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:22:03 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id v22so38087063qkj.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Y442JIP5LYwW3v88JmKI21M5xqZ/ttV5ywnhGQty+4=;
 b=Ah5wvgeslQ57G7bo+rz696oPISdMgnvvWPaYFeaK8S36xiQlYIdgOe1oi2bLokeKHF
 b+2ePgtl/HbJ42nt3y9UjExBHx9AG5YJqddlpDpo3xVpB2S8O80W8q/jluJ5gvY5/Q3q
 uZPfubwV2j2nLpocUmJQ+IHl04/7fH1M4VGfcGGD8OWVF4AmG+1sPCEZeunFLMbfFbLo
 UQmU5xDumiId0dtwiAhFMFFVFJT2pMSHSVT9lXRTL6Yb/JeIyqgQYJPgbWdb4ZTlbU6b
 qgjEVOPit+dqUOy7OzhRbdPMshGmPRTsTrqcUnTGxpdHlh0p+HYn3zn/YtrfR2aDvHo/
 S6qg==
X-Gm-Message-State: APjAAAXszkHiVRENnXMrY7bDajNEl1HAiUwkSElzcTFA/0d5vwl7347M
 U6woaLHgKZLlXPt4WP3zwaWaCP6a
X-Google-Smtp-Source: APXvYqzp2zyPZ79Am2Z8aI3XTxZeizBi+UQLWyaEG07yNfcRRsx1zKFbvSwhRGpQVk9Ewl6yJmpRlw==
X-Received: by 2002:a37:4bc5:: with SMTP id y188mr54634893qka.13.1564111321983; 
 Thu, 25 Jul 2019 20:22:01 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.22.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:22:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/11] drm/amdgpu: add reset_method asic callback for vi
Date: Thu, 25 Jul 2019 22:21:39 -0500
Message-Id: <20190726032146.3187-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726032146.3187-1-alexander.deucher@amd.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Y442JIP5LYwW3v88JmKI21M5xqZ/ttV5ywnhGQty+4=;
 b=S17dWplp+CGTQJQ6WUdndGbvKZBFfkQS7jBp2Z3pOvdu/Ay1AE2NxlrTYUCYKhGuK/
 OozylPiQxxgsTrHGN4Wlc31PeQyiOjmfDVwErugegvyNZ1uYIj/EnUbiX1Zje4WhP9X/
 hDCg94ZICS7EOX2twOZbtFRd0PvC6QhOO9pOedzB9HvX8WXlgoP4ltfvQ2pmMtpD+In0
 vELCSQU5XaxJXBDpxAb4vNJNCIAZ8NEA/+qq4nxGLZiBaGRSs6kSViunZ0mJl+3KHqdL
 Fa+gK5MFjmQvYQu+ff1FL3wHYXasuS56aX4sFqBabfgN3JWi5wDRy/v5natlmbceo7pj
 Hg9Q==
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
