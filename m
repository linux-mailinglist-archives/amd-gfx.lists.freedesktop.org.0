Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 088B22EF918
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Jan 2021 21:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D456E907;
	Fri,  8 Jan 2021 20:24:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8365C6E8C4
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id c133so8744860wme.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2u/LayQzAWY4TNKfG7PHD7/3//FK6Zy4l1U89GrL1AU=;
 b=C8oQ5FPceqRzS1vcOvfKUF5XvX1ZAR7TWwHJd/zeta8nGuC7Y8Rxdc1VrQ9hg3sTj9
 Z+AJxpC37ZuIHfp6IEGutLehSN1RS71qWCfc41gtEvSu44qkydWWUx6irE68vDUaj6ZN
 KyBk+FsGVTte1VzCr0gEuPR3jZfzmd/zGs36S9ssPC/9rmfbEV+h70t+i20ZbGr54lwk
 uE29yLlehTcswauyv6jRU2EZHCGseExxnpFbO+bid4hzfxJw2Y30IwaAUdHkaryLylZV
 OfDWoiXw8s05ynAKqCBvqi9ekzulnXtGu2ZGD2K5Jj4VEs8GNOW/3H56k+mIelFljEN6
 VScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2u/LayQzAWY4TNKfG7PHD7/3//FK6Zy4l1U89GrL1AU=;
 b=sx/AmaTZma9IvncZCt9BGGs2ATIH+pfIrFX6hRZekAgLLmeeFHEkGfSmq9n+7Pv4Od
 RY/pTVkiz++tYmXVnYd+6tIqPhOkBFnEn0I+oVbRAanhOZXkzRGfg4aqKBe2pDo6fp4N
 fBicupFQzfzF9wmWndV4KAog0E+mvyKRDYyq5CfNeGoXlbaXz48frc3VBYGuJw41vwvm
 5x4JkjIrrURSkeCyaaRjRqvQO0e/NFJoOfVmJqfKVRE7bS8TM/wI62iBdXX9F9qNYS1R
 voYkHDlfawpULxA/51SuAPE+PkKRqqkahC3ecFk13YrF480AtEofAkMQJjkx8gy1jDM2
 XYBA==
X-Gm-Message-State: AOAM532skcEPjkiYR5pUV5wedNs7Yf7QpGfbhVzBj+I/407a1WR3LlNo
 07TbCTsOfR/4Nim/EOu2sbKvMKXC6st9k44d
X-Google-Smtp-Source: ABdhPJzHrgMiBuwS2VLTNxDpoDF74KuwkC8RlBXayLHMw9O0W3OoeJfOF68jv0qbe6mhmH6A4tCDwg==
X-Received: by 2002:a1c:3b46:: with SMTP id i67mr4349396wma.108.1610136910141; 
 Fri, 08 Jan 2021 12:15:10 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/40] drm/amd/amdgpu/amdgpu_ih: Update
 'amdgpu_ih_decode_iv_helper()'s function header
Date: Fri,  8 Jan 2021 20:14:21 +0000
Message-Id: <20210108201457.3078600-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Jan 2021 20:24:14 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmM6MjIwOiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X2loX2RlY29k
ZV9pdl9oZWxwZXInCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWguYzoyMjA6
IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2VudHJ5JyBub3QgZGVzY3Jp
YmVkIGluICdhbWRncHVfaWhfZGVjb2RlX2l2X2hlbHBlcicKCkNjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEZlbGl4IEt1ZWhsaW5nIDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfaWguYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWguYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jCmluZGV4IDcyNWE5YzczZDUxZjAuLmRjODUy
YWY0ZjNiNzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
aC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jCkBAIC0yMDks
NiArMjA5LDggQEAgaW50IGFtZGdwdV9paF9wcm9jZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCBzdHJ1Y3QgYW1kZ3B1X2loX3JpbmcgKmloKQogICogYW1kZ3B1X2loX2RlY29kZV9pdl9o
ZWxwZXIgLSBkZWNvZGUgYW4gaW50ZXJydXB0IHZlY3RvcgogICoKICAqIEBhZGV2OiBhbWRncHVf
ZGV2aWNlIHBvaW50ZXIKKyAqIEBpaDogaWggcmluZyB0byBwcm9jZXNzCisgKiBAZW50cnk6IElW
IGVudHJ5CiAgKgogICogRGVjb2RlcyB0aGUgaW50ZXJydXB0IHZlY3RvciBhdCB0aGUgY3VycmVu
dCBycHRyCiAgKiBwb3NpdGlvbiBhbmQgYWxzbyBhZHZhbmNlIHRoZSBwb3NpdGlvbiBmb3IgZm9y
IFZlZ2ExMAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngK
