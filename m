Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8160075D53
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F516E868;
	Fri, 26 Jul 2019 03:22:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0606E865
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:22:02 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r6so38125692qkc.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RBTe8nwJsBDhc6bSzWxz1gRWSZSscGFx4Y87E5PoWYU=;
 b=nuEgBdlc0rwIGs+qfPQAgTny6E60seoi3+z+b3NCJ9bdxCVJjRcoFyvTWkVvDsZnoM
 C9VLHORDMAeue00VtXjC1Nja2uzxbA8GBTULmGyMtjo5bc9YMzd7YDc/6PPDYuvNC+wK
 2c53TLxfkHw6mXIBSh8na3Bnnvwe1ALiZPaUQzHe9lH0q8zCAAMznOi79+OQMj/h/KPW
 tShTG80H2nUEWfJO1ZImhyXCUfneh4pCxZiog2kDKSyFpn04okmMIq+8bEkt28MzGbtw
 cBMQGb0BcRhVHbobN+f5SDY8GRCRu1bUuMWpBt6REYlDeT+rifNbq5AdM//Oh1c93oS+
 r9Gg==
X-Gm-Message-State: APjAAAXfmscXq6QeYfcRYBURQFLFdHMgxhUaxcdnTpLZ4z1JGtyurzbX
 liA2123KwESYlMWo4Rv+LlBQEPl5
X-Google-Smtp-Source: APXvYqwkXNePEcacGuHy2Wf6sFablMATi+ZsRQ8ybKvZrTiBXxks1GxixNnO9SiKePxclAbKo5Hmng==
X-Received: by 2002:ae9:e50b:: with SMTP id w11mr59328665qkf.419.1564111321187; 
 Thu, 25 Jul 2019 20:22:01 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.22.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:22:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/11] drm/amdgpu: add reset_method asic callback for cik
Date: Thu, 25 Jul 2019 22:21:38 -0500
Message-Id: <20190726032146.3187-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726032146.3187-1-alexander.deucher@amd.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RBTe8nwJsBDhc6bSzWxz1gRWSZSscGFx4Y87E5PoWYU=;
 b=WnwRxG9ZhW6cJnhDi61+EyhaD1gPwJkhGKFB/VhRm9zQnd6AyGeSt9oU5S4oGmZCtX
 Fx4hya6azS7rJifeYEnScvS6jlD11ImKTOUv8Ov5oVugyBcaFmykUSn9Tof/n9ytF3gW
 /oW9UGfbDOuuTS9b3kKOOKS/qN5q9lZYRMP9vNSQhC77wSk3GmvwXvHSombOthKGrDrJ
 3sbI3bHU7q966XrmoLFcXYV+HHtfUTJQ3IDpWcqEPO1r0g563VKzaV/pN1AtDVODJm+J
 S1PZWdSesvzbrqRiyr8H2a8ai3zn3srLYnaskq6r/vp8n4khJEPaZkEeAKgwgUD7kFJ1
 gatQ==
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
