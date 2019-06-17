Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C18548F87
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B76089CD5;
	Mon, 17 Jun 2019 19:32:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383C189CB2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:27 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id x18so6933382qkn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+E8TSTi4Ezox19eqWrNmzn+sBklgLv58wlBSsEUjZs=;
 b=DxLUorLlOi8z2IkjxNUSBt+2Au5/ZsEoeo8zV8PKeIGLFpvRk/D9K6GfiwKFxX6xLG
 R2sR4UARQyIFhIaNP29BX6YhFEb6eLIuoIdnSDiS/zzga3QtfhUf3OqGfMpjQg4D2NiE
 tmP+PxF0WRxEgk4fvcheWEit3fG/DlhweD4vm3/+whOkgC5GLwweELH1N/BwN0hussUc
 4FxNIy8CiWYw8EnykNv3Ad0eTy7GEfkSoevJb3T4utBPuYCcVPKsbGd06MU3etdpB1iG
 B7Qfc82YHGZ+a1pfISLy2tGKlKHxYWih2oP2b0CANKSbgMC23EkuCyTKP8w9TF30hYb+
 jlGQ==
X-Gm-Message-State: APjAAAUhC7G7oAluzNGr6ZnWRcc5/qbEOEOgaSTfpmsx4PeuUT+4eRT9
 PI+9CZZu43+cQYcw2lC+jGl7BR3Ww48=
X-Google-Smtp-Source: APXvYqwlKasyWQrUQFWN4r4AlDNfX2Tt3xvlNZc/1r7cFkWpOWtvZjCUFPM162KdN9ZhfxaebejvZg==
X-Received: by 2002:ae9:de81:: with SMTP id
 s123mr21466927qkf.339.1560799946150; 
 Mon, 17 Jun 2019 12:32:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 280/459] drm/amdgpu/powerplay: add license to smu11 header
Date: Mon, 17 Jun 2019 14:30:47 -0500
Message-Id: <20190617193106.18231-81-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+E8TSTi4Ezox19eqWrNmzn+sBklgLv58wlBSsEUjZs=;
 b=GiSaYMNgGfGlQtaNmYrcUU3oU/UJzvncU6fPIxcYfMXkmrp7JnCEVM5vRTDAfRCsia
 wNeVP2eCZKBSWRxozg6xs2lks0c+v5HoVxSt0KIoSkECxsHZ9/LchuxT6sdxaiy/6i06
 zjuEZvbYuAt9O1KGHD0tQhJxSf8zScnydcCCngdOYeDGpxD6UDIHluOkkGMKu4sFDrfm
 p7RHj4An9GLrsklEZU9gaRINahaBkwpN7KtPiljCmy3l2U3wkob5X29m1defX3s2iNUt
 HrIMEp0WHhUx/S0JoHRNSKiVbKvlMtDOcLwyEIw21uvpaP3SJNK0v7o8KF7HEA7vZcA1
 V0Zw==
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

U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIC4uLi9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9uYXZpMTAuaCAgICB8IDIyICsr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9p
Zl9uYXZpMTAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2
ZXJfaWZfbmF2aTEwLmgKaW5kZXggODNlZjBlMjZjMDUxLi5iMzk5M2QzODJhZDUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2
aTEwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZl
cl9pZl9uYXZpMTAuaApAQCAtMSwzICsxLDI1IEBACisvKgorICogQ29weXJpZ2h0IDIwMTkgQWR2
YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICoKKyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdy
YW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhCisgKiBjb3B5
IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhl
ICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmlj
dGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbgorICogdGhlIHJpZ2h0cyB0byB1c2Us
IGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCisg
KiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNv
bnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVj
dCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisgKgorICogVGhlIGFib3ZlIGNvcHlyaWdo
dCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4K
KyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgor
ICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZ
IE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBM
SU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyAqIEZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVO
VCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJM
RSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCisgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIg
SU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwKKyAqIEFSSVNJTkcg
RlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVT
RSBPUgorICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorICoKKyAqLwogI2lmbmRl
ZiBfX1NNVTExX0RSSVZFUl9JRl9OQVZJMTBfSF9fCiAjZGVmaW5lIF9fU01VMTFfRFJJVkVSX0lG
X05BVkkxMF9IX18KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
