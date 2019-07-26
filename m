Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB1375D59
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38966E86F;
	Fri, 26 Jul 2019 03:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B286E867
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:22:04 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r21so38137240qke.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bkeEVq4ma4JyUzhIhvbNBXcqQll25fPsNywNtCNfhuI=;
 b=LrwKxOYXeqD2QOT4cZGDmjGTeqcq37h9mroZ83/uYMh675Z/cS0RKDNBof0kPu5SKD
 3Vhw/XGKD79oODPXyQ3Tk6ZQUuB47DI6U0wF5BtPmlbc6IwyQBqgUTUNUDNfbG1N1574
 URj1Ae1jSMJf0EUh8fSWIOlLSSTjMk8/WaoW/c6NJVtTtpceI37kNavt+Xb9IgvBk8VU
 NL4b1DHowyAbwP/PqAz083IhLG3qcnXi1fH9bE1xSm9SxRv36KAthX4gkLUzBxyZVZR8
 xiLbqaKFa3NbDIEVHFvMCvPcvDKpbkvc2SoC+q/fv3eyCuXFvGW8YDQcbTHeiJLr62od
 KCaw==
X-Gm-Message-State: APjAAAXWvW6Gez5R6HMp5fX3kcoyCnIKNzxJrZ1kcVZftImfrxudzFE0
 ajZY/H+3xG0SlpMJBwkXuRIHhngD
X-Google-Smtp-Source: APXvYqw789dOKOULsoXmfb4Pcqq150XQm8QBKbYR4R1AUGGsEL6T8yJyJEeZ4CkKnARXHiEViR+AOQ==
X-Received: by 2002:a37:4c4e:: with SMTP id z75mr61921830qka.230.1564111323571; 
 Thu, 25 Jul 2019 20:22:03 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.22.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:22:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/11] drm/amdgpu: add reset_method asic callback for navi
Date: Thu, 25 Jul 2019 22:21:41 -0500
Message-Id: <20190726032146.3187-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726032146.3187-1-alexander.deucher@amd.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bkeEVq4ma4JyUzhIhvbNBXcqQll25fPsNywNtCNfhuI=;
 b=LQyPtmWHJBk12d9DhReO6cVPphYVUCsXxVAa4cZTTA3HkwPJsLIkQva8eDkIlCXG/W
 lbwD3q7TFWA+IGRtYHTofqO75kyq8SKd2fDqdYBGjdUfa4vHwGuuS47v/L/GqDfK7LeL
 xTOK84TeSFk2rbylgupEq2otC0xSpAh6zSLQS07ri8QY77f5R+MnxCjXrRPmI5+/VtWj
 cjahBZoSIF1IIiHRYagszpcl1QjHg9x2TIvQYCCvWOhX0ftdsZgA/J14su7iXrEQ85uM
 Rr2EAnviEH+GD4Sc4RDl/WuOg2aAoBCswHSab4Fb9OOGBDPgPCyS3HY+mwPoYLQUyWMa
 g82A==
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
