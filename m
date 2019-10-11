Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCECD3751
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3CD6EBA5;
	Fri, 11 Oct 2019 01:46:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976216EB96
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:52 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j31so11651936qta.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4g7wrbB370OTXiK4LwB8qktsAbC16b9oCChtrLAp+HU=;
 b=CxRR/ATdCWf0vIfFKN4EnSI0K8LU7aOptyRlhV5HV/S3Uh3GPBEx43DOu/eeUrh2Sk
 FzT6eyDZYef1KM05MzPO9OqH3Ao/fTQICeVn425FzkhKK1N+W602DKIDs1jt9S+GOVIg
 b9aVcLs5fcFKx3niwNO3kie0B2EpdpRYpkPSJVHejK1M6d47tmt9FwnMrwgz5RLfQE22
 xzTsOPI0ZM2covKkBppNnVqqy4yi6ybar6uRIh9LxmQFLMGd/LtyfU+8b03jrp9WMOtd
 nR0/dkLEkudOddyRSpRD11cfRmDEwuhmUs2jlTyPqfaRsQcp1iwg5gfe+UqBDz+4YVr+
 +d9g==
X-Gm-Message-State: APjAAAVmBOOsZssx2unBA3rnU8hG0mxOCLxmx6qyYaAkyzE4ewBYSfdz
 oLumOkRZmgccE9NfBaxzjZkXW5q/
X-Google-Smtp-Source: APXvYqw3IgOtTRJ4yPfLTuRVGUApsR5ahQ898bRxTzCbznmEyp+Yg3HOrsffkh60+M5p4E1JOtuANA==
X-Received: by 2002:ac8:b42:: with SMTP id m2mr14129566qti.174.1570758351230; 
 Thu, 10 Oct 2019 18:45:51 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 06/19] drm/amdgpu: add supports_baco callback for NV asics.
Date: Thu, 10 Oct 2019 20:45:23 -0500
Message-Id: <20191011014536.10869-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4g7wrbB370OTXiK4LwB8qktsAbC16b9oCChtrLAp+HU=;
 b=be8/Yk5dta2rusnOvw8uV+pKuCMruQxJYP0YyVtsskuUcxu5pCgbO8Dy83q0Ofbhnz
 +QRgZ6qopksb7F70b9workFWCPuz7YcTxcPTaiJNg8rJvI+kxRHynqXZey+csf00FtW5
 T1Zo8dQiwBv49GelSpvQx46a8VafazNQjs4L0Mg8Bj/5Q/tVu/3Iiz6niVCF+M8yg4MH
 9rb5Moi+juWHpCyjQ1zIM4f532VkpFA7xxF0p52xy9/SMavIrZ/ayAJWhdUWs1Hti5rS
 R6OKq3XTlUT5fMgwyxzGbl5H9I6ToEESMbC4L8RHIyByQ08RLU0iHnK9GaYhuSHzckxP
 rrWA==
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

Q2hlY2sgdGhlIEJBQ08gY2FwYWJpbGl0aWVzIGZyb20gdGhlIHBvd2VycGxheSB0YWJsZS4KClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgMTEgKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKaW5kZXgg
NDYyMDZhMWExZjRkLi42OGMxOGY1ZjRiNDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAt
MjkzLDYgKzI5MywxNiBAQCBzdGF0aWMgaW50IG52X2FzaWNfbW9kZTFfcmVzZXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGJvb2wgbnZfYXNp
Y19zdXBwb3J0c19iYWNvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCXN0cnVjdCBz
bXVfY29udGV4dCAqc211ID0gJmFkZXYtPnNtdTsKKworCWlmIChzbXVfYmFjb19pc19zdXBwb3J0
KHNtdSkpCisJCXJldHVybiB0cnVlOworCWVsc2UKKwkJcmV0dXJuIGZhbHNlOworfQorCiBzdGF0
aWMgZW51bSBhbWRfcmVzZXRfbWV0aG9kCiBudl9hc2ljX3Jlc2V0X21ldGhvZChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIHsKQEAgLTU4NSw2ICs1OTUsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFtZGdwdV9hc2ljX2Z1bmNzIG52X2FzaWNfZnVuY3MgPQogCS5uZWVkX2Z1bGxfcmVzZXQg
PSAmbnZfbmVlZF9mdWxsX3Jlc2V0LAogCS5nZXRfcGNpZV91c2FnZSA9ICZudl9nZXRfcGNpZV91
c2FnZSwKIAkubmVlZF9yZXNldF9vbl9pbml0ID0gJm52X25lZWRfcmVzZXRfb25faW5pdCwKKwku
c3VwcG9ydHNfYmFjbyA9ICZudl9hc2ljX3N1cHBvcnRzX2JhY28sCiB9OwogCiBzdGF0aWMgaW50
IG52X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
