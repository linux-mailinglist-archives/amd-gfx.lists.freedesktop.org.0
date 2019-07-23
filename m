Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D97871D3F
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 19:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9016E31C;
	Tue, 23 Jul 2019 17:01:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD70D6E311
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:00:58 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id v18so17201200uad.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWXIzzvNfuba7Z37WoAhKdux5eIIZ6vcoQyqJLNws28=;
 b=qTB3ajOq4HVeAGtO6dH83hP6Xa9x3bEo/J+fN8DnRLbNLWFaSBnQAvFad0WWq31Y3a
 n7SMxC5FeJ8yeJaq66mIsd6mVs+eXqUMCP5Qh9Jvnyzak8bnhZV1T33fqYDC4ZzKcfwK
 5I1ERpbgW/uao9xOL1o+BiVVXowc8wyzrPrli/QpRtzpgV6CEEf9SyTfjsTm8vTTkHa5
 qOVxuGlXDiZ2y8ZDI3fvqcE86B6OkWYkPL2kRyltpP6l1o+eE6DKkDKT4qDPWloFHbVZ
 5VY8t0sge7c5zFCFpTO4og2ZF/FE4ohVQvXbdn/8MstSaHP5vbuv5eq+WBrGmb1A5e0e
 wctA==
X-Gm-Message-State: APjAAAWJfyBeZ3hCbGz5fk66zrGYWvjT8K31SZr9Ia1estwQpApPJYAV
 LIBKks8mhtL02ozxbazzBLhd7HCv
X-Google-Smtp-Source: APXvYqzncAcOGz4oWdM8Hxqk+CKmFDE7urysiJZcU4XapYupIhSKXVgWreFNuZrtmszC6n87TKT30w==
X-Received: by 2002:ab0:2994:: with SMTP id u20mr18297958uap.114.1563901257653; 
 Tue, 23 Jul 2019 10:00:57 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id a23sm578879vkl.52.2019.07.23.10.00.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 10:00:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu/powerplay/vega10: call PrepareMp1ForUnload in
 power_off_asic
Date: Tue, 23 Jul 2019 12:00:48 -0500
Message-Id: <20190723170049.9143-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723170049.9143-1-alexander.deucher@amd.com>
References: <20190723170049.9143-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kWXIzzvNfuba7Z37WoAhKdux5eIIZ6vcoQyqJLNws28=;
 b=Fh9cIzJg2TJ2fcDdvBO7WLBxEjgM6UVU/frSoZhl0Mh3Zb0sAJLxQIPBBzKYrv7uDx
 pKIsRKlLMTe3WFea0i5tePbK+Edvbhk0x5aP5Su3R0v1tSWKYoR8xsbnN/5XcMcaBuP8
 KYjA/lZ5P+spibuNEAhx7w6IMcWqZ/r4utg6WFlhfglux9sAj4nXMqnqp8df9L8rewQf
 tt4cHSaNOHOGihhGr9MdVbV1O/6e6p/jQjcKzJvMNGKWWa1M/dpdO/uwG9hVePhf41d0
 aIkWD+Zjl1n+7ME4u4+at4FkTXMLlpwTdPbh2srwimby1TnB+uuYn0nAxoHJcxQDL4Ag
 HcFA==
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
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyB8IDUgKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jCmluZGV4IDFkOWJiMjlhZGFlZi4uYTYwNjZk
OTJkZTc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92
ZWdhMTBfaHdtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92
ZWdhMTBfaHdtZ3IuYwpAQCAtNDc0MCw2ICs0NzQwLDExIEBAIHN0YXRpYyBpbnQgdmVnYTEwX3Bv
d2VyX29mZl9hc2ljKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJCQkpOwogCWRhdGEtPndhdGVy
X21hcmtzX2JpdG1hcCAmPSB+KFdhdGVyTWFya3NMb2FkZWQpOwogCisJUFBfQVNTRVJUX1dJVEhf
Q09ERSgocmVzdWx0ID0gc211bV9zZW5kX21zZ190b19zbWMoaHdtZ3IsCisJCQlQUFNNQ19NU0df
UHJlcGFyZU1wMUZvclVubG9hZCkpID09IDAsCisJCQkiW1ByZXBhcmVNcDFGb3JVbmxvYWRdIEZh
aWxlZCEiLAorCQkJcmV0dXJuIHJlc3VsdCk7CisKIAlyZXR1cm4gcmVzdWx0OwogfQogCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
