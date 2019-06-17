Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F26448EAE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5C3898CA;
	Mon, 17 Jun 2019 19:27:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263C7898C4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:37 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m29so12248480qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wki7VyLnXqTC5Hm1HWWRCUXRNBuOgG6bvZmI18GvVw=;
 b=s3udcLmf/Ep7XC/+uuVsP5Hm/5LSk/b/FT+ZsoLQDBZFxfRkX4dV11dOumSoBoyrlB
 8oic+6B5f1psKQG5RCv7o6I9N1pUYRgnccHI9wtGgsCMi0nX2ZnLxjGfySSF4inbM4xB
 LD1aCC0JLezDZqtWjdgpoy4wzrPg9NsrX7AZ4vsAdQOYeWdqBKZefGkxqlMk8qdRN53x
 8FHkLyT0sLlucZ7575ZUigYy/TX8faMlV5X5UmVd/94zY46w3BzPlyJPdFkZFeveQfCO
 zKOTWShUBa575QzFR3mZc5wncyFL8QEhPjr+Cy485kYkRzq70TEZaEicH26caew5Gs5r
 3zrg==
X-Gm-Message-State: APjAAAVnmtI1U8YvGRXQPLsCJaz4VGj3vEI+lBu0RWz6zlBMt4ePi+OA
 CtH64rR1VTsqwrhVToQNnQ+puYj27rA=
X-Google-Smtp-Source: APXvYqw4fx4rhcyn2/i0f2cf5em7QWmXvrnor3zvbgg7q162R21TCP6XA08zIjpajtNsCuKFMI4sEw==
X-Received: by 2002:a0c:99d5:: with SMTP id y21mr22989721qve.106.1560799656125; 
 Mon, 17 Jun 2019 12:27:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 124/459] drm/amdgpu: avoid to use SOC15_REG_OFFSET in static
 array for navi10
Date: Mon, 17 Jun 2019 14:25:49 -0500
Message-Id: <20190617192704.18038-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5wki7VyLnXqTC5Hm1HWWRCUXRNBuOgG6bvZmI18GvVw=;
 b=OMbPOLU9LnewbmU+F9uHG5o8WAJSAhiJiQ1Ucc/WoBY/JBk2ccTlgLBKrUCOZpOFbT
 rlhhqLyD9UUAS4OzO67QUJnlnJmFdSiAfeD72XFh1vgZ+Dn1Ryn9EDda5bWVKUFP21qi
 7yUfuFeftf34eHsqpN5EN7F+D1y3agwJr2vwK6Q2EZQl2z5WGufD8kElFBS8rmkssc1z
 hTwQiWh4jsE8khkKVZCy7xrfSztNvzgD41EYii7jmKqQ1Nlku2B3cMWrlmjIlcvBLVm8
 6EL9ywWsEmRaT8Pqyyeq73AG9fN60YpCy7VDMPMAnqrWV+EfHQvHG3nUg6FRCp2F3xW6
 65OA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpBY2tlZC1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYyB8IDkgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5oIHwgOCArKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
c29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggZDlmZGQ5
NWZkNmU2Li4zZmJjM2NkODQ5ZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAt
Mjc0LDE1ICsyNzQsNiBAQCBzdGF0aWMgYm9vbCBzb2MxNV9yZWFkX2Jpb3NfZnJvbV9yb20oc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJcmV0dXJuIHRydWU7CiB9CiAKLXN0cnVjdCBzb2Mx
NV9hbGxvd2VkX3JlZ2lzdGVyX2VudHJ5IHsKLQl1aW50MzJfdCBod2lwOwotCXVpbnQzMl90IGlu
c3Q7Ci0JdWludDMyX3Qgc2VnOwotCXVpbnQzMl90IHJlZ19vZmZzZXQ7Ci0JYm9vbCBncmJtX2lu
ZGV4ZWQ7Ci19OwotCi0KIHN0YXRpYyBzdHJ1Y3Qgc29jMTVfYWxsb3dlZF9yZWdpc3Rlcl9lbnRy
eSBzb2MxNV9hbGxvd2VkX3JlYWRfcmVnaXN0ZXJzW10gPSB7CiAJeyBTT0MxNV9SRUdfRU5UUlko
R0MsIDAsIG1tR1JCTV9TVEFUVVMpfSwKIAl7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1HUkJN
X1NUQVRVUzIpfSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5oCmluZGV4IDQ4ZTgyNGQ1MmFk
OS4uN2E2YjJjYzZkOWY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmgKQEAgLTUyLDYg
KzUyLDE0IEBAIHN0cnVjdCBzb2MxNV9yZWdfZW50cnkgewogCXVpbnQzMl90IGluc3RhbmNlOwog
fTsKIAorc3RydWN0IHNvYzE1X2FsbG93ZWRfcmVnaXN0ZXJfZW50cnkgeworCXVpbnQzMl90IGh3
aXA7CisJdWludDMyX3QgaW5zdDsKKwl1aW50MzJfdCBzZWc7CisJdWludDMyX3QgcmVnX29mZnNl
dDsKKwlib29sIGdyYm1faW5kZXhlZDsKK307CisKICNkZWZpbmUgU09DMTVfUkVHX0VOVFJZKGlw
LCBpbnN0LCByZWcpCWlwIyNfSFdJUCwgaW5zdCwgcmVnIyNfQkFTRV9JRFgsIHJlZwogCiAjZGVm
aW5lIFNPQzE1X1JFR19FTlRSWV9PRkZTRVQoZW50cnkpCShhZGV2LT5yZWdfb2Zmc2V0W2VudHJ5
Lmh3aXBdW2VudHJ5Lmluc3RdW2VudHJ5LnNlZ10gKyBlbnRyeS5yZWdfb2Zmc2V0KQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
