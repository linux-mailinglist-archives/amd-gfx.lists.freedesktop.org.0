Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D78F6AAA0
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 16:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5148089D40;
	Tue, 16 Jul 2019 14:31:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C2989D40
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 14:31:24 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id d23so19776395qto.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 07:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OHlmtFU9QceXmcFxXquWX749VE/1r39DmjduersNZf0=;
 b=Yl8dXH/3lWwQ0jzyqPuW60+9j0S0i0gSWKw27Ts7DYDGLXz+evAERvW8o9dBhO7Rq9
 LD/zaSzYclqhKqRIlMhzkCdIsZg0IDqCWcwln3eNwovzd9i38P0aZeOxYiBf9ATaBOcp
 sBNY6J95W5HMkorzUB77Ry0bUoSPccpbAumova/l3vDh636qay3pBaNW3SAI5EMYU/cw
 LlLEYAwWyc3PBDWuWH+54Di+VTtJABjT1kiJlpY5BCP4XbW0F4hTaOAWzQbMKIrWNFiX
 pkWk5X3JZvd6KUfBWMsGasPhtI79tFfMNs4jIGTuURfJejehFCYUvM4L5dN0ezCiRqcF
 r5Bg==
X-Gm-Message-State: APjAAAWfgA9RWarxeoOVD2zOSJZ73YZoY3CEzTff0B8+FRIiVQ3uUKfE
 ryVnFUg3VL/eWXhIamFwn48UfY4i
X-Google-Smtp-Source: APXvYqwSUNR1GgxD7CKZaxgaYo+PRcaYcuIynj/fKfKXhOI+Frg4NkRJx3eB9M4e5zMhIcsNh79T8Q==
X-Received: by 2002:aed:2068:: with SMTP id 95mr22939087qta.265.1563287483656; 
 Tue, 16 Jul 2019 07:31:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id e8sm9065563qkn.95.2019.07.16.07.31.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 07:31:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: drop dead header
Date: Tue, 16 Jul 2019 09:31:16 -0500
Message-Id: <20190716143116.5262-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OHlmtFU9QceXmcFxXquWX749VE/1r39DmjduersNZf0=;
 b=I/EyUKWilrH75Gr33w4lv6/p2x99uDo5bTWT+ZLg9lReDlUQoJGPdAjCYtWhpSruUG
 PzmHfgbPXEci0NJ5Q/jL7BitI01p+xWncA3Fcn6uK/QIlw7gwGxQ/VURhwH1xtFAJUkF
 z72gem9INQ20wcJPdntwvHIdqghn5RJj1dHqtcL/jhoUiQ9MH6nyXOKndIAu5/mqKe7M
 a3tQ+rXO7tVrfKJv8PoptjixiZAN/swszDf/X5edv8nBmkuhndpNRIGpEmJA+or+fcw6
 nYh2tXTrWxx2TCtgKg87QU847Kk3VQ5yokgE1SDkVJA7GRHrWfMI3M6Flf/7mRcWETsi
 GtxA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm90IHVzZWQgYW55bW9yZS4KCk5vdGljZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWls
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZpLmMgICAgIHwgIDEgLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmlfZHBtLmggfCAzMiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aV9kcG0uaAoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92aS5jCmluZGV4IGI4YWRmMzgwOGRlMi4uZmZmYWU0YzI5NzNiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3ZpLmMKQEAgLTU3LDcgKzU3LDYgQEAKIAogI2luY2x1ZGUgInZpZC5oIgogI2luY2x1
ZGUgInZpLmgiCi0jaW5jbHVkZSAidmlfZHBtLmgiCiAjaW5jbHVkZSAiZ21jX3Y4XzAuaCIKICNp
bmNsdWRlICJnbWNfdjdfMC5oIgogI2luY2x1ZGUgImdmeF92OF8wLmgiCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aV9kcG0uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3ZpX2RwbS5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBjNDNlMDNmZGRm
YmEuLjAwMDAwMDAwMDAwMAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aV9kcG0u
aAorKysgL2Rldi9udWxsCkBAIC0xLDMyICswLDAgQEAKLS8qCi0gKiBDb3B5cmlnaHQgMjAxNCBB
ZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCi0gKgotICogUGVybWlzc2lvbiBpcyBoZXJlYnkg
Z3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKLSAqIGNv
cHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0
aGUgIlNvZnR3YXJlIiksCi0gKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3Ry
aWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCi0gKiB0aGUgcmlnaHRzIHRvIHVz
ZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwK
LSAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVy
c29ucyB0byB3aG9tIHRoZQotICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJq
ZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKLSAqCi0gKiBUaGUgYWJvdmUgY29weXJp
Z2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBp
bgotICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUu
Ci0gKgotICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFO
VFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKLSAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9U
IExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAotICogRklUTkVT
UyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVW
RU5UIFNIQUxMCi0gKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUgTElB
QkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IKLSAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhF
UiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAotICogQVJJU0lO
RyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUg
VVNFIE9SCi0gKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCi0gKgotICovCi0KLSNp
Zm5kZWYgX19WSV9EUE1fSF9fCi0jZGVmaW5lIF9fVklfRFBNX0hfXwotCi1leHRlcm4gY29uc3Qg
c3RydWN0IGFtZF9pcF9mdW5jcyBjel9kcG1faXBfZnVuY3M7Ci1pbnQgY3pfc211X2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwotaW50IGN6X3NtdV9zdGFydChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldik7Ci1pbnQgY3pfc211X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpOwotCi0jZW5kaWYKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
