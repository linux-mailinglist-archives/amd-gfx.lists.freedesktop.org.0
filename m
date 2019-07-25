Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0331754CA
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F7D6E7AD;
	Thu, 25 Jul 2019 16:58:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D4A6E7AB
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:14 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s145so36962573qke.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5q6x9qrhqCyuAT8/RQr7svaCIUy5mcRiecScROHQj6o=;
 b=Aybavu5S7JJQXddfi1TK1PXf2vklaJwR9sPD5bfCrBC0RjeyKe4sN3K6A3iC73+Zw4
 SEw6PIB/a9xnmcLckh/H4qq3vf4Aj7o1dF+QXY3x+0k9Tdhb8jHh/2e9gnehPgU52n0l
 r3Bh3qGCLWDHfMSjK00V/rgLDNQteNRtt7NIwsDiy4egh11vvqUlG44Imb0PX9OL1MZX
 3ldnJf1KnoqbXNGmKpZLOzpZF3rJnk/cnfqTfXJL13lWtWNTAxeO4Y+7vrlFUS5VLxxU
 CNSXncwlYvG2V8fNVc8P+8gS2dL+EegjVESNZyUM3ofLZHvFpWOiqz9Wj4Xemll/MnDx
 sqMg==
X-Gm-Message-State: APjAAAVOyk3ps6tbQytbsOAIwBOXbm+050NHAXrK19toVL/SpOHO/zz0
 EoqBittIeGTM6jtCffrDu8YUeBJk
X-Google-Smtp-Source: APXvYqw7GFuy6gEbx0RpWrc0uBBZ6xO0iH2WLjFPr02HOV3Io7p8AvyuSu0zxWgA+YKTeNqnKP1vIg==
X-Received: by 2002:a05:620a:1285:: with SMTP id
 w5mr55656109qki.302.1564073893536; 
 Thu, 25 Jul 2019 09:58:13 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/12] drm/amdgpu: add a flag to note when the driver is in
 shutdown
Date: Thu, 25 Jul 2019 11:57:57 -0500
Message-Id: <20190725165758.16928-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5q6x9qrhqCyuAT8/RQr7svaCIUy5mcRiecScROHQj6o=;
 b=USI5U5zkSy3cmGQTQBdqH6T4tgQbVQC8wI1YiGQC0cD+XkuZHyWNZMvK9kP6LQJPmc
 iYdkrlHtA7Zr/zTxgaP8bLXQcBQInr6g2OSQ6SDvGnepxLJovEV7PlQsRwFKocmL/01f
 Bw+wj8tdEwdxHZVoNI0yd2U9T1Uc/rgTu/BpZj9p7AhNegfYXIZh32267ILHZ+IySrL/
 jDyjUug21uyab1FEPFGk/5TJNVsqbCjssA2b27z/IA+MVBHTIwkB39hfebkl1yslk8bF
 FXWtgqoNTO0wsXDxEIRQJeaEPe9TOhl22cEyuDqnjc3lIaMTdWdHG+oRRXHm1Gjq8MEG
 f59g==
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

V2hlbiB3ZSBhcmUgdGVhcmluZyBkb3duIHRoZSBkZXZpY2UgZm9yIFBDSSBzaHV0ZG93biwgc2V0
IHRoZQpmbGFnLiAgVGhlIGRyaXZlciBuZWVkcyB0byBrbm93IHRoaXMgY2FzZSBzbyBpdCBjYW4g
c2V0IHRoZQpTTUMgaW50byB0aGUgcHJvcGVyIHN0YXRlLgoKU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IGU2NjE0MTdiYTlkZC4uNjRlNjhjMGRj
NzM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaApAQCAtOTkzLDYgKzk5Myw3IEBA
IHN0cnVjdCBhbWRncHVfZGV2aWNlIHsKIAkvKiByZWNvcmQgbGFzdCBtbSBpbmRleCBiZWluZyB3
cml0dGVuIHRocm91Z2ggV1JFRzMyKi8KIAl1bnNpZ25lZCBsb25nIGxhc3RfbW1faW5kZXg7CiAJ
Ym9vbCAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbl9ncHVfcmVzZXQ7CisJYm9vbCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbl9ncHVfc2h1dGRvd247CiAJc3RydWN0IG11dGV4ICBs
b2NrX3Jlc2V0OwogCXN0cnVjdCBhbWRncHVfZG9vcmJlbGxfaW5kZXggZG9vcmJlbGxfaW5kZXg7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCA0NzQzODAxMzU3
YzUuLjI4Zjg1ZDkxMzVhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YwpAQCAtMTA4OSwxMiArMTA4OSwxNCBAQCBhbWRncHVfcGNpX3NodXRkb3duKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRl
dik7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkZXYtPmRldl9wcml2YXRlOwogCisJ
YWRldi0+aW5fZ3B1X3NodXRkb3duID0gdHJ1ZTsKIAkvKiBpZiB3ZSBhcmUgcnVubmluZyBpbiBh
IFZNLCBtYWtlIHN1cmUgdGhlIGRldmljZQogCSAqIHRvcm4gZG93biBwcm9wZXJseSBvbiByZWJv
b3Qvc2h1dGRvd24uCiAJICogdW5mb3J0dW5hdGVseSB3ZSBjYW4ndCBkZXRlY3QgY2VydGFpbgog
CSAqIGh5cGVydmlzb3JzIHNvIGp1c3QgZG8gdGhpcyBhbGwgdGhlIHRpbWUuCiAJICovCiAJYW1k
Z3B1X2RldmljZV9pcF9zdXNwZW5kKGFkZXYpOworCWFkZXYtPmluX2dwdV9zaHV0ZG93biA9IGZh
bHNlOwogfQogCiBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
