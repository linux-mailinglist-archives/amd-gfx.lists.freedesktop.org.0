Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00E754C6
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0846E7A2;
	Thu, 25 Jul 2019 16:58:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F936E7A2
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:10 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 44so18748754qtg.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bkeEVq4ma4JyUzhIhvbNBXcqQll25fPsNywNtCNfhuI=;
 b=b8zMJn8d0ahMMzo/pILuPSql0NYLTVwSKF0aaWHcMHFCyE4/+WDJbnq1yh6Z5T+ZHW
 imQu9tlPKxduRrKTro2Z1hw294ByhniBBeoRn9KRGFQFchCUdD3aWAt6EnXm2vWOp5dH
 lwbIZkvbWb1GNn53Yg1bAPOb2J6Xy+XyTlx1wx8PeicOz0Mv65U8YaUcoa5ChoXWn54g
 eFkyKAZi61bhoode0ChFfnT4UYAHX/nJUoxje3voXR9BUj2zquecYN8YO3Wd/+4FDnMV
 YWpYXYWX4FHzeyYnNnYXsiqIJ6QWY9G5YZ+9uaEOaUzLxP9uJ2dD6feZbMDmXZnOZb+f
 Hepw==
X-Gm-Message-State: APjAAAXxr85jwGhqIGK4ObcUwGTm+uH0HRzSo9IA0DWtWaFIqU+WWTpx
 0hS89cNfzRhDLKXW3UGu3iGpHx/i
X-Google-Smtp-Source: APXvYqwtFEQkOTOZAxCMwQLsaocentylpNdKkW9WFLfqV5XcihZkIXGL7ign4biaZhxNL0whLgCyYQ==
X-Received: by 2002:ac8:31ba:: with SMTP id h55mr63595472qte.363.1564073889433; 
 Thu, 25 Jul 2019 09:58:09 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/12] drm/amdgpu: add reset_method asic callback for navi
Date: Thu, 25 Jul 2019 11:57:52 -0500
Message-Id: <20190725165758.16928-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bkeEVq4ma4JyUzhIhvbNBXcqQll25fPsNywNtCNfhuI=;
 b=E8Vk1eWAL0UHPUCo8MIKlLRqESMFHisES0xlbE3hx7JHjXm7Zag44RRx2TnX1M1fXN
 1Ha9tbTTehUH2GVQ2bLmCxt9Iz5zQpAgojS0D/R3JzoCpmTJIvI/pcgkkzg1fE9NRo8Y
 F1RxB0MHUKIStA+qqsTovTuAhP+PK2e6iajwzukWDlxDsuKTrunIloR8MmCKY7MObp57
 0pRtoIP2QkBR8Z1Q72JTlhJgsH1wkGakvBSlQX6wUxdOsbyhMEMUM8Pn/2lYnu3uHstt
 kuN1WxrEJLS/qbkyjq2zGAyanwERTHxFSUPFmsYBVLh/3wpR2JhHUpZxZx3nK+umhhGL
 8R0g==
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

TmF2aSB1c2VzIGVpdGhlciBtb2RlMSBvciBiYWNvIGRlcGVuZGluZyBvbiB2YXJpb3VzCmNvbmRp
dGlvbnMuCgpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgfCAxNSArKysrKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L252LmMKaW5kZXggNmM1OWI2NGI5YmIxLi5iZjRjYmNkZWVmNzggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYwpAQCAtMjg5LDYgKzI4OSwxOCBAQCBzdGF0aWMgaW50IG52X2FzaWNfbW9kZTFf
cmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlyZXR1cm4gcmV0OwogfQorCitz
dGF0aWMgZW51bSBhbWRfcmVzZXRfbWV0aG9kCitudl9hc2ljX3Jlc2V0X21ldGhvZChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2
LT5zbXU7CisKKwlpZiAoc211X2JhY29faXNfc3VwcG9ydChzbXUpKQorCQlyZXR1cm4gQU1EX1JF
U0VUX01FVEhPRF9CQUNPOworCWVsc2UKKwkJcmV0dXJuIEFNRF9SRVNFVF9NRVRIT0RfTU9ERTE7
Cit9CisKIHN0YXRpYyBpbnQgbnZfYXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIHsKIApAQCAtMzAzLDcgKzMxNSw3IEBAIHN0YXRpYyBpbnQgbnZfYXNpY19yZXNldChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlpbnQgcmV0ID0gMDsKIAlzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSA9ICZhZGV2LT5zbXU7CiAKLQlpZiAoc211X2JhY29faXNfc3VwcG9ydChzbXUpKQor
CWlmIChudl9hc2ljX3Jlc2V0X21ldGhvZChhZGV2KSA9PSBBTURfUkVTRVRfTUVUSE9EX0JBQ08p
CiAJCXJldCA9IHNtdV9iYWNvX3Jlc2V0KHNtdSk7CiAJZWxzZQogCQlyZXQgPSBudl9hc2ljX21v
ZGUxX3Jlc2V0KGFkZXYpOwpAQCAtNTAwLDYgKzUxMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
YW1kZ3B1X2FzaWNfZnVuY3MgbnZfYXNpY19mdW5jcyA9CiAJLnJlYWRfYmlvc19mcm9tX3JvbSA9
ICZudl9yZWFkX2Jpb3NfZnJvbV9yb20sCiAJLnJlYWRfcmVnaXN0ZXIgPSAmbnZfcmVhZF9yZWdp
c3RlciwKIAkucmVzZXQgPSAmbnZfYXNpY19yZXNldCwKKwkucmVzZXRfbWV0aG9kID0gJm52X2Fz
aWNfcmVzZXRfbWV0aG9kLAogCS5zZXRfdmdhX3N0YXRlID0gJm52X3ZnYV9zZXRfc3RhdGUsCiAJ
LmdldF94Y2xrID0gJm52X2dldF94Y2xrLAogCS5zZXRfdXZkX2Nsb2NrcyA9ICZudl9zZXRfdXZk
X2Nsb2NrcywKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
