Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7AD7E438
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE4D6E802;
	Thu,  1 Aug 2019 20:30:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588B16E7FA
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:34 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id r21so53171939qke.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ck0hrwXCUeydWnSSh2F+Zos/lCzqMg2kn+MaGErjqfU=;
 b=ENdSEKHO/TV/VfYVogJIQ9evrTy+Opab2mEtdJ3STqw8NHmLSJxU2bliGd2duH7viD
 jj8AQ4y+QYNnEPcv646+yFdoDWNjwvuhnF2ReVoSfcVFj2J1MNdYx2qB+UCuSCQ2/COY
 qaFa3uZOuw4YTe7uYKHeDRP7PxPRg5c9kI/O8Y/sqzdHbuH4aJ5c23Z4TK9kxErTB5Bx
 tbkMIgRtMWgxb+hVCdHhgHiiiSghaKV5Mq0lcK/C/ZC3zmYgU94txmvjotJT3628dbA6
 ZwDGEi5PF82uYrHvJvWmG5Ofg3Nnwv/IPV5cBfG0IiOJTHk1rIZNjE6f5qT9eRmf+YXY
 AGsw==
X-Gm-Message-State: APjAAAVAdsizE8HlfIRlys164JhSilf/yEwScFRh884MOxxQIpkvFX+V
 Cp8bk5JcWrmIec6h9SBZ3xhNI4F4
X-Google-Smtp-Source: APXvYqyfpGRa1MFugbaNLZQvIJbF97pYeSJ5lNYop5v8AZQq/3S9jwKZqKYc4hMqsxrSaS0yFUTuHg==
X-Received: by 2002:a37:c81:: with SMTP id 123mr89732456qkm.474.1564691433254; 
 Thu, 01 Aug 2019 13:30:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 31/36] drm/amdgpu: add VCN ip block for Navi12
Date: Thu,  1 Aug 2019 15:29:52 -0500
Message-Id: <20190801202957.29791-32-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ck0hrwXCUeydWnSSh2F+Zos/lCzqMg2kn+MaGErjqfU=;
 b=EAe43Wa1/alPSBkEGTwcZxDejkok5nDs09HqOuIGkCZumRuy74IRomoJuSspia2802
 vumEi2X87tlBHN82RSEjtdE/8g8QcuFFEEcox39/0bwG8D+K2KKowXzxsaj7G0u47x1f
 g2C+HZ32Sb0hAv72cqxE6Yq0XbrISb9+hVacD9SA4LdTbaOJZuT08K8gyUTkQXLdfuXq
 myBVouwUIRFQ7dsNBPi+4yJ0l6cp6ooBeTte9cIbwgUACAKP4g5CnNliGjetA+oqjiZn
 m9v7PCeDKckLdp52l0iMs4D4nelESIGwRLKJSkGxOFlXshTPZH4kD/+OkaAQ7V4gzyQX
 JeVA==
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
 Boyuan Zhang <boyuan.zhang@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KCkFkZCBWQ04yIGlwIGJs
b2NrIGZvciBOYXZpMTIKClNpZ25lZC1vZmYtYnk6IEJveXVhbiBaaGFuZyA8Ym95dWFuLnpoYW5n
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCBlNTAzYjIyNmNjZGIuLjdjMDBh
YWVlZmRhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBAIC00MzYsNiArNDM2LDcgQEAgaW50
IG52X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWlmIChhZGV2
LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfRElSRUNUICYmCiAJCSAgICBp
c19zdXBwb3J0X3N3X3NtdShhZGV2KSkKIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFk
ZXYsICZzbXVfdjExXzBfaXBfYmxvY2spOworCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChh
ZGV2LCAmdmNuX3YyXzBfaXBfYmxvY2spOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQlyZXR1cm4g
LUVJTlZBTDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
