Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73A2C62C0
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Nov 2020 11:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C1C6EBA7;
	Fri, 27 Nov 2020 10:14:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4676E985
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i2so2195195wrs.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MzRVFp8AO2A9mZrX3brzbvLyGgDmiC5m751T9imyCRc=;
 b=WruioXcrjaQXU228DJaADLs63/PeaAfgh5GoVhtS5sxDT1aaFya2f4AYcNpDv9u7bu
 GE1IyxUSraaGMfjae2iGxbtoeGDlaW+aiGQz0vg8TbLIY3ULpfiO0MK4dgdeEqpWqVx1
 yjcfF20TWnnH0cv4oDwvCg85uHtK2SGSmK1YF38tJjmq8Q3LkjcNMsQhTX/53aLKtFf5
 m/kX+iYDcOMeyHPxWub6ueiDU0b4zprEOJhekf0gK6T4eHQe+/Vq2GekDvnMHh8QrFzI
 xCL2JKIJXk2Yr/1uD0ZBcmLFk/2Tp0pKgKnkhHZPm825anEGjFCEYELdOff1mSgXjeKf
 GGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MzRVFp8AO2A9mZrX3brzbvLyGgDmiC5m751T9imyCRc=;
 b=mr3gwnjVg6t+tt0juD9U/3koEtVydLnklQoOSP1Q6ggX6xm2jHHXIok+iJe4MmO5Sq
 yVPLcNlyVmSi0Qr/sxLgEwqyE50MXMYmYvfIrLNbQnpU0BcjSP3t1rMKbua3pYhnMGsn
 k84S7CKp4ZtsTHIjnLi3ykZ8tRW5WzzRlUCVZhBq2xVpHEnL/f66+FY4sQ9WfojZSHW6
 ZHR4iLgcG55EPaPkkoHMuceIUdND4KovSw1+FO/pfZfjRe5oVMKggvuN/On2tvaehfpZ
 HhUSFGJn4obj0vp6sijOTfwNevWXYOgpH23Ywkl8NlcpZ0FmsGGvrovvR4HA0KWvxjkP
 ujWQ==
X-Gm-Message-State: AOAM533W+T7NwFJL+SOe0o0jidV2nX/1YDvv1LeBICxXJWx7Vm47kTyX
 olmcyA/BsjYWXSmVNb0JWP2/Vg==
X-Google-Smtp-Source: ABdhPJzgo+nf2gxrwPa2phadC7hbPLT0T+NFYc2Mw3GiAqa/kWC5egDN9CWdbIV+A6DvPgiUPY+pMg==
X-Received: by 2002:adf:f651:: with SMTP id x17mr3881849wrp.185.1606398214358; 
 Thu, 26 Nov 2020 05:43:34 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/40] drm/amd/display/dc/inc/hw/dpp: Mark
 'dpp_input_csc_matrix' as __maybe_unused
Date: Thu, 26 Nov 2020 13:42:33 +0000
Message-Id: <20201126134240.3214176-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Nov 2020 10:14:32 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

J2RwcF9pbnB1dF9jc2NfbWF0cml4JyBpcyB1c2VkIGJ5IHNvbWUsIGJ1dCBub3QgYWxsIHNvdXJj
ZSBmaWxlcyB3aGljaAppbmNsdWRlIGRwcC5oLgoKRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2Vy
bmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9pbmMvaHcvZHBwLmg6NTA6NDI6IHdhcm5pbmc6IOKAmGRwcF9pbnB1dF9jc2NfbWF0
cml44oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCgpO
QjogU25pcHBlZCBsb3RzIG9mIHRoZXNlIGZvciBicmV2aXR5CgpDYzogSGFycnkgV2VudGxhbmQg
PGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4K
Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2RwcC5oIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9kcHAuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZHBwLmgKaW5kZXggNjc1MTE4NmY2ZjkwNC4u
ZGRiZTRiYjUyNzI0YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2luYy9ody9kcHAuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3
L2RwcC5oCkBAIC00Nyw3ICs0Nyw3IEBAIHN0cnVjdCBkcHBfaW5wdXRfY3NjX21hdHJpeCB7CiAJ
dWludDE2X3QgcmVndmFsWzEyXTsKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHBwX2lucHV0
X2NzY19tYXRyaXggZHBwX2lucHV0X2NzY19tYXRyaXhbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgZHBwX2lucHV0X2NzY19tYXRyaXggX19tYXliZV91bnVzZWQgZHBwX2lucHV0X2NzY19tYXRy
aXhbXSA9IHsKIAl7Q09MT1JfU1BBQ0VfU1JHQiwKIAkJezB4MjAwMCwgMCwgMCwgMCwgMCwgMHgy
MDAwLCAwLCAwLCAwLCAwLCAweDIwMDAsIDB9IH0sCiAJe0NPTE9SX1NQQUNFX1NSR0JfTElNSVRF
RCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
