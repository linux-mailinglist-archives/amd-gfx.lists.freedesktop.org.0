Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDC787E98
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC206EE40;
	Fri,  9 Aug 2019 15:53:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442DE6EE40
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:23 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d79so71917191qke.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+EspOCVlyHxpb/Otr93OLJUcsdplMnGJwMOrilSgwc=;
 b=OGObnobNZ87S9YrZK3byCuhuw0V8wkiaWa85rjd8OgLBU9KC4+Xk21376293z7qSb2
 A9VyqJ9PppAeY/dnwLS5GcE2wyxmJGTqLPf1DIi0cfpWpW9jVd01rVvCoQE4yM/sq1Hv
 EBGV5/qaVpz4z8so08QiibGbc7b3RB3io7EmcQFZNCKjrVMY+aU9VRji6Llc0eNxDwRG
 7bwVBIsEa4oLlmjSaWzvAyBBwWYkUCvn87JdZdfRyP04LpWefyY26bdoFNo9TIgWqIR7
 pBQKXaCtgBqFWOqUNMeg5EZ8Mul7RO0LJKc/BO8DdZJZ2cNbh6nS55mtVZp7baVQqY1b
 Q0Fw==
X-Gm-Message-State: APjAAAVsLgDlqiqsX+4pK+L8BvmcuxdvV2e1Vk+UGjOUv8zPn2T+U5t2
 3E9wzDLvtB8aAjcsEPafahD6L8J9
X-Google-Smtp-Source: APXvYqwjKtCqibx6DfmRmcNRbqPba5COwUfs7vxAMgNnD7sG+yahGTJBh/ouDdIXTNodJ7vSg28jhA==
X-Received: by 2002:a37:a397:: with SMTP id
 m145mr18361796qke.271.1565366002109; 
 Fri, 09 Aug 2019 08:53:22 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/27] drm/amdgpu: set rlc funcs for renoir
Date: Fri,  9 Aug 2019 10:52:49 -0500
Message-Id: <20190809155302.4733-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+EspOCVlyHxpb/Otr93OLJUcsdplMnGJwMOrilSgwc=;
 b=K9FfTVrNNej1xdPe9Whs4f+o+06IQbdXdMkopjzRF04gbNBsJujPVDk7hIh9mte5yH
 7/LInyLv1oT49byx1QGIJZz1cHDVfxQauXRcNLq8uR6Lis8++1u3XsRAbewsvdDGT50h
 L4GxvWcEIojyUApBTiP1T/KsV+kiIa6xLvCoMMQnVsE6s6Fvw23lWHLjE1ThbdATeYFR
 jXc0DLD0iP7DKwXTgHu87oxUrrOQqwh2KeDZG8cN+I5m5xKOx+gO5PPNvvkLXZ5V4634
 d6KPg0ra8MoZ5wKgzu/PsSlzrda8yxnkFYej4sRIgqHfNc1r0S+dPE9bGBwn/5moklzW
 xqMw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCmFkZCBnZnhfdjlfMF9ybGNfZnVu
Y3MgZm9yIHJlbm9pcgoKU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCAyM2M3YjYz
OTQ1MDYuLmU3ZGI2NDI2NDMwMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
CkBAIC02Mjk0LDYgKzYyOTQsNyBAQCBzdGF0aWMgdm9pZCBnZnhfdjlfMF9zZXRfcmxjX2Z1bmNz
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJY2FzZSBD
SElQX1JBVkVOOgogCWNhc2UgQ0hJUF9BUkNUVVJVUzoKKwljYXNlIENISVBfUkVOT0lSOgogCQlh
ZGV2LT5nZngucmxjLmZ1bmNzID0gJmdmeF92OV8wX3JsY19mdW5jczsKIAkJYnJlYWs7CiAJZGVm
YXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
