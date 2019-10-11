Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE5CD3745
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FF86EB94;
	Fri, 11 Oct 2019 01:45:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACAC6EB95
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:50 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q203so7504199qke.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n5DtixLB6grYprUfRNGCNIjmKKhYAk4IH60ib90cbu4=;
 b=f93SdXaKusBJ8Bzs6w8Lbpd3quZEktyaNt36/DJPOkufvfymFOZkiK/2rIxLHc3X5f
 9CxwCU4lwlnjZI6KhhHmdnTfGvi2SJmKFFM0iEp1rFhm0hFu9Q8EaUrQ5SbhVO3s/nTQ
 r/SAp1RUj6tWobvrHnKI4R/l8yC5Qc3FcyLLYstKJzzB/4MinL7h3Ac2SYGVz43CVjVR
 MffHYr5sJY6D0Aa/dUo/O3T5LcsnAMSG94puDRBmAedDPPxK4izhTAte5quULDe5E/w9
 abLsBimwD4q+8db76vb5x/Makg70Lduk/2QjZbgugt6n6XMo5NHtfImQ8JYsmxOyANzC
 pg1g==
X-Gm-Message-State: APjAAAWcx6arxFxH1dOBp8/JCQgeqWXhmurxFTV+yj8yYexrVAz9BYhy
 CR7K75HL+Ou02gIlwK5Oo9LNv4I4
X-Google-Smtp-Source: APXvYqzQHFf7e31PEfbMriFOnSLEpx9IYKAXOcFjf7LWpDL3SapGK0NYUVR0v+rRhffI8n/b5uez/A==
X-Received: by 2002:ae9:d801:: with SMTP id u1mr12938384qkf.245.1570758349407; 
 Thu, 10 Oct 2019 18:45:49 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 04/19] drm/amdgpu: add supports_baco callback for CIK asics.
Date: Thu, 10 Oct 2019 20:45:21 -0500
Message-Id: <20191011014536.10869-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n5DtixLB6grYprUfRNGCNIjmKKhYAk4IH60ib90cbu4=;
 b=USTpZ1icWwKNpEgG8Z0koeR0Jkwe9ci0QCgf/rAz6JiBHp3kKyUHIfSp+Dt9bnju3x
 8O2NLFTrJmsbfmFlzHC6YB8goZ+owG4c//Lv9EoH9y5FoBY9CdfTpjhfnUmffeNkCb9i
 1oPRB4W3L9uXrY5cpghPMBDeseis7LMXPqF+QSFH/a+FJp+y2Zch2jW6C186DzDL7Us2
 b2a0uSQCo+nBGIhJ85yl1R7+MLoCFLO9mFMa7JREsLCoxzBbfadG4iHhQF+O79MxIEni
 XG4T5GXvCqN9Heox6KYXikm8AMOxHKEJPFrV1aer4fK6QMthL/LT1HuLQJQzvpsi1Gx9
 ZO6g==
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
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWsuYyB8IDE4ICsrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9jaWsuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Np
ay5jCmluZGV4IGZjOGIzNDQ4MGY2Ni4uNDIzZmY5N2FjN2RjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9jaWsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9jaWsuYwpAQCAtMTI5MSw2ICsxMjkxLDIzIEBAIHN0YXRpYyBpbnQgY2lrX2FzaWNfcGNpX2Nv
bmZpZ19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlyZXR1cm4gcjsKIH0KIAor
c3RhdGljIGJvb2wgY2lrX2FzaWNfc3VwcG9ydHNfYmFjbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKK3sKKwlib29sIGJhY29fc3VwcG9ydDsKKworCXN3aXRjaCAoYWRldi0+YXNpY190eXBl
KSB7CisJY2FzZSBDSElQX0JPTkFJUkU6CisJY2FzZSBDSElQX0hBV0FJSToKKwkJc211N19hc2lj
X2dldF9iYWNvX2NhcGFiaWxpdHkoYWRldiwgJmJhY29fc3VwcG9ydCk7CisJCWJyZWFrOworCWRl
ZmF1bHQ6CisJCWJhY29fc3VwcG9ydCA9IGZhbHNlOworCQlicmVhazsKKwl9CisKKwlyZXR1cm4g
YmFjb19zdXBwb3J0OworfQorCiBzdGF0aWMgZW51bSBhbWRfcmVzZXRfbWV0aG9kCiBjaWtfYXNp
Y19yZXNldF9tZXRob2Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CkBAIC0xODgwLDYg
KzE4OTcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9hc2ljX2Z1bmNzIGNpa19hc2lj
X2Z1bmNzID0KIAkuZ2V0X3BjaWVfdXNhZ2UgPSAmY2lrX2dldF9wY2llX3VzYWdlLAogCS5uZWVk
X3Jlc2V0X29uX2luaXQgPSAmY2lrX25lZWRfcmVzZXRfb25faW5pdCwKIAkuZ2V0X3BjaWVfcmVw
bGF5X2NvdW50ID0gJmNpa19nZXRfcGNpZV9yZXBsYXlfY291bnQsCisJLnN1cHBvcnRzX2JhY28g
PSAmY2lrX2FzaWNfc3VwcG9ydHNfYmFjbywKIH07CiAKIHN0YXRpYyBpbnQgY2lrX2NvbW1vbl9l
YXJseV9pbml0KHZvaWQgKmhhbmRsZSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
