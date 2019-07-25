Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E7D754C4
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAFE6E7A3;
	Thu, 25 Jul 2019 16:58:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD7B6E7A0
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:08 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so49716079qtn.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RBTe8nwJsBDhc6bSzWxz1gRWSZSscGFx4Y87E5PoWYU=;
 b=lI9izgRP7oye8evTDz9PjxPqiRiKCbnKoxBapW18eX677V726hAXXO35dOC4sO3FfL
 dMGON0TsqWkv092ct3JhBLp9bVgpOL7F9YWOHZnLjzuZ/tpObaWErZtRmm3XIILNcluj
 1kTKZHWitghIv8UYwphJJxhP6Ft24vGVvBamZFYi+3m8acJuviU5oA4wUmV1vFBAJ5wJ
 FM8bmnSxcrRZyog2GjjB9vNMj/ltTqUwabaPZM5Jw2bQNa0J/PElcQT/+5nB4fNEY+Jr
 hO1gs+iVsZA6Kw5KuWX1wyBw+evgrsz0gfXy9/wJmCcQwar85ymY7a99qLOUJy032lPI
 vDYQ==
X-Gm-Message-State: APjAAAXqut303fb3eBBXkULVAOVOD96hipE1iHk4fODxEYPpcJjK6Ihc
 qlwKOSFDceWYepZtvaSXbTlhHIpN
X-Google-Smtp-Source: APXvYqwPiX84MqRrzGnLTWwisLgAE6f6AHus8g9LYQT0lJm+NrOW0x/A8P1meaJ8hICswxvws1gOIA==
X-Received: by 2002:ac8:2971:: with SMTP id z46mr61554746qtz.322.1564073887076; 
 Thu, 25 Jul 2019 09:58:07 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/12] drm/amdgpu: add reset_method asic callback for cik
Date: Thu, 25 Jul 2019 11:57:49 -0500
Message-Id: <20190725165758.16928-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RBTe8nwJsBDhc6bSzWxz1gRWSZSscGFx4Y87E5PoWYU=;
 b=VeeKx2QuPXY2QllMXHSyPngHz8BeWhIS2+PwsZJiY+cFOjYwZ+QSdnd8wVaC0hICyU
 alLG2sb7qyQ9hbB4Mt09WE2bu9vgNvq2NuXy3LMhq9/Mc6eojpH5/sQy20ZN1AiOfFPW
 u5ty1IYlGSiKuSB8KS1UWrsWlIMoegA0khrr0QAbX6iRWsjBKkwmFaXM3thNZpoDq43+
 BCRdXoZRHU3evaV6wKxJNR58+UnnP99gcKSRGtrcgBQbsrRi4x8yHyqqbq1eyPiAPmKD
 klMOXyLGXgknPGBN5JvNMtcbpGC7qfq5pHEsu6jJMcBtdWAR8OQeE9X6modK1jnz16Aj
 S5dg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q0lLIGFsd2F5cyB1c2VzIHRoZSBsZWdhY3kgcGNpIGJhc2VkIHJlc2V0LgoKUmV2aWV3ZWQtYnk6
IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9jaWsuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npay5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvY2lrLmMKaW5kZXggM2E0ZjIwNzY2YTM5Li43YjYzZDdhODI5OGEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npay5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npay5jCkBAIC0xMjkwLDYgKzEyOTAsMTIgQEAgc3RhdGlj
IGludCBjaWtfYXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1cm4g
cjsKIH0KIAorc3RhdGljIGVudW0gYW1kX3Jlc2V0X21ldGhvZAorY2lrX2FzaWNfcmVzZXRfbWV0
aG9kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCXJldHVybiBBTURfUkVTRVRfTUVU
SE9EX0xFR0FDWTsKK30KKwogc3RhdGljIHUzMiBjaWtfZ2V0X2NvbmZpZ19tZW1zaXplKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXJldHVybiBSUkVHMzIobW1DT05GSUdfTUVNU0la
RSk7CkBAIC0xODIyLDYgKzE4MjgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9hc2lj
X2Z1bmNzIGNpa19hc2ljX2Z1bmNzID0KIAkucmVhZF9iaW9zX2Zyb21fcm9tID0gJmNpa19yZWFk
X2Jpb3NfZnJvbV9yb20sCiAJLnJlYWRfcmVnaXN0ZXIgPSAmY2lrX3JlYWRfcmVnaXN0ZXIsCiAJ
LnJlc2V0ID0gJmNpa19hc2ljX3Jlc2V0LAorCS5yZXNldF9tZXRob2QgPSAmY2lrX2FzaWNfcmVz
ZXRfbWV0aG9kLAogCS5zZXRfdmdhX3N0YXRlID0gJmNpa192Z2Ffc2V0X3N0YXRlLAogCS5nZXRf
eGNsayA9ICZjaWtfZ2V0X3hjbGssCiAJLnNldF91dmRfY2xvY2tzID0gJmNpa19zZXRfdXZkX2Ns
b2NrcywKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
