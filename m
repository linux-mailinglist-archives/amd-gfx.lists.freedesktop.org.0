Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA2871D3E
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 19:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AB06E311;
	Tue, 23 Jul 2019 17:01:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960016E311
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:00:59 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id m23so29318841vso.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X4yrT3AFuDBh5WKHynG8zfZWQ7cWpWKVgGhYC5b73/0=;
 b=kDkEXvRUECh3SuR0Qfo/rwA+gSrCefN/sJyZ1b9yOlPVSGm7254ms2HvNrURe6Yug2
 eQJGNs1Qz+A8qPvUqwNbfANSxMtOKdJmuN4BoZXJ7a7NMhwysDbs9pcLQzWqZVOZVdHY
 0ScR9xtGcqNfnqHMARGZWabj7xX75N3/FQCrXAOZr1bo/nMIst70dxhzfN4fvw+s/QkL
 qDuGkKcMUxLSCMWdDOMLPOlX7zu1p0+lXt7Fl6hUs1YBPpjulF6Ypyb9ZVuCuOG/5Lwa
 VX4TrV3Qk4/gWnEOg+WmqidhQhT+Hln3PPTlhTIt65VJ1GkcYMa4hAk12YOaE0OsVHT8
 YtVA==
X-Gm-Message-State: APjAAAUclbPVOUaWzwzVkdwfVz4VCQKZ0TFLxSbMnVllGJAk/gGpEy9b
 uk26yUxeJqH/4hQyONpQC8t4iwdO
X-Google-Smtp-Source: APXvYqy1PssQ4eLIIw87CbFIOLpZclqrYYMxZmq+3Q6DI76HFzX14cjcgLXa9rmrXLVuilUMun9FLw==
X-Received: by 2002:a67:fb0d:: with SMTP id d13mr47966428vsr.69.1563901258515; 
 Tue, 23 Jul 2019 10:00:58 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id a23sm578879vkl.52.2019.07.23.10.00.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 10:00:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu/powerplay/vega12: call PrepareMp1ForUnload in
 power_off_asic
Date: Tue, 23 Jul 2019 12:00:49 -0500
Message-Id: <20190723170049.9143-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723170049.9143-1-alexander.deucher@amd.com>
References: <20190723170049.9143-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X4yrT3AFuDBh5WKHynG8zfZWQ7cWpWKVgGhYC5b73/0=;
 b=ufYuI7ubF3mP4G81o5/VsUiRgyuT2b1OaDmQrwq3aEA+Q6JeOubUFZVPaDEW5Vd3Pq
 bhGgHiQb0QHGGBFXgFbASzPehdLGxRKJdauBEYV+J/3ce6xQaOwMffrG4Bgw+loCnpYZ
 WQQNPCczKWn/l/23q1ZiAC0BgLUWijAnLK694QI38y8LuaRAqy3KZmMotpyeT1BhCJYD
 DAFdtY56l9cgU/4A34PL6KfVkP23wLDMpTVARkOcfeUkU54yeECKe0120qnIU6V4VN/y
 woSj3LqgYdUuJTPBytDiIVH2D67UOG6Yuyeoq3ZwZLHz4UdB7E8M+EwnUK0mgLnxneHl
 Oz8g==
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

TmVlZGVkIHRvIG1ha2Ugc3VyZSB0aGUgc211IGlzIGlkbGUgd2hlbiByZXNldHRpbmcuIFRoaXMg
bWF5IGZpeApzcG9yYXRpYyBmYWlsdXJlcyB3aXRoIEdQVSByZXNldC4KClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYyB8IDUgKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMTJfaHdtZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jCmluZGV4IGVmYjZkMzc2MmZlYi4uM2QzNTA0
NDExYjYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92
ZWdhMTJfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92
ZWdhMTJfaHdtZ3IuYwpAQCAtMjQ2OCw2ICsyNDY4LDExIEBAIHN0YXRpYyBpbnQgdmVnYTEyX3Bv
d2VyX29mZl9hc2ljKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJCQkpOwogCWRhdGEtPndhdGVy
X21hcmtzX2JpdG1hcCAmPSB+KFdhdGVyTWFya3NMb2FkZWQpOwogCisJUFBfQVNTRVJUX1dJVEhf
Q09ERSgocmVzdWx0ID0gc211bV9zZW5kX21zZ190b19zbWMoaHdtZ3IsCisJCQlQUFNNQ19NU0df
UHJlcGFyZU1wMUZvclVubG9hZCkpID09IDAsCisJCQkiW1ByZXBhcmVNcDFGb3JVbmxvYWRdIEZh
aWxlZCEiLAorCQkJcmV0dXJuIHJlc3VsdCk7CisKIAlyZXR1cm4gcmVzdWx0OwogfQogCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
