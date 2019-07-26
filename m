Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0975D56
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 05:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A876E86A;
	Fri, 26 Jul 2019 03:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356956E86A
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 03:22:07 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id s145so38089829qke.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 20:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TraRHMiTQttkxofxPZTL7YiOlf/Xo2RrRa87VgDbDqM=;
 b=U3QtgJX8HLgVJLhGqeOYspYTu/6QUpyYx9lpfc0XioPrvH3Lkf23BItimscD3wG5iQ
 A8n7QDRspbiw4biYYHVwgZ9xA3XFl1AkjXjt5V5OFxKyLvNG9luOtFEzKV9y2L1hljnk
 B2+jQ7V0J9JkVHljzpVCGcryOhHn786W0+WcMvm1iMHfeArW9V3+F8FWst9OpiQitgM9
 s5qkXH8wHWMTyXlTBPtkQV6V7Z7HkrDlTk/pt6oH7Fok443UYmImL5UAhNdFxGiqu9pt
 CdZ6lEyaH9mWS5KyJYDvOcdnic474CthcAV+nw5Ke0WmyUecWLaP85URHoGOsTe1lhjP
 0Eww==
X-Gm-Message-State: APjAAAWCL5eensxNXZUlqjuWPBTnEA410ay6QLxkaobXNeoNo7SId1wz
 RF0VhD0QLYoTeX3lHu663FKnbas9
X-Google-Smtp-Source: APXvYqw006SGaO0ETkGobZ14HbNVWmPJE9yz+F1JDABz+EGSy/5z6FtvRbHaamEq4lam7RJ+qatjAQ==
X-Received: by 2002:a37:90c2:: with SMTP id
 s185mr64009187qkd.161.1564111326146; 
 Thu, 25 Jul 2019 20:22:06 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id r26sm22190175qkm.57.2019.07.25.20.22.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 20:22:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/11] drm/amdgpu/powerplay: add set_mp1_state for vega10
Date: Thu, 25 Jul 2019 22:21:44 -0500
Message-Id: <20190726032146.3187-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726032146.3187-1-alexander.deucher@amd.com>
References: <20190726032146.3187-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TraRHMiTQttkxofxPZTL7YiOlf/Xo2RrRa87VgDbDqM=;
 b=AVD+XbQZUr0rMSeujVE+vJBzTmFq2uU54mhDyfml4RGYswGrkoj4JuuUMiH1pVS6lj
 vqM+yHpIRaD4dnSHpb1YraAMaUOShSTnjgQs7ssrHl+UW0YfqLIvtM8RnAJ18NMg/aiD
 P+tgmqQ6XC6kRA8KeZCww2k1UFFOTX0HoQs0h1UwJt8YgdRZOh0J/Vt6PPMgPt1qabxK
 WmsrRlkJXN8f27XDBQxFrZeS8tH8xV0XE03hZWUVKwKQDeE+M1BBELizIXmvCFutlMC2
 1/utg/UUMBf7ZxV63SiRj6qqQtW0ZjPZQS6W2JkOl+zWzitgnTqkTZYutC/VCnwofGYJ
 W0Kw==
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

VGhpcyBzZXRzIHRoZSBTTVUgaW50byB0aGUgcHJvcGVyIHN0YXRlIGZvciB2YXJpb3VzCm9wZXJh
dGlvbnMgKHNodXRkb3duLCB1bmxvYWQsIEdQVSByZXNldCwgZXRjLikuCgpSZXZpZXdlZC1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci92ZWdhMTBfaHdtZ3IuYyAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwppbmRleCAxZDliYjI5YWRhZWYuLjAzYmQ2MmUz
ZDk0NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTEwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTEwX2h3bWdyLmMKQEAgLTUyMTgsNiArNTIxOCwzMCBAQCBzdGF0aWMgaW50IHZlZ2ExMF9vZG5f
ZWRpdF9kcG1fdGFibGUoc3RydWN0IHBwX2h3bWdyICpod21nciwKIAlyZXR1cm4gMDsKIH0KIAor
c3RhdGljIGludCB2ZWdhMTBfc2V0X21wMV9zdGF0ZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAor
CQkJCWVudW0gcHBfbXAxX3N0YXRlIG1wMV9zdGF0ZSkKK3sKKwl1aW50MTZfdCBtc2c7CisJaW50
IHJldDsKKworCXN3aXRjaCAobXAxX3N0YXRlKSB7CisJY2FzZSBQUF9NUDFfU1RBVEVfVU5MT0FE
OgorCQltc2cgPSBQUFNNQ19NU0dfUHJlcGFyZU1wMUZvclVubG9hZDsKKwkJYnJlYWs7CisJY2Fz
ZSBQUF9NUDFfU1RBVEVfU0hVVERPV046CisJY2FzZSBQUF9NUDFfU1RBVEVfUkVTRVQ6CisJY2Fz
ZSBQUF9NUDFfU1RBVEVfTk9ORToKKwlkZWZhdWx0OgorCQlyZXR1cm4gMDsKKwl9CisKKwlQUF9B
U1NFUlRfV0lUSF9DT0RFKChyZXQgPSBzbXVtX3NlbmRfbXNnX3RvX3NtYyhod21nciwgbXNnKSkg
PT0gMCwKKwkJCSAgICAiW1ByZXBhcmVNcDFdIEZhaWxlZCEiLAorCQkJICAgIHJldHVybiByZXQp
OworCisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgdmVnYTEwX2dldF9wZXJmb3JtYW5jZV9s
ZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBjb25zdCBzdHJ1Y3QgcHBfaHdfcG93ZXJfc3Rh
dGUgKnN0YXRlLAogCQkJCVBITV9QZXJmb3JtYW5jZUxldmVsRGVzaWduYXRpb24gZGVzaWduYXRp
b24sIHVpbnQzMl90IGluZGV4LAogCQkJCVBITV9QZXJmb3JtYW5jZUxldmVsICpsZXZlbCkKQEAg
LTUzMDcsNiArNTMzMSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHBfaHdtZ3JfZnVuYyB2ZWdh
MTBfaHdtZ3JfZnVuY3MgPSB7CiAJLmVuYWJsZV9tZ3B1X2Zhbl9ib29zdCA9IHZlZ2ExMF9lbmFi
bGVfbWdwdV9mYW5fYm9vc3QsCiAJLmdldF9wcGZlYXR1cmVfc3RhdHVzID0gdmVnYTEwX2dldF9w
cGZlYXR1cmVfc3RhdHVzLAogCS5zZXRfcHBmZWF0dXJlX3N0YXR1cyA9IHZlZ2ExMF9zZXRfcHBm
ZWF0dXJlX3N0YXR1cywKKwkuc2V0X21wMV9zdGF0ZSA9IHZlZ2ExMF9zZXRfbXAxX3N0YXRlLAog
fTsKIAogaW50IHZlZ2ExMF9od21ncl9pbml0KHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
