Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384F37E425
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA43D6E7D5;
	Thu,  1 Aug 2019 20:30:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530786E7C0
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:17 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id z4so71728220qtc.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yoFkmZVtmhx/VjhfFvEZTtWgDvQHUxYy8b2AbhDIXyw=;
 b=gGw+YjYbwuApnaE9hLE5EI57SIyK5D8hRBt0iqh3HsnhITeFRt7bZwOxtipDXDQYbB
 nGaPL1fuvR56V8z8D1H0X+/dKl3rBL2dvg5O0xWKgGv6dlnzyai06+ynvBT4QWc64K8t
 NxosRkhsMtTkDnXnFYzos+jefE1T7E2VRPzG9/w63WjrwK2/6DXo4gNPH9wOXYBVEOwh
 nEugAtUQ08Ks3bz3Eomfptcwiku7clh5so2SJj2k3lrxkM+lDy29i11yzIGFTJoJEf8I
 /W7gWHN0N3CeVICYMK15qXN7kdHnm/DolOXhY8q2/G73lILGguBqu5J8/oRabT1fiRFs
 u7WA==
X-Gm-Message-State: APjAAAV52b8hnXAL2934DjdFLMiJkocBXOeM1U0uaqk3ksMNjvDNY9Ms
 5LAyOUFYAGNF8uzbpyU7Sj8Q+RWH
X-Google-Smtp-Source: APXvYqxdR4a5xNDtOGAXGhlhtfY98wU7k7UBRx6DJXiqtvI/yOpZVqER4mHZsojKIgig8B7Grqucew==
X-Received: by 2002:ac8:2aaa:: with SMTP id b39mr93201334qta.24.1564691416247; 
 Thu, 01 Aug 2019 13:30:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 12/36] drm/amdgpu/gfx10: add placeholder for navi12 golden
 settings
Date: Thu,  1 Aug 2019 15:29:33 -0500
Message-Id: <20190801202957.29791-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yoFkmZVtmhx/VjhfFvEZTtWgDvQHUxYy8b2AbhDIXyw=;
 b=uvkTFwwhz9RltDhkxoXk1EMVgmemUHVlOGLeenYEXniVjTICfAXXA1dgDbbNjjgNe/
 LULkj/01qhZGivsuDschTRl+ZuDXgnqWk9AJqnUwAsd21MGMsXTbF8dEQnDKnWb2JLWe
 zcXGxwLn7EQErqg4jrH5qqzPecrnfgjqotSW/5F5plmChaJCmu4q4c5NhkFGhcME04Ml
 2mH5kLUWhFEDQw10eNfdRu35Hil9V/IaXXJ1THe1iRDls+Vn9rPiZ2k+EaQnAozGu8Jo
 /+rocSKf0S2bWosTbIpucm++XL+htXgwUoLnZ2y44MfMgPaXlqBPciLJcLLH36YnY4IQ
 yNdQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCk5vdCB1c2VkIHlldC4K
ClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDEzICsrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYwppbmRleCA5OWI1NzUzN2Y4NjcuLmRjY2U1ZTA1NmMxNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTE3MCw2ICsxNzAsMTEgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5nc19nY18xMF8xX252MTRbXSA9
CiAJLyogUGVuZGluZyBvbiBlbXVsYXRpb24gYnJpbmcgdXAgKi8KIH07CiAKK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2NfMTBfMV9udjEyW10g
PQoreworCS8qIFBlbmRpbmcgb24gZW11bGF0aW9uIGJyaW5nIHVwICovCit9OworCiAjZGVmaW5l
IERFRkFVTFRfU0hfTUVNX0NPTkZJRyBcCiAJKChTSF9NRU1fQUREUkVTU19NT0RFXzY0IDw8IFNI
X01FTV9DT05GSUdfX0FERFJFU1NfTU9ERV9fU0hJRlQpIHwgXAogCSAoU0hfTUVNX0FMSUdOTUVO
VF9NT0RFX1VOQUxJR05FRCA8PCBTSF9NRU1fQ09ORklHX19BTElHTk1FTlRfTU9ERV9fU0hJRlQp
IHwgXApAQCAtMzE5LDYgKzMyNCwxNCBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfaW5pdF9nb2xk
ZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJCQkJZ29sZGVuX3Nl
dHRpbmdzX2djXzEwXzFfbnYxNCwKIAkJCQkJCShjb25zdCB1MzIpQVJSQVlfU0laRShnb2xkZW5f
c2V0dGluZ3NfZ2NfMTBfMV9udjE0KSk7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9OQVZJMTI6CisJ
CXNvYzE1X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKKwkJCQkJCWdvbGRlbl9zZXR0
aW5nc19nY18xMF8xLAorCQkJCQkJKGNvbnN0IHUzMilBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5n
c19nY18xMF8xKSk7CisJCXNvYzE1X3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2UoYWRldiwKKwkJ
CQkJCWdvbGRlbl9zZXR0aW5nc19nY18xMF8xX252MTIsCisJCQkJCQkoY29uc3QgdTMyKUFSUkFZ
X1NJWkUoZ29sZGVuX3NldHRpbmdzX2djXzEwXzFfbnYxMikpOworCQlicmVhazsKIAlkZWZhdWx0
OgogCQlicmVhazsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
