Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE92C3AE4
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Nov 2020 09:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C65B6E935;
	Wed, 25 Nov 2020 08:23:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4666E52A
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g14so8355786wrm.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NyGlFqixaiqzHeNjep6qOwxxLQG3LHz2EsMbdYbo/ho=;
 b=QK9K5fe96I7qEbtSo01TjZGeTEFHCALFSW9gDK734tMa58wkL9VHsxuCvdEj884V0g
 gr7nA7du2QcSx4jOuXXCOWtHAWqZxsxxWsGyo+J/3stsNw5sk7DLhs72Iu8ePe23R5nP
 WRVXWrRtyhwsmkxvhmAd+2n1rAmriJ00bHAhvU1PoLoCnWobAGx7R30VNBpkCV2SDJnX
 aauIFEnwpTJGIqj2G09SxsETcOM8nmQXD6LRYp7AgzuZPzdO7FN1kUknbTZIp0e3o6V/
 ZKh4oAvb4vKZvkRAgMcmM7EBwi06kVzTy3IR1gu3mA3UjyGY7pmqvI+PoHrUf5ZOz1s0
 xh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NyGlFqixaiqzHeNjep6qOwxxLQG3LHz2EsMbdYbo/ho=;
 b=K9XGiwzN99rWPf6XDtdLvPni1ciTM489+FrPiC6ZGKGgRv4//BLMZbxNBCn7QSl24y
 qTD26Zx6wHB28wd/Xi1RSccrLx5cdKIFeEKoXQ0vBPhD2bhSoFAIoTBZrKeINZ8QT+tw
 wr2VhkdGPr0m7kWzK0nOVbPssnvb4H8SZgNnksYQbk/uSBMRKnizlyHZWFjsJ2shOvp0
 3hFf0Fhlg8Q38Lalfn/Ka7rETj7TUz5OHwrdHZxkjXwTQckdwjSged/X6FC4uVWFZbA6
 jawI+GLuq6aX93g7o4IkHoMEoSuqPC9K01EE2/IJhgEyMnL5vd0+eEjllg7Za+4xvN9M
 Sf8A==
X-Gm-Message-State: AOAM532vn7DilhaiOn6xQfEzB7lqlfMgG95wW2fRRGpIt3WfxPPhTAgm
 6sUyiDfwkEmjxa7JsDPuPfV2Dg==
X-Google-Smtp-Source: ABdhPJwV7ExgIYDuoR+4W+qYYmwP65bSFwjiRy6ys8NECT5d9bmDI42mNreeAXC2LgTUyJR75gObLw==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr59620wrn.231.1606247084047;
 Tue, 24 Nov 2020 11:44:44 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 36/40] drm/amd/pm/inc/smu_v11_0: Mark 'smu11_thermal_policy'
 as __maybe_unused
Date: Tue, 24 Nov 2020 19:38:20 +0000
Message-Id: <20201124193824.1118741-37-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:22:58 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQncyB1c2VkIGluIHNvbWUsIGJ1dCBub3QgYWxsIHNvdXJjZSBmaWxlcyB3aGljaCBpbmNsdWRl
ICdzbXVfdjExXzAuaCcuCgpGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2Fy
bmluZyhzKToKCiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vcG0vc3dzbXUvc211MTEvc211X3YxMV8wLmM6MzY6CiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9wbS9pbmMvc211X3YxMV8wLmg6NjE6NDM6IHdhcm5pbmc6IOKAmHNtdTExX3Ro
ZXJtYWxfcG9saWN54oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJp
YWJsZT1dCiA2MSB8IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc211X3RlbXBlcmF0dXJlX3JhbmdlIHNt
dTExX3RoZXJtYWxfcG9saWN5W10gPQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmln
IiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9zbXVfdjExXzAuaCB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9pbmMvc211X3YxMV8wLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2lu
Yy9zbXVfdjExXzAuaAppbmRleCBlZmYzOTZjN2EyODFmLi45NzQyYTAyZTdiMTZiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9zbXVfdjExXzAuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL2luYy9zbXVfdjExXzAuaApAQCAtNTgsNyArNTgsOCBAQAogI2RlZmlu
ZSBDVEZfT0ZGU0VUX0hPVFNQT1QJCTUKICNkZWZpbmUgQ1RGX09GRlNFVF9NRU0JCQk1CiAKLXN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc211X3RlbXBlcmF0dXJlX3JhbmdlIHNtdTExX3RoZXJtYWxfcG9s
aWN5W10gPQorc3RhdGljIGNvbnN0CitzdHJ1Y3Qgc211X3RlbXBlcmF0dXJlX3JhbmdlIF9fbWF5
YmVfdW51c2VkIHNtdTExX3RoZXJtYWxfcG9saWN5W10gPQogewogCXstMjczMTUwLCAgOTkwMDAs
IDk5MDAwLCAtMjczMTUwLCA5OTAwMCwgOTkwMDAsIC0yNzMxNTAsIDk5MDAwLCA5OTAwMH0sCiAJ
eyAxMjAwMDAsIDEyMDAwMCwgMTIwMDAwLCAxMjAwMDAsIDEyMDAwMCwgMTIwMDAwLCAxMjAwMDAs
IDEyMDAwMCwgMTIwMDAwfSwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
