Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B01DF48EC0
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960CD89949;
	Mon, 17 Jun 2019 19:27:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4570589949
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:52 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id t8so6966586qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHf6Bzcf88x1HrCBKF1M1aRHee/UBpUoaBSrIhUY3LQ=;
 b=oAKtiFKYjAILjGvSAGYbijPznMVX/W5YzUYT+iESHIBvbeh3ftQCqxE596WYD4hZyx
 QGTshAL/dxSOCevGxxodYQ/ciHd/ilgco0XMs6aDHERMY/zbhaVYud+WTX6GRBs16BBz
 9rsWZ6Z7Qw57ceEb0vuATYspRGrjn65cHXZD4J6Zb5n1dXRbAl9GwiVF2AmPaxLQojpK
 zSDJ6OsB7z0QQTgFwxzuUP+0r8RfKjRuSw6F0Qs4AVLv8aVFVKwshCiLc4rJPyuqKqG5
 LTagYx8Kx1JQjBnyKAYGM+iRRi3V6TXMG3W40nVFJ1j3sg1fp3F+YjlQhlhjB4VBatav
 aRLA==
X-Gm-Message-State: APjAAAXrpXWfBNl/zAOHHstsIVw9uBi8v7tV/knT3ooUf79HkghBgFwN
 EThBy3ifRYSkN4mxYjsHCYEiD1YHDJg=
X-Google-Smtp-Source: APXvYqykNRVcV4NYTkcF+3/QMdy6juBR27le0ELlCsEvlJShjJ4FZWdxj0jUDkvicuqRETQ8XjRxzQ==
X-Received: by 2002:ae9:ea06:: with SMTP id f6mr16376358qkg.262.1560799671211; 
 Mon, 17 Jun 2019 12:27:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 140/459] drm/amdgpu: add to set navi ip blocks
Date: Mon, 17 Jun 2019 14:26:05 -0500
Message-Id: <20190617192704.18038-41-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHf6Bzcf88x1HrCBKF1M1aRHee/UBpUoaBSrIhUY3LQ=;
 b=uY7Ke1rd8oUmqVm11H+G416TNbwQxBmvCfBBxwZxXC765xP1h7tEZusACnQYbaNuM+
 +AIOe2VPT4Ps5kLgjc2Mjg1hvENUOKWlqDkfD0NQaiZmQJ0qv94Qsqtb3YRDvZ8j60sj
 C260vkQYXP/oKiyRkXFz7BhaKB0JxmDEgwivKmgMD6HumazbXnjv8MWasTG4UnMNYAfl
 OqSrW8d62V8U4OYGxESEhr+mvxrHnDagPjARQ5aBpBUsoZznp/9wWWapQ1DlbmsHzbCc
 cNmsYf+BN/5GFWN6bsr1M3mFFdbSTKnoz5HkRQqpGnTnbnIPrDUUdZAmahX1utPpEm62
 JR2g==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IEh1YW5n
IFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IGJmNTY1MGY3YWM4
Yi4uY2QyOWM1NDc2YjFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCkBAIC01MSw2ICs1MSw3IEBACiAjZW5kaWYKICNpbmNsdWRlICJ2aS5oIgogI2luY2x1
ZGUgInNvYzE1LmgiCisjaW5jbHVkZSAibnYuaCIKICNpbmNsdWRlICJiaWYvYmlmXzRfMV9kLmgi
CiAjaW5jbHVkZSA8bGludXgvcGNpLmg+CiAjaW5jbHVkZSA8bGludXgvZmlybXdhcmUuaD4KQEAg
LTE1MjcsNiArMTUyOCwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfaXBfZWFybHlfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJaWYgKHIpCiAJCQlyZXR1cm4gcjsKIAkJ
YnJlYWs7CisJY2FzZSAgQ0hJUF9OQVZJMTA6CisJCWFkZXYtPmZhbWlseSA9IEFNREdQVV9GQU1J
TFlfTlY7CisKKwkJciA9IG52X3NldF9pcF9ibG9ja3MoYWRldik7CisJCWlmIChyKQorCQkJcmV0
dXJuIHI7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCS8qIEZJWE1FOiBub3Qgc3VwcG9ydGVkIHll
dCAqLwogCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
