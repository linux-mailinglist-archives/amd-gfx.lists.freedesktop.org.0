Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8103448F2C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D96C89B95;
	Mon, 17 Jun 2019 19:31:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7001789B8E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:20 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so6970924qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03P1RBjUMyzjD9idwfnZwfymS1mT07I3H0V8OZk/AXs=;
 b=HyHyPNeOQxo8scSDIgJ2bFQbLYELT/CDl+1AwSCLsjLfbMDZWZsERw2J+lNUrSTVwK
 Um0uNmeDECIM7QGLem1uF10DuhgAg9sXSKpGtuf2VSWvzR7J/6XA6YA0CFV901CPrXx6
 nZF41RuwglViReeI1R21WQNjSD6LNVErreauX2wors+s9Dy0HfBEJhTBaJp1Sap4P6Hm
 SXc5vQTt5Kbut8hUUD3KnWRUo2lbZz3Maz0fhvtODlwxhMJm6JSQInikadgMisW7mTcD
 YEJn6zbEVGNgwyCiqYoXUjDVt//Hs47b9zs56qDgv+sTUotj1QkYBUqPjiI9pYnvarCB
 QLOA==
X-Gm-Message-State: APjAAAVyxiDL2X/z3BpOpAxA8osPeuWW/Y7RRPhqY3JNLD6mLyVAmpAh
 N3UzoKQ4HkRLOiSLqNx4XKlUvgpNhRY=
X-Google-Smtp-Source: APXvYqzZCy16uULT+jtY8/xSW7aL7PzTX/7ypZosn18hOVBhTElywRbrOYsCMyWh23m54vifcH3j6Q==
X-Received: by 2002:ae9:de81:: with SMTP id
 s123mr21462074qkf.339.1560799879442; 
 Mon, 17 Jun 2019 12:31:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 206/459] drm/amdgpu/ucode: add the definitions of MES ucode
 and ucode data
Date: Mon, 17 Jun 2019 14:29:33 -0500
Message-Id: <20190617193106.18231-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03P1RBjUMyzjD9idwfnZwfymS1mT07I3H0V8OZk/AXs=;
 b=AYN4+ontJ2JCrc730U4B/UxsuGkoUkJYOg0z36Th20fUrrZl6lSANKo5lkxz0codSi
 lKKW4d8mnELlWZUb3aEplRVyjHihjq/B6VWdg8tRMXUOjhbkIc2i5+CV35JnKvonTIMb
 zWLo9lD9acXdi/eaZ1V5rrEccLLrkSAjHX8hoQtj73zQb5VbQP3HQ9Puv0S9eTqR/WIp
 FlU0V21S3Ff3batp9WLw5S+tR4JirDekBPNsqPblcFujWoYoJl1/JLjuZpqlYLhWmaL8
 /J67ggaWZvLx/dpgkvhoCz7mK3jbXSQ90dVvfa7U+RgvGiWqsZm1YWu+XQoOmOyurzdK
 QnEQ==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCk1FUyByZXF1aXJlcyB0d28gc2Vw
ZXJhdGUgZmlybXdhcmVzOiB1Y29kZSBhbmQgdWNvZGUgZGF0YS4KClNpZ25lZC1vZmYtYnk6IEph
Y2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdWNvZGUuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCmluZGV4IGVhYWZlYTg3YWEzYS4u
YWFlZDhmZTk0ZWUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdWNvZGUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUu
aApAQCAtMjQyLDYgKzI0Miw4IEBAIGVudW0gQU1ER1BVX1VDT0RFX0lEIHsKIAlBTURHUFVfVUNP
REVfSURfQ1BfTUVDMV9KVCwKIAlBTURHUFVfVUNPREVfSURfQ1BfTUVDMiwKIAlBTURHUFVfVUNP
REVfSURfQ1BfTUVDMl9KVCwKKwlBTURHUFVfVUNPREVfSURfQ1BfTUVTLAorCUFNREdQVV9VQ09E
RV9JRF9DUF9NRVNfREFUQSwKIAlBTURHUFVfVUNPREVfSURfUkxDX0csCiAJQU1ER1BVX1VDT0RF
X0lEX1JMQ19SRVNUT1JFX0xJU1RfQ05UTCwKIAlBTURHUFVfVUNPREVfSURfUkxDX1JFU1RPUkVf
TElTVF9HUE1fTUVNLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
