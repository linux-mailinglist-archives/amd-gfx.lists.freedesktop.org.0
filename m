Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1608D5D770
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700936E05D;
	Tue,  2 Jul 2019 20:29:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BF66E067
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:24 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s22so15489576qkj.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q1Vc6g0VF73/humcqKsbDGCFLmhxGZAgfogjDzvNm6g=;
 b=spwWzzoRmDg8qjf3O3ip5H0Ks4rtF1vjf7PQ04RZCnn8TU2Ap5iG1sLE44rxk4/ytR
 4ZwUjxd4nVCCYbAv2ZTGrSDsFQ2bfZkbRwkTlMB0XlZOZrZgTnFHQ9ELCbWXx7IF17jR
 31ifgO6LjdOyRHN+AvHnV+WXPduMEHgP2pTRDob2OvNSYzabJcqWYyjJFKiWVxx5alSr
 i2v0JAlShjKTBJ2u6aGd/BAqREYS7v+4ooBp+hNAjxErCS8CX0pb1HuZ3rRFONbkgvj2
 h7t05dsF3Cllua7EBux6No4HcEX9kq3DmRuXGYRB7DYuo6tnBX2pMrLdNHy8OwNkF78A
 OYhg==
X-Gm-Message-State: APjAAAWaA3F1cklOvUH8f3pdcoRQWFiOYsrIVZZ49B5BylKJJXWWQlol
 G0nqjtkjIIX2W5bKuWtQZ1bDo2HdXN8=
X-Google-Smtp-Source: APXvYqz3lEedaMykWBy2kaTYlqoG8HqKsVxexpAaJyahFJWS4+rCy5Rh8REValp4qVPVNiUaDIJJgA==
X-Received: by 2002:ae9:eb96:: with SMTP id
 b144mr25830903qkg.321.1562099363917; 
 Tue, 02 Jul 2019 13:29:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 32/53] drm/amdgpu/psp: start rlc autoload after psp received
 rlcg for navi14
Date: Tue,  2 Jul 2019 15:28:23 -0500
Message-Id: <20190702202844.17001-33-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q1Vc6g0VF73/humcqKsbDGCFLmhxGZAgfogjDzvNm6g=;
 b=u4I2NbYPE5ewJhTJk1VRLcP9HRg+aHyf3ZtG3ji0PFvSxGx5vjhbK7AfkOuZyApm56
 M5id4foHzlma37T0DIgmasxsjmb02C3ABxzMBbFCveLQIk5jRZtUqfAjpw7mTFvo7Yvw
 C8M/VZtjqEKfp1u64ccwqYKUVJZFG9MGHoi0P6ONr32i3p4kFnLBdvoHC2aFhdsqBO4t
 qljPc7xwuZwipf1cyx90id2rnO+b9XHYZW+vIjcNAI7AB4sLoZ923Be/a53oAwiW0jPh
 jdGpe+a1EVTGIETq46VJMlsNuSAlFvAmJYabTYEYzKk4Rdn3ooPtpFX8Uc3ETO7tqFKA
 Z3bg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClVwZGF0ZSBmb3IgbmF2
aTE0LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcHNwLmMKaW5kZXggMjUxZmEwNGQ2OTQxLi42MzE1OTI2MTcxM2YgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKQEAgLTk4Myw3ICs5ODMsOSBAQCBzdGF0aWMg
aW50IHBzcF9ucF9md19sb2FkKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCQkJcmV0dXJuIHJl
dDsKIAogCQkvKiBTdGFydCBybGMgYXV0b2xvYWQgYWZ0ZXIgcHNwIHJlY2lldmVkIGFsbCB0aGUg
Z2Z4IGZpcm13YXJlICovCi0JCWlmICh1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lE
X1JMQ19SRVNUT1JFX0xJU1RfU1JNX01FTSkgeworCQlpZiAodWNvZGUtPnVjb2RlX2lkID09IEFN
REdQVV9VQ09ERV9JRF9STENfUkVTVE9SRV9MSVNUX1NSTV9NRU0gfHwKKwkJICAgIChhZGV2LT5h
c2ljX3R5cGUgPT0gQ0hJUF9OQVZJMTQgJiYKKwkJICAgICB1Y29kZS0+dWNvZGVfaWQgPT0gQU1E
R1BVX1VDT0RFX0lEX1JMQ19HKSkgewogCQkJcmV0ID0gcHNwX3JsY19hdXRvbG9hZChwc3ApOwog
CQkJaWYgKHJldCkgewogCQkJCURSTV9FUlJPUigiRmFpbGVkIHRvIHN0YXJ0IHJsYyBhdXRvbG9h
ZFxuIik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
