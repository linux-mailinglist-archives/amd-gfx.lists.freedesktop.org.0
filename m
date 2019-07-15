Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E162369DFF
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5577089DEA;
	Mon, 15 Jul 2019 21:24:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E913289DDF
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:24:56 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id d17so17230846qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2+R1czOWbm0nZYGbQX5BDHpeiJ5dPonyVxQBLRSomD0=;
 b=ZuK8JWjMpNqhZW1hANdQbmID4fAAk0yoHhNnuzQq3/Cm2HhXoUQcriYeAO/1o+76D3
 Rfgbxy8vVuSzmZksyrEa1XXdxeATWpHP0ql21R/2HW1774TPCVYx9+zQ7i9bQRUSmcjw
 o1LLgcATNbkMENZ0nJEhLArzRCh3oQaVYs5J14qF7fK3KUMvguNkdiCuw4u6iuSb00wU
 TJh/7KzNTVCkNhEH9Rt6WHl117+zYtYHS5Wx5PbGBK878g8qizgpAQsH//X3pgVBsqai
 AjAu/lK3aFtHaQs5vt0CxVxNddPpt49cm3VJyyseqzDMAjU1ZMEsuXR/gT6vMd1jW55q
 +YGg==
X-Gm-Message-State: APjAAAUvl8CxGeCMlPwtdPHvesn0ywR8OygfUJ6tVzinunvUAnWW9mym
 e9ohNcil4bkj+vgYDW9FJNVLPF71
X-Google-Smtp-Source: APXvYqyLctJs/M4QjMswsKCUKO7pQx6hQlUXwhR+hXvCD2S8CeQhDDjZMA/F7dU+CYwRIfKMDi6ZOw==
X-Received: by 2002:ac8:f99:: with SMTP id b25mr13865589qtk.142.1563225895885; 
 Mon, 15 Jul 2019 14:24:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 012/102] drm/amdgpu: add SDMA 2~7 interrupt client id for
 Arcturus
Date: Mon, 15 Jul 2019 16:23:07 -0500
Message-Id: <20190715212437.31793-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2+R1czOWbm0nZYGbQX5BDHpeiJ5dPonyVxQBLRSomD0=;
 b=hD2Y4Spfh2SREYzF6huRqQ+TxIUMqp1GdSLw9KBzem4G3UDsmYwtqqDgmt9DI7LoL0
 ePxnSIY4+P0uAK2XnEKqg7CYl9IMNX39YXouVQuZ86H2y3wxkFnS1QSqnWRBouMkAZT9
 +9EpSRprf1j10QvbgxQ1AzlVVNoY4HsxzvCNDHUmTbdn2/ZzyrMqMTikxVreUOBqJLkU
 CVqgmqjQ1ojriZwksTywWoocOuwET3jRBRP/mq+OC5BdU2jO6NbEjudu3MQAOVfH8ee9
 lgojS+0MLF4qE7PtW5C5QLwL01JQ17SWPMNV6eBq4pQCxpOv4Bn7USiPuz3Bmd+m+0J6
 4xIQ==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KQWNrZWQtYnk6IFNub3cgWmhhbmcgPCBTbm93LlpoYW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvc29jMTVfaWhfY2xpZW50aWQuaCB8IDggKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvc29jMTVfaWhfY2xpZW50aWQuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9zb2MxNV9paF9jbGllbnRpZC5oCmluZGV4IDEy
ZTE5NmMxNWJiZS4uNWI0MGI5ZDFiNzg4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2luY2x1ZGUvc29jMTVfaWhfY2xpZW50aWQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2lu
Y2x1ZGUvc29jMTVfaWhfY2xpZW50aWQuaApAQCAtNjMsNyArNjMsMTMgQEAgZW51bSBzb2MxNV9p
aF9jbGllbnRpZCB7CiAKIAlTT0MxNV9JSF9DTElFTlRJRF9NQVgsCiAKLQlTT0MxNV9JSF9DTElF
TlRJRF9WQ04JCT0gU09DMTVfSUhfQ0xJRU5USURfVVZECisJU09DMTVfSUhfQ0xJRU5USURfVkNO
CQk9IFNPQzE1X0lIX0NMSUVOVElEX1VWRCwKKwlTT0MxNV9JSF9DTElFTlRJRF9TRE1BMgkJPSBT
T0MxNV9JSF9DTElFTlRJRF9BQ1AsCisJU09DMTVfSUhfQ0xJRU5USURfU0RNQTMJCT0gU09DMTVf
SUhfQ0xJRU5USURfRENFLAorCVNPQzE1X0lIX0NMSUVOVElEX1NETUE0CQk9IFNPQzE1X0lIX0NM
SUVOVElEX0lTUCwKKwlTT0MxNV9JSF9DTElFTlRJRF9TRE1BNQkJPSBTT0MxNV9JSF9DTElFTlRJ
RF9WQ0UwLAorCVNPQzE1X0lIX0NMSUVOVElEX1NETUE2CQk9IFNPQzE1X0lIX0NMSUVOVElEX1hE
TUEsCisJU09DMTVfSUhfQ0xJRU5USURfU0RNQTcJCT0gU09DMTVfSUhfQ0xJRU5USURfVkNFMSwK
IH07CiAKICNlbmRpZgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
