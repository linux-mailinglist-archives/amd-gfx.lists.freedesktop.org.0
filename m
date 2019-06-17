Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E248FCE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78F089C9D;
	Mon, 17 Jun 2019 19:45:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E220889449
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:52 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so12316290qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBK0nCta6lZBkAFufbB/K4lJ04ioWizzg7o2VZ2Pvjw=;
 b=Fq0jARUiVbPO89nXl/4wQAil/LHnK04ZxODUUklOsg2u2nWL7y3aXillUE5Fl/kPVk
 EZd3N1Xpq5LT0S+iIcrWchJV6LffH7FU2EfYz8ixhwv8v+dqLtVuFYYK/z3Yqb5QAHEb
 /WRNvMAT9UbTPkBUXwE4TJ6d3UqNdCrBuhTOuFJqMfbjXB0BXZy0yU2q984NRGPvzuxD
 xcRMLA2Izwj3AhiEB1nDM1piCy7iSXuBja6Fho+i86hfvg2/XMQnbCetQ+Nz+Gy2keZ7
 PioAP2IVTXKG8Xd3cgwFtDi8e+btpBJepcimxBcrTBVVypMOZv7ArMsHvRFe7FCDnb1c
 33kQ==
X-Gm-Message-State: APjAAAVordH6RBGxBcIwp08CVlQfDjmXEB0xQmm2AP1p2Og+2XBWVR7F
 KvUw6nijR1w6aDctwaVizs1Z78+osf4=
X-Google-Smtp-Source: APXvYqxdXf7/3uSRKUAOfjiZ0XqEd7As+wYfnHAr3TgGu+vFCTELa86hzJycMr2XF8szpG6USPmuug==
X-Received: by 2002:ac8:4705:: with SMTP id f5mr69051362qtp.99.1560800751935; 
 Mon, 17 Jun 2019 12:45:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 301/459] drm/amdgpu/VCN: enable indirect DPG SRAM mode
Date: Mon, 17 Jun 2019 14:44:02 -0500
Message-Id: <20190617194540.18497-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBK0nCta6lZBkAFufbB/K4lJ04ioWizzg7o2VZ2Pvjw=;
 b=kEVJMxOqbbci3KpcD7VMYtR/UGCRXhIBk2wTL5y4Ff/7JB22EGSUPVr5NMmKN6Cqrv
 VDEZR5cfjMl2WQqmwnT4sWenvLiiEQygJKEck/HIvKVMlwa3qc7nPoGVnqK7mpx0UD6v
 YBr6Ry5oyfk2Zs23W7tFv/QT8jvuR82/CrjHpoxEPq7PEHn7Hd0ZPev9cYEKH5OLYAcb
 L5hVSS8gGoHQ2KUmr0blvKc7PdU6yIuNfDmbNNBWdk6O6sHOpcAE6T2nbi04jw+UHzxb
 Nl31UGQP0fvIAOOUqBQKUbdlRxDl4IE76AFGDn6BkHN8mKvo//t7Lam6XDGa1U22M25X
 UOWA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKVGhpcyBpcyBkZWZhdWx0IG1vZGUgZm9y
IFZDTjIueCBub3cKClNpZ25lZC1vZmYtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEphbWVzIFpodSA8SmFtZXMuWmh1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92Y24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwppbmRleCA3
NjIxMDc3Mzc4ZGQuLmM2MDRmMTUwNGQzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92Y24uYwpAQCAtNzUsNiArNzUsOSBAQCBpbnQgYW1kZ3B1X3Zjbl9zd19pbml0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlicmVhazsKIAljYXNlIENISVBfTkFWSTEwOgogCQlm
d19uYW1lID0gRklSTVdBUkVfTkFWSTEwOworCQlpZiAoKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlw
ZSA9PSBBTURHUFVfRldfTE9BRF9QU1ApICYmCisJCSAgICAoYWRldi0+cGdfZmxhZ3MgJiBBTURf
UEdfU1VQUE9SVF9WQ05fRFBHKSkKKwkJCWFkZXYtPnZjbi5pbmRpcmVjdF9zcmFtID0gdHJ1ZTsK
IAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
