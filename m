Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFF175D58
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CE66E86D;
	Fri, 26 Jul 2019 03:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3026E867
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:22:06 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s22so38115838qkj.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ps26LhJ6tsBm7+k2EKYGUSNIo1GHuixFimKpSFMsSrA=;
 b=aIodag06YDxQwTzic9G8UmsumtKn8ieCqDi4+yD4En/LRwbYkX3aMtmVQvVxRl0EIy
 h3ChGDE+BQ37PfQZvKnXvw9hDf4hJuctnA6m/5IFdUHgY5kn+RqBewTVsj3HrgQztPDX
 okHA4e4Dk072wm0r7DZcOTu46zqkFojuw26XRFWUWsK5zcd+06Ek7v1fvLDXUGQtREr+
 rK0nhIv7GX5+WlHlqGYU0rZRtj31cdgO4GezsfNbMFr6aLAI+mEkN4X9hdzbUh8ehXJu
 qCGoL8M0ZykH3nQMZETMZ9rYBjd5QQUvL2F0b/Q6eOfaooRvDwFt1QBgncxdC/GiTKCI
 NAcw==
X-Gm-Message-State: APjAAAUmo3DV0aoVshDskBX5i1Do7YqAxqYrzrYdNDvI+gbEYoYnHzRp
 Sz00RMP9vgSA/HQeP8pT+nHU+IrX
X-Google-Smtp-Source: APXvYqylPtQ7fC8v9Y/8kDjI71RMgm2JlTqca0VVAbt0dkDRFotNnu7+A00R6SfarTl035ryQTiDrw==
X-Received: by 2002:a37:96c4:: with SMTP id
 y187mr61000529qkd.462.1564111325209; 
 Thu, 25 Jul 2019 20:22:05 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.22.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:22:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/11] drm/amdgpu/powerplay: add set_mp1_state for vega20
Date: Thu, 25 Jul 2019 22:21:43 -0500
Message-Id: <20190726032146.3187-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726032146.3187-1-alexander.deucher@amd.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ps26LhJ6tsBm7+k2EKYGUSNIo1GHuixFimKpSFMsSrA=;
 b=SQHj8W74uQquTMfSWAEvgfvfJVtTVqan+y+KrMyw8SGJgyMnLTcxTnNg2l4nS8GRbs
 7F2hBgShN08hPEO9U2K6rgS/rzBEr+WMRdohJRSUr8ldMoDpZc4ANxf4Awb+f6jXNokX
 2z1/A9DN8oLs+NxM3/zbTeUsw0hetn5EZ9M+0LZk80/x+L26pIqUop5JdvGZkp361HeO
 3GEWZZer1Mr6gtOHX6F7QjKBMzR5Ihj2Bk1d8+gd3mV/GqDlN69BryE+yPrFXJOnK/rG
 PnKEoqCA5Zn5xh/LGdxPBTMNlrfQqmVc+MRkltCh5ufWs1pupnYIGHlUEH8jYQvjzc3f
 BvGg==
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

VGhpcyBzZXRzIHRoZSBTTVUgaW50byB0aGUgcHJvcGVyIHN0YXRlIGZvciB2YXJpb3VzCm9wZXJh
dGlvbnMgKHNodXRkb3duLCB1bmxvYWQsIEdQVSByZXNldCwgZXRjLikuCgpSZXZpZXdlZC1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMjBfaHdtZ3IuYyAgICB8IDI5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwppbmRleCBmMjdjNmZiYjE5MmUuLjA1MTZjMjk0
YjM3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTIwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTIwX2h3bWdyLmMKQEAgLTMwNjMsNiArMzA2MywzNCBAQCBzdGF0aWMgaW50IHZlZ2EyMF9vZG5f
ZWRpdF9kcG1fdGFibGUoc3RydWN0IHBwX2h3bWdyICpod21nciwKIAlyZXR1cm4gMDsKIH0KIAor
c3RhdGljIGludCB2ZWdhMjBfc2V0X21wMV9zdGF0ZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAor
CQkJCWVudW0gcHBfbXAxX3N0YXRlIG1wMV9zdGF0ZSkKK3sKKwl1aW50MTZfdCBtc2c7CisJaW50
IHJldDsKKworCXN3aXRjaCAobXAxX3N0YXRlKSB7CisJY2FzZSBQUF9NUDFfU1RBVEVfU0hVVERP
V046CisJCW1zZyA9IFBQU01DX01TR19QcmVwYXJlTXAxRm9yU2h1dGRvd247CisJCWJyZWFrOwor
CWNhc2UgUFBfTVAxX1NUQVRFX1VOTE9BRDoKKwkJbXNnID0gUFBTTUNfTVNHX1ByZXBhcmVNcDFG
b3JVbmxvYWQ7CisJCWJyZWFrOworCWNhc2UgUFBfTVAxX1NUQVRFX1JFU0VUOgorCQltc2cgPSBQ
UFNNQ19NU0dfUHJlcGFyZU1wMUZvclJlc2V0OworCQlicmVhazsKKwljYXNlIFBQX01QMV9TVEFU
RV9OT05FOgorCWRlZmF1bHQ6CisJCXJldHVybiAwOworCX0KKworCVBQX0FTU0VSVF9XSVRIX0NP
REUoKHJldCA9IHNtdW1fc2VuZF9tc2dfdG9fc21jKGh3bWdyLCBtc2cpKSA9PSAwLAorCQkJICAg
ICJbUHJlcGFyZU1wMV0gRmFpbGVkISIsCisJCQkgICAgcmV0dXJuIHJldCk7CisKKwlyZXR1cm4g
MDsKK30KKwogc3RhdGljIGludCB2ZWdhMjBfZ2V0X3BwZmVhdHVyZV9zdGF0dXMoc3RydWN0IHBw
X2h3bWdyICpod21nciwgY2hhciAqYnVmKQogewogCXN0YXRpYyBjb25zdCBjaGFyICpwcGZlYXR1
cmVfbmFtZVtdID0gewpAQCAtNDEyMyw2ICs0MTUxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
cF9od21ncl9mdW5jIHZlZ2EyMF9od21ncl9mdW5jcyA9IHsKIAkuZ2V0X2FzaWNfYmFjb19jYXBh
YmlsaXR5ID0gdmVnYTIwX2JhY29fZ2V0X2NhcGFiaWxpdHksCiAJLmdldF9hc2ljX2JhY29fc3Rh
dGUgPSB2ZWdhMjBfYmFjb19nZXRfc3RhdGUsCiAJLnNldF9hc2ljX2JhY29fc3RhdGUgPSB2ZWdh
MjBfYmFjb19zZXRfc3RhdGUsCisJLnNldF9tcDFfc3RhdGUgPSB2ZWdhMjBfc2V0X21wMV9zdGF0
ZSwKIH07CiAKIGludCB2ZWdhMjBfaHdtZ3JfaW5pdChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
