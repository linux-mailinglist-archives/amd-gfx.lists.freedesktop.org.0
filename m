Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E375D55
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E126E86B;
	Fri, 26 Jul 2019 03:22:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807036E865
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:22:01 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so51294495qto.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7KaadvlK/r7X7owKzUQb7LBGVZTF1qPKf7be8e2gsA=;
 b=AM/Ux4llJ3ujnVO7MjRtATdL5Kua80swZ097zEQVYSU6Dp912L2XOUBdJpvKVusK82
 85LXHRnTrsnjbL3FgUGJ5Fj9s25gvAoYJD7ltKYACNVNKs0WD7xH482bbiQoRE0I9B+g
 glswdeDm29PV82VfuJIIqTrSgnh2Mq3fwRHIATAGgsVnfeFQlhHygpm+D2XRHwOOTfnu
 WAvKwBDQqnh6/MFRhjDh5/6DY6qNExAEIahrDYfnYwOZfsCeqJpmmOpRF/1h22NHmvWz
 TfJcCh3+WTTqJWw6KtfrlEo8AtQHI82hZCT5Ydc/NeA38DDwrrgDjc0eSwxho04AT1aL
 uRjA==
X-Gm-Message-State: APjAAAUN7PRfCdfszeMDyyZPWrbNATsNInJuHH7LlXTLAaEb8hWoNV4D
 H+VhuOqVPeHmaOhhNP4jigsssPpo
X-Google-Smtp-Source: APXvYqziSfy///hHs5wE2v4tpEcvnrA71BIZH/2Eb6eLi6CKWLcLx+XPEf2KTw8EMfLXB2xx3w5Unw==
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr67752455qvu.138.1564111320344; 
 Thu, 25 Jul 2019 20:22:00 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.21.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:21:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/11] drm/amdgpu: add reset_method asic callback for si
Date: Thu, 25 Jul 2019 22:21:37 -0500
Message-Id: <20190726032146.3187-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726032146.3187-1-alexander.deucher@amd.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p7KaadvlK/r7X7owKzUQb7LBGVZTF1qPKf7be8e2gsA=;
 b=c+iCIOfAcjHiDheyIGrX2Tn5sf+JhyJZvyKHZe7yg/bAqx17pbDknS65aMQnlMxVyK
 5kKH6HnK+oBbpYx3ppDNjpclBG+KWWuLZYvfUi6Omi1lkjik8tuo9Kq1cLJ/CrNGIASf
 JxwoUKaQrpWXf3IEAndi1Qp9QpVVJOVjPgwWrz//TiKvcKxpHTSriFLRRSiGEONPPji8
 e/amUDguB3JFqpQBoHW/9zErO8rvMFeVIDfIjsy2d2C+zNL5aXLUos8ez5YUB3S4Kpn+
 b48KSMSItWi6F7SoxqAmEwI0JA9xgFL7Wor7S81jRbBT3ku2etia9nwN7baeGd5AP0ce
 nFFQ==
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

U0kgYWx3YXlzIHVzZXMgdGhlIGxlZ2FjeSBwY2kgYmFzZWQgcmVzZXQuCgpSZXZpZXdlZC1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NpLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2kuYwppbmRleCA0YjFlMGMxNmFjNDEuLjkwNDM2MTQ1MTY1MCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2kuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zaS5jCkBAIC0xMTg1LDYgKzExODUsMTIgQEAgc3RhdGljIGludCBz
aV9hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQog
CitzdGF0aWMgZW51bSBhbWRfcmVzZXRfbWV0aG9kCitzaV9hc2ljX3Jlc2V0X21ldGhvZChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlyZXR1cm4gQU1EX1JFU0VUX01FVEhPRF9MRUdB
Q1k7Cit9CisKIHN0YXRpYyB1MzIgc2lfZ2V0X2NvbmZpZ19tZW1zaXplKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogewogCXJldHVybiBSUkVHMzIobW1DT05GSUdfTUVNU0laRSk7CkBAIC0x
MzkzLDYgKzEzOTksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9hc2ljX2Z1bmNzIHNp
X2FzaWNfZnVuY3MgPQogCS5yZWFkX2Jpb3NfZnJvbV9yb20gPSAmc2lfcmVhZF9iaW9zX2Zyb21f
cm9tLAogCS5yZWFkX3JlZ2lzdGVyID0gJnNpX3JlYWRfcmVnaXN0ZXIsCiAJLnJlc2V0ID0gJnNp
X2FzaWNfcmVzZXQsCisJLnJlc2V0X21ldGhvZCA9ICZzaV9hc2ljX3Jlc2V0X21ldGhvZCwKIAku
c2V0X3ZnYV9zdGF0ZSA9ICZzaV92Z2Ffc2V0X3N0YXRlLAogCS5nZXRfeGNsayA9ICZzaV9nZXRf
eGNsaywKIAkuc2V0X3V2ZF9jbG9ja3MgPSAmc2lfc2V0X3V2ZF9jbG9ja3MsCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
