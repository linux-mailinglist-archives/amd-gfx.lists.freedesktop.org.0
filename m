Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E948EB6
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F334D8990D;
	Mon, 17 Jun 2019 19:27:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B43A89907
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:40 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g18so6963166qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y4Paqay11T97wMYZw/8dMDPTYw7woUX7Z41M9XNYHCI=;
 b=kWqt4je3tC84B+sAyAeSMkh2juv+ZEb1HxfSOjtpApMU9/SyZpU9m0bHxD8/SWVePc
 pw6RgxjBI0v3KUERNbGYSq/hj330pXbq7YbYW8HgUKnckhq6BNtbevzqXJVPI0O2J7dF
 oKjEht4jOGErnt9dQrsR0L/t+UKqlrRbuqp62y7onSbfcGh4zG0LJ3VnWBAYs6JrtRTN
 InC5RLdXQQPPrEpKNVtXcolUutxYZ9zEiMl0zeIvDz+A7SMwqvhicHPzCxKs1yDlGOcV
 2xDnZck7TfPSWx8UW5Z0HiIUT0c3xgGOonInYP6ikv6XvT/TApbL0Vn5u+KG/SPolyJh
 x4cA==
X-Gm-Message-State: APjAAAWlTQmAGj0w8Whj9hFbo5SK3MtEat1IS/gOvqGAwcgPHSfWBbUy
 39op9bXFEDzcZRpKKvxl5vhw4QXyubU=
X-Google-Smtp-Source: APXvYqyzZuxqeduVBgWNy1RxCPuK6QLZBDqviDybdFKC9aoSUJ52oPoBTIU3pdsGxQFw2m1COonZag==
X-Received: by 2002:a37:8741:: with SMTP id j62mr20324385qkd.78.1560799659286; 
 Mon, 17 Jun 2019 12:27:39 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 127/459] drm/amdgpu: update golden setting programming logic
Date: Mon, 17 Jun 2019 14:25:52 -0500
Message-Id: <20190617192704.18038-28-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4Paqay11T97wMYZw/8dMDPTYw7woUX7Z41M9XNYHCI=;
 b=jC86OdY2rpZh8QzXQ2zlWh0cq1pvh0H9ehrA6TtgFhnnZHDUxU2UHU+Xb0ELdDOLmm
 r+u7weWwqqW/gmh591JS2Whk6+hxYAOesQ65cM6uy5vmf7m3ut42dsNsj1U9a8wOgUU2
 ZpxDxQKWpWA7ru5IaVn5I+Hc4PiwUMsgEIr1Hzc3uWaTZpu6MDimTv9zxD8SRewJPfgx
 0/J9ukmwcqjtg/fVy3c36Etv3kUevm0NB1/H1rYjAiicRjkT5lxqZLpago0tYOJK01Mq
 Ymjn+YT0yLBHkyjAqgMNOeFTS9s43w/8+jL0ObsiO7aG7Snf3R9jWv+HERlcdnTHbueh
 v/Fw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2luY2UgZnJvbSBz
b2MxNSwgbWFrZSBzdXJlIG9ubHkgQW5kTWFza2VkIGJpdCBnZXQgY2hhbmdlZAp3aGVuIGFwcGxp
ZWQgb3JfbWFzawoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPgpSZXZpZXdlZC1ieTogTGUgTWEgPExlLk1hQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA1ICsrKystCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMKaW5kZXggMTgyZGM4MzRmN2I2Li5iZjU2NTBmN2FjOGIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTUwOCw3ICs1MDgs
MTAgQEAgdm9pZCBhbWRncHVfZGV2aWNlX3Byb2dyYW1fcmVnaXN0ZXJfc2VxdWVuY2Uoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCX0gZWxzZSB7CiAJCQl0bXAgPSBSUkVHMzIocmVnKTsK
IAkJCXRtcCAmPSB+YW5kX21hc2s7Ci0JCQl0bXAgfD0gb3JfbWFzazsKKwkJCWlmIChhZGV2LT5m
YW1pbHkgPj0gQU1ER1BVX0ZBTUlMWV9BSSkKKwkJCQl0bXAgfD0gKG9yX21hc2sgJiBhbmRfbWFz
ayk7CisJCQllbHNlCisJCQkJdG1wIHw9IG9yX21hc2s7CiAJCX0KIAkJV1JFRzMyKHJlZywgdG1w
KTsKIAl9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRleCAzZmJjM2NkODQ5ZWQuLjlk
ZmJiYzY1ZWE2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCkBAIC0zNzgsNyArMzc4
LDcgQEAgdm9pZCBzb2MxNV9wcm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAogCQl9IGVsc2UgewogCQkJdG1wID0gUlJFRzMyKHJlZyk7CiAJCQl0bXAg
Jj0gfihlbnRyeS0+YW5kX21hc2spOwotCQkJdG1wIHw9IGVudHJ5LT5vcl9tYXNrOworCQkJdG1w
IHw9IChlbnRyeS0+b3JfbWFzayAmIGVudHJ5LT5hbmRfbWFzayk7CiAJCX0KIAogCQlpZiAocmVn
ID09IFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tUEFfU0NfQklOTkVSX0VWRU5UX0NOVExfMykg
fHwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
