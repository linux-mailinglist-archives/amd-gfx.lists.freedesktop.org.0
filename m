Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54448F24
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B0D89B60;
	Mon, 17 Jun 2019 19:30:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA8389B60
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:30:56 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m29so12262485qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCJx/i9Dm55TyBGuGDOqtxk3s5cgjn2ZSfKDsX72gKc=;
 b=DcKhNrYu9huVxjtSfw2Qbe8UqhjJly3rHe2SbGZF54pHu/l9RnzYZiXYZ9NUT6972y
 WWOCmUJTydO6BgL9C0fN2TU4fOTrkfX33evEIR98ADsFrgtLy0o6oSOovlnlleg7sv6B
 u30utwr0t4WU3D32TfDKL80fDKul4Rfe0Ygv0q+o9GpPnm63zF/weemo7JM5C45Zs9ib
 wGAS4FrtaJSAU2LTr2XzSk9HAPDPZwaoI6ej6qN/HPQeg1PPSZSqPyX9S9lCz6o0dQ8+
 rl9NAn9jFsl939O/9f3Ma59I1GRoAo7itY/8FgP+9fPG4v2ndumasrEZAwrL8V2lFkMT
 0hSw==
X-Gm-Message-State: APjAAAWn/CwptJGfzXN5HEWQ08tQPPBKS3lAj8D3gRL4EAr4uSh7YO9/
 DZ9u5vFqnoREvpYE28XvOx6JONvISVI=
X-Google-Smtp-Source: APXvYqyjwPbiPEIewxDPahJtDfXlUgyDMpFDW2Q9xAcg5q7gRD8JJ3j3Hc+/YG41LSujGiXL0GTUUg==
X-Received: by 2002:ad4:5386:: with SMTP id i6mr22987139qvv.237.1560799855172; 
 Mon, 17 Jun 2019 12:30:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id o54sm8328992qtb.63.2019.06.17.12.30.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:30:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 199/459] drm/amdgpu: enable vcn dpm scheme for navi
Date: Mon, 17 Jun 2019 14:30:42 -0500
Message-Id: <20190617193042.18183-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193042.18183-1-alexander.deucher@amd.com>
References: <20190617193042.18183-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HCJx/i9Dm55TyBGuGDOqtxk3s5cgjn2ZSfKDsX72gKc=;
 b=A/FGNxJCa0MZQP/OoCYcmz8Z54KZUVA+nHpmCNAuwq80lZDI25yRlh1CFJ6ME9RFUN
 ZrQ3F/TQfmbODDHylWMc1YKmKZWMcUydCUXE85R4hSHXI806dFF/+nZ7ml+h6C/qAl8g
 HRCLa0ghVTYSU3oAlp5nZwrLRErdifgtz6V/cMZBdb60qmhXP/uGVFlOlXnsxwZOhhAY
 rEb+j7cox97dKVFz7fRsE3sZavMQDBHJzvzY+iaWs/WfUcXhgjhWww3gb1PqDVNJH1E2
 8Mr8GdMhk7xhgVcA5CCcYrE0soGlxFbUXoboUOrTAmrTyD0ZCnwOFnpOr3yJwqGLA5hZ
 QVNw==
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
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCk9uIG5hdmkxeCwgdmNuIGRwbSBz
Y2hlbWUgd2FzIG1lcmdlZCBpbnRvIHBvd2VyZ2F0aW5nIHNjaGVtZS4KClNpZ25lZC1vZmYtYnk6
IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+CkFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwppbmRleCA3NjUwMTgzMjJhYmQu
LmQwYjk1ZTU4OTU5YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwpA
QCAtMjQ5LDcgKzI0OSw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV92Y25faWRsZV93b3JrX2hhbmRs
ZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCiAJaWYgKGZlbmNlcyA9PSAwKSB7CiAJCWFt
ZGdwdV9nZnhfb2ZmX2N0cmwoYWRldiwgdHJ1ZSk7Ci0JCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0g
Q0hJUF9OQVZJMTAgJiYgYWRldi0+cG0uZHBtX2VuYWJsZWQpCisJCWlmIChhZGV2LT5hc2ljX3R5
cGUgPCBDSElQX05BVkkxMCAmJiBhZGV2LT5wbS5kcG1fZW5hYmxlZCkKIAkJCWFtZGdwdV9kcG1f
ZW5hYmxlX3V2ZChhZGV2LCBmYWxzZSk7CiAJCWVsc2UKIAkJCWFtZGdwdV9kZXZpY2VfaXBfc2V0
X3Bvd2VyZ2F0aW5nX3N0YXRlKGFkZXYsIEFNRF9JUF9CTE9DS19UWVBFX1ZDTiwKQEAgLTI2Niw3
ICsyNjYsNyBAQCB2b2lkIGFtZGdwdV92Y25fcmluZ19iZWdpbl91c2Uoc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nKQogCiAJaWYgKHNldF9jbG9ja3MpIHsKIAkJYW1kZ3B1X2dmeF9vZmZfY3RybChh
ZGV2LCBmYWxzZSk7Ci0JCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTAgJiYgYWRl
di0+cG0uZHBtX2VuYWJsZWQpCisJCWlmIChhZGV2LT5hc2ljX3R5cGUgPCBDSElQX05BVkkxMCAm
JiBhZGV2LT5wbS5kcG1fZW5hYmxlZCkKIAkJCWFtZGdwdV9kcG1fZW5hYmxlX3V2ZChhZGV2LCB0
cnVlKTsKIAkJZWxzZQogCQkJYW1kZ3B1X2RldmljZV9pcF9zZXRfcG93ZXJnYXRpbmdfc3RhdGUo
YWRldiwgQU1EX0lQX0JMT0NLX1RZUEVfVkNOLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
