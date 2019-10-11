Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF4CD374A
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBAE6EB9F;
	Fri, 11 Oct 2019 01:46:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7076EB9A
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:58 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u184so7502334qkd.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yztasm7WHW0a9JcUfmpGnZHM+hAWwrNdLejOpp4XvSU=;
 b=AbMGrzv2sPG38J46yweuc9sHel94MbOQKXtDhgDj+4syUQ9GUuHgfZ5sQ02a3xXsrt
 EPBw/LcxuAAlgyW9vil/E5RQ372RKCAE/IxazNGu8xCkCX1Mxj2whx/DWYmTUOCXaaYg
 T5IbCR0jTf2ze5PeAfbAAQCepeZpJbX6/xjpRx8AzpNDsAryj+bFBcJuEAORmS7UbE/4
 A6k2Fx090Q3yqr5eUZK4vbO+yXUTTN/0rYiWNk61QAdsXl7FTVIWKdJVPJd5PjtyC1rm
 PKQrMd53ML/aSCWO8y8gfnZU9Ycsw+dQOywZzjx+42VluBjeY36PTI8YhtkkQAQZDdNW
 iB5Q==
X-Gm-Message-State: APjAAAUmrK6NMLkd/6GDcJtEqFoOqrdkOd5CBIGm/R0aeq/xYX/nzSa6
 r0chUZGnTj1vKhT2eBLuYaejHQpJ
X-Google-Smtp-Source: APXvYqxCNZfp4oWDY1HY+6OCRga9qtnG6vO4Ul0hGpluTsSrdFrS3kCDCAYVbGxue04gibMFw0+lOQ==
X-Received: by 2002:a05:620a:6d6:: with SMTP id
 22mr5576958qky.253.1570758357063; 
 Thu, 10 Oct 2019 18:45:57 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 12/19] drm/amdgpu: add baco support to runtime suspend/resume
Date: Thu, 10 Oct 2019 20:45:29 -0500
Message-Id: <20191011014536.10869-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yztasm7WHW0a9JcUfmpGnZHM+hAWwrNdLejOpp4XvSU=;
 b=K1U9sRxDt93Gywb3cIapcnxQJjUPLksqc06grw5hrSKft3/16tacyKzlp3p9h8kBey
 Uwz2U/LAAQKikCG1SH8hwxAcm969tGAXqTfdgoSSDDalLcygqkoxgYE5qh6jZDnYVTE5
 NYNrd/yHAN7Go+Xfolfc2cQt8kg8Mr9c+hxr0oKZ1OtcSGHxzURy0MZnA6X6y5VgexlT
 SiqktZVwvtLnEvDa+Z6zroteDwI5hJXTd/VecmoiwDN1IpiP4ZKuf4BwSw6raFWIPNzt
 V5GpymwjS6n8Ba+Dad2GL2mmwNSDpbmlJi7RgFwO9Gz76C5zP7pbF9FXWWH5k3sjG0qH
 Y/kg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHRoZSBuZWNlc3Nhcnkgc3VwcG9ydCB0byB0aGUgcnVudGltZSBzdXNwZW5kCmFu
ZCByZXN1bWUgZnVuY3Rpb25zIHRvIGhhbmRsZSBib2FyZHMgdGhhdCBzdXBwb3J0CmJhY28uCgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgNyArKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDE5OWIyNDA4MTFkYS4uZGI4MmNlNGQ1
ZGQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC0xMTA2LDcg
KzExMDYsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7
CiAKIAkvKiBHUFUgY29tZXMgdXAgZW5hYmxlZCBieSB0aGUgYmlvcyBvbiByZXN1bWUgKi8KLQlp
ZiAoYW1kZ3B1X2RldmljZV9zdXBwb3J0c19ib2NvKGRybV9kZXYpKSB7CisJaWYgKGFtZGdwdV9k
ZXZpY2Vfc3VwcG9ydHNfYm9jbyhkcm1fZGV2KSB8fAorCSAgICBhbWRncHVfZGV2aWNlX3N1cHBv
cnRzX2JhY28oZHJtX2RldikpIHsKIAkJcG1fcnVudGltZV9kaXNhYmxlKGRldik7CiAJCXBtX3J1
bnRpbWVfc2V0X2FjdGl2ZShkZXYpOwogCQlwbV9ydW50aW1lX2VuYWJsZShkZXYpOwpAQCAtMTE3
Myw2ICsxMTc0LDggQEAgc3RhdGljIGludCBhbWRncHVfcG1vcHNfcnVudGltZV9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikKIAkJZWxzZSBpZiAoIWFtZGdwdV9oYXNfYXRweF9kZ3B1X3Bvd2Vy
X2NudGwoKSkKIAkJCXBjaV9zZXRfcG93ZXJfc3RhdGUocGRldiwgUENJX0QzaG90KTsKIAkJZHJt
X2Rldi0+c3dpdGNoX3Bvd2VyX3N0YXRlID0gRFJNX1NXSVRDSF9QT1dFUl9EWU5BTUlDX09GRjsK
Kwl9IGVsc2UgaWYgKGFtZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYmFjbyhkcm1fZGV2KSkgeworCQlh
bWRncHVfZGV2aWNlX2JhY29fZW50ZXIoZHJtX2Rldik7CiAJfQogCiAJcmV0dXJuIDA7CkBAIC0x
MTk5LDYgKzEyMDIsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9wbW9wc19ydW50aW1lX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCQlwY2lfc2V0
X21hc3RlcihwZGV2KTsKKwl9IGVsc2UgaWYgKGFtZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYmFjbyhk
cm1fZGV2KSkgeworCQlhbWRncHVfZGV2aWNlX2JhY29fZXhpdChkcm1fZGV2KTsKIAl9CiAJcmV0
ID0gYW1kZ3B1X2RldmljZV9yZXN1bWUoZHJtX2RldiwgZmFsc2UsIGZhbHNlKTsKIAlkcm1fa21z
X2hlbHBlcl9wb2xsX2VuYWJsZShkcm1fZGV2KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
