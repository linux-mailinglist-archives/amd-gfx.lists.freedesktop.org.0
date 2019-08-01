Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553437E41E
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856916E7CD;
	Thu,  1 Aug 2019 20:30:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193CD6E7C1
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:12 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id r6so67433107qtt.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=motsIMbFtVfZ4RulDscSninSRuMmar1f9LVJBHmzubg=;
 b=MZWc+yShAbblz5FizUqW5Qj+WLWMuBm+8b985ZDdTcg4KqmnpLYhzufyYl9bYdMecM
 FGWHEm+fIL1dU4RJhrXZoKBZYQxDM02e4tUv1f5uhpNxQ4WxF5Xa3fgv4IXdVme/A6iK
 a760st68iqZRl1iQsbsopQFsD9hLhsucDssV6t3vluvs0T85wEwHIShCdsUH3QqWjb32
 rI+conoJCHPlISe9LvrC9XhOAe8TR9TuvTYLKy7YIkpLCmALv/4CJ/ZvqLl0hpY5VFOk
 1ogUp7FEXZi6Cw2OHJSNIDQW3kHw75/52UFV5LYbF4SX9G2oUDN4dRY3kHvC+3gui9xF
 tgLA==
X-Gm-Message-State: APjAAAVkRa8DmIk/vg2J+sMz083tkqbNMouoGcq1U4ulDVROl8aq2092
 4MThlACwl1lYXy6WJb6cSeT+ZyCI
X-Google-Smtp-Source: APXvYqytpTGQyszWRwC5wcZFfcRMfXdSvmohcWRtwQ3SnJVj0+pgI2n7t/X/49ZLrOfD5ktFVCnZCQ==
X-Received: by 2002:aed:2de7:: with SMTP id i94mr90915201qtd.129.1564691410969; 
 Thu, 01 Aug 2019 13:30:10 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/36] drm/amdgpu: use front door firmware loading for navi12
Date: Thu,  1 Aug 2019 15:29:27 -0500
Message-Id: <20190801202957.29791-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=motsIMbFtVfZ4RulDscSninSRuMmar1f9LVJBHmzubg=;
 b=Y2V7P061fdi1CKtlgarGtJ5X30G7k+A10R421KtdKwx/9WfkpWivOvPRWshN5V7u66
 gBlsM3aQvtpr2uRu/CJzcneZK+agkLooJtkSCARoinolYPFQhXiXhP8YHt3jIgy6Qpph
 j7B4Xh4uS0dNRRIkFn6h1ovN2VITwV8SFljB4tt/QRSPIzvtZm7ivSs2sm7E1iJTmo4X
 k84aPUxwupFoid5SKBW21nBp1LrRfTvNdYY35UByMqpZQ0lbMo8qGPnMCS35IMFxhEX7
 a5MSbXqB9yG7462zc8BiLuFyBWEdnDJEt7qDpkL2aXxI7C+vWhdczTEFceeaygtrp9zu
 fwtA==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgb3RoZXIg
bmF2aSBhc2ljcy4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdWNvZGUuYwppbmRleCAxZWM2OTY4NThkNzguLjA4OTRmYTRjNDFkMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMKQEAgLTM1Miw2ICszNTIsNyBAQCBh
bWRncHVfdWNvZGVfZ2V0X2xvYWRfdHlwZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50
IGxvYWRfdHlwZSkKIAljYXNlIENISVBfVkVHQTIwOgogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2Fz
ZSBDSElQX05BVkkxNDoKKwljYXNlIENISVBfTkFWSTEyOgogCQlpZiAoIWxvYWRfdHlwZSkKIAkJ
CXJldHVybiBBTURHUFVfRldfTE9BRF9ESVJFQ1Q7CiAJCWVsc2UKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
