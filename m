Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B6F48E20
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2BF8970B;
	Mon, 17 Jun 2019 19:18:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF6589686
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:31 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g18so6943605qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/kF++E6TviS0mwkav0+toEeuj01nIbHjkTJdfdcqa94=;
 b=cRrpmtRHip2j1K/sOKS2slbPYYKHhteROuPbHF2krBQ0MOQ76Ia2SfA/I0gLf1IWRJ
 sMrWJEDX8ryJpI/rZAbpT8E2glxYi43Yect9p1uqQvkqA6XjSvfKhzmPDMqcNdQmmP06
 CuxBrkmW7pgMeofTE8M0LLBqveyFExs9wEFWTxyPLrr7nz2hiDmBI4E6UPi+9/CodlQy
 NmGKPjz1zh8X3T3X+EvS0GRIlBeFO9lZi4/S3HaOXM+UAz6Hw+PoEL/O0LZCvYz60jQ0
 A0LPv0zDt+e0k4Acuavt1oJn8DDXfVU74RTX4Vc+x094ugClsHprS9OgnYbCkeR9O+u4
 MoTw==
X-Gm-Message-State: APjAAAVwRQq0s2jKAJJE15f/dHUeL/eoMo7rQk0GSz3mANaifl4v7YcV
 h3xW+A5y4Ndl/ec54RwEDy6ahosxlws=
X-Google-Smtp-Source: APXvYqwEmWoLfCJAbQsEtXBeFyFKYoKM9KwnlcMvpRsyAGHgG8YLKRvTj0VJiB5rL5LII+PpcrlMTA==
X-Received: by 2002:a37:9d1:: with SMTP id 200mr42197625qkj.306.1560799110074; 
 Mon, 17 Jun 2019 12:18:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 092/459] drm/amdgpu: add ib preemption status in amdgpu_job
Date: Mon, 17 Jun 2019 14:10:53 -0500
Message-Id: <20190617191700.17899-81-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/kF++E6TviS0mwkav0+toEeuj01nIbHjkTJdfdcqa94=;
 b=KchUrOrMWzkP0pDRwE/4PTHIkQZ4ugZCzVQH/MpSkGQElJyOOBS8X7vZQDkKX2Zt4O
 6MSflJV8j51xXGjTW58+R+cqROA+msErOCCGlP95Ee3ySSd3Yn4x+al99HwXAcvET/uC
 woZ66PaMsEo/EymCpykUAeyl2UNsJmPS38/8f2Nf0yBfrZa2Re1umTnh3fUGSHJ7sI5S
 In+lTyrEgnQAjlR7EZM1bGKRu3ZvmHcC8vR7EPGrGDYfTXRgqwH7NENXJWM7/x4yU97/
 Oefo2bE5ep3AsfAXiaCKIIPz5GZUK+Bg7LkgV93D53O30vjRK8Ar5P23Bv47NgYVXEGr
 M7qg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFkZCBpYiBwcmVlbXB0aW9uIHN0
YXR1cyBpbiBhbWRncHVfam9iLCBzbyB0aGF0IHJpbmcgbGV2ZWwgZnVuY3Rpb24KY2FuIGRldGVj
dCBwcmVlbXB0aW9uIGFuZCBwcm9ncmFtIGZvciByZXN1bWluZyBpdC4KCkFja2VkLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8
SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
aWIuYyAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmggfCAz
ICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCmluZGV4IGUxNTUzMWJmY2Q0Ny4uOTBj
YzA4NDFiNTY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
aWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYwpAQCAtMjA4
LDcgKzIwOCw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLCB1bnNpZ25lZCBudW1faWJzLAogCiAJc2tpcF9wcmVhbWJsZSA9IHJpbmctPmN1cnJlbnRf
Y3R4ID09IGZlbmNlX2N0eDsKIAlpZiAoam9iICYmIHJpbmctPmZ1bmNzLT5lbWl0X2NudHhjbnRs
KSB7Ci0JCXN0YXR1cyB8PSBqb2ItPnByZWFtYmxlX3N0YXR1czsKKwkJc3RhdHVzIHw9IGpvYi0+
cHJlZW1wdGlvbl9zdGF0dXM7CiAJCWFtZGdwdV9yaW5nX2VtaXRfY250eGNudGwocmluZywgc3Rh
dHVzKTsKIAl9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9qb2IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaAppbmRleCBl
MWI0NmE2NzAzZGUuLjUxZTYyNTA0YzI3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2pvYi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9qb2IuaApAQCAtMjksNiArMjksOCBAQAogI2RlZmluZSBBTURHUFVfUFJFQU1CTEVfSUJf
UFJFU0VOVF9GSVJTVCAgICAoMSA8PCAxKQogLyogYml0IHNldCBtZWFucyBjb250ZXh0IHN3aXRj
aCBvY2N1cmVkICovCiAjZGVmaW5lIEFNREdQVV9IQVZFX0NUWF9TV0lUQ0ggICAgICAgICAgICAg
ICgxIDw8IDIpCisvKiBiaXQgc2V0IG1lYW5zIElCIGlzIHByZWVtcHRlZCAqLworI2RlZmluZSBB
TURHUFVfSUJfUFJFRU1QVEVEICAgICAgICAgICAgICAgICAoMSA8PCAzKQogCiAjZGVmaW5lIHRv
X2FtZGdwdV9qb2Ioc2NoZWRfam9iKQkJXAogCQljb250YWluZXJfb2YoKHNjaGVkX2pvYiksIHN0
cnVjdCBhbWRncHVfam9iLCBiYXNlKQpAQCAtNDUsNiArNDcsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2pv
YiB7CiAJc3RydWN0IGFtZGdwdV9pYgkqaWJzOwogCXN0cnVjdCBkbWFfZmVuY2UJKmZlbmNlOyAv
KiB0aGUgaHcgZmVuY2UgKi8KIAl1aW50MzJfdAkJcHJlYW1ibGVfc3RhdHVzOworCXVpbnQzMl90
ICAgICAgICAgICAgICAgIHByZWVtcHRpb25fc3RhdHVzOwogCXVpbnQzMl90CQludW1faWJzOwog
CXZvaWQJCQkqb3duZXI7CiAJYm9vbCAgICAgICAgICAgICAgICAgICAgdm1fbmVlZHNfZmx1c2g7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
