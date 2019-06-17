Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D4B48F00
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B52C89B48;
	Mon, 17 Jun 2019 19:28:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8D389A94
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:34 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so7263616qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6JU/7VIgLoqJfZI1bjcafwcZOWp+P7op/yxjWPO4OfU=;
 b=OJAY+8NDYBDv0cQ+h29cuoYPagnJvtMloJDT/tnwUyIuGbQkWiZY85pKfz739bYYGa
 tVDtYQ6rPltzBWEgpUQCNTj7b71pM3lSBjSwhHPHA1EP50Mgdr2UfYqBFGXR7HdG3vi8
 jIaGmz8dvTahruREGX9EXrKRaeTG65LDIMQ3qGeKf+35vWd449ihV4O0cGMJpl+3VSpn
 km7O16s0Cy8nhQrh8P28jyazoJ4uONbkGczOez7nK2XWkK6qDX4eNtNSR4bbywFLt1iz
 AhlcHOuDVBjYsdbQJhNdCdhPMA8iG2dXI7foQjYw1w0Fe/l3Hnie7nDhGCMnFe8t15Lh
 9Pdg==
X-Gm-Message-State: APjAAAUPXrBX91qMW1AWmIIjGS/tnYUIqMaftLnyfh8Ngr1hASGYlqo+
 nrpMu7Rqza8LEudfWEffs0Ih59566aQ=
X-Google-Smtp-Source: APXvYqwhVooguBRYSrNusE7y7nglwet1X0pTMOrDWzPl18Ut/+JvQf0+nJ3MS0Ji6GrMwc+VEsR5Og==
X-Received: by 2002:a0c:94a4:: with SMTP id j33mr23299903qvj.135.1560799713818; 
 Mon, 17 Jun 2019 12:28:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 187/459] drm/amd/powerplay: do not set dpm_enabled flag before
 VCN/DCN DPM is workable
Date: Mon, 17 Jun 2019 14:26:52 -0500
Message-Id: <20190617192704.18038-88-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6JU/7VIgLoqJfZI1bjcafwcZOWp+P7op/yxjWPO4OfU=;
 b=pFyc34pkQR4cz42we5zKOFQ1fmiqOLXsHgOVVkxP83WmIao5/qz4Mg5gNnfU3hsScK
 TlqbbpW05SdL2o2Zx+IHfT5ig8kOKknbTlkb1/aVa5YFdszBLUhx5iz9QVdBlb6rF2Tw
 uHNZ/C4uGYehcTM0Qh225/ZCtYWGZWSzJN9ULXA098T/MmfwCJrsL9Ol7QrQbQrhlNoI
 s+5zgvWWWujzF8DxDlRVuCtIBtgxzgQ2ftn4Ui4//u0GF/065FQ+rC/H5mYre0iT0MA0
 nanf2GXbgS5xObKUyxjjqTPogqT9T1T8lkHta6FF39S6+24EBnKbIFiprIcbqnfs86dB
 3e2w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgZHBtX2VuYWJsZWQgZmxh
ZyB3aWxsIGJlIHJlY29nbml6ZWQgYXMgdGhlIFZDTiBEUE0gZW5hYmxlZCBhcyB3ZWxsLiBJbiBm
YWN0ClZDTi9EQ04gRFBNIG9uIE5hdmkxMCBpcyBub3QgZ29vZCBzbyBmYXIsIHNvIHdlIGNhbm5v
dCBlbmFibGUgaXQgZm9yIG5vdy4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5n
QGFtZC5jb20+CkFja2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAzICsrKwog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCA4NThjZTVkYjY4N2YuLjA2ZjVlNWNlOWRiMSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAtODY2LDYgKzg2
Niw5IEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAqaGFuZGxlKQogCQlhZGV2LT5wbS5k
cG1fZW5hYmxlZCA9IGZhbHNlOwogCWVsc2UKIAkJYWRldi0+cG0uZHBtX2VuYWJsZWQgPSB0cnVl
OworCS8qIFRPRE86IHdpbGwgc2V0IGRwbV9lbmFibGVkIGZsYWcgd2hpbGUgVkNOIGFuZCBEQUwg
RFBNIGlzIHdvcmthYmxlICovCisJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxMCkK
KwkJYWRldi0+cG0uZHBtX2VuYWJsZWQgPSB0cnVlOwogCiAJcHJfaW5mbygiU01VIGlzIGluaXRp
YWxpemVkIHN1Y2Nlc3NmdWxseSFcbiIpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
