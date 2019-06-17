Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76C48EFA
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6752C89B05;
	Mon, 17 Jun 2019 19:28:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8DA89B18
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:38 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s15so12199731qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yf+dPYTtiBnx4/6WgZzfzKkXK31iKyA1/puA2wBn/fM=;
 b=lnRLDedVzg840cyUsqEbjdvot4bJDAEUu25eusv14kz0PMqWQR0RW4kw2vSg8HUDi3
 jX/E0MEnYze5liHHCSVShUk/6ySXYfIFnzy+DN0hySxSVunfB2LgFiStNcUvWHL8LZUt
 IgLA/knkcQ8CQ+TBnXfnhcHClLoylSh+4KcYC0ISvlKue/Ki4l4B2GJ8XLBijOB/syEb
 L6ExhHckvYI4uR4qAkI5V0DN3GTiBhZ75ECGHLdoz3bBPiDrS4CU4yldc6PG5GDU+L7X
 QcyxpZF94G2QUIVrdSKTfWxwq9agAOXp9ECgRy9frwuVeU1q2FeG//qG+yNXTXxN641N
 YTSA==
X-Gm-Message-State: APjAAAUI03vdtvmNI4YWsBJM4yLWzZsErJIw0K4J3PIvUEGNI6bPIXd9
 lI7AbDfAGE7Lh5EasuK95m2QkNpvBk4=
X-Google-Smtp-Source: APXvYqzp4I0pcpAmO2h98rWJ9GFjFLvkyarPbkS6XyPOsRdeyqGW8WrANmGx+YZzGerzRbEWkPJbnw==
X-Received: by 2002:aed:24d9:: with SMTP id u25mr97929641qtc.111.1560799717159; 
 Mon, 17 Jun 2019 12:28:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 191/459] drm/amd/powerplay: update smu11_driver_if_navi10.h
Date: Mon, 17 Jun 2019 14:26:56 -0500
Message-Id: <20190617192704.18038-92-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yf+dPYTtiBnx4/6WgZzfzKkXK31iKyA1/puA2wBn/fM=;
 b=U0yhLHWe1esr3Wx7jC6tx1ldDd6SJ0erOvhqovqnlfRZDNS9QgHzX61VzRHtkU5/5w
 Pv/0k8TwVN6ZPyg3kHDa+j6s0ZfdpcSMqlofNZ04iAWhkw9t5jLqmdgDe2l+yiCBhif/
 ASQaX3iatmBvtgxKtEtlrFy5A2u8bejUE73hnVbxgRRHy3cf3Xk/bMkD2WeAah/3w4LH
 TcUuP6C+ffReZhvRs6Fwo9qLZQpwqxDo5PCuQ7CJ03Bo37NWRbY+uoHNMBGmtt/roD0V
 A1uhi/kc/HpV3eOHia39fgxhOjmFSbhxhBuMHUHOxAAXox/qoKaxZnT1OY7DSeWGxybT
 5Sow==
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
 Kenneth Feng <kenneth.feng@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCnVwZGF0ZSB0aGUgc211
MTFfZHJpdmVyX2lmX25hdmkxMC5oIHNpbmNlIG5hdmkxMCBzbXUgZncKdXBkYXRlIHRvIDQyLjE1
LjAKClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2Ft
ZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9uYXZpMTAuaCAgfCAxNyArKysrKystLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2Ry
aXZlcl9pZl9uYXZpMTAuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUx
MV9kcml2ZXJfaWZfbmF2aTEwLmgKaW5kZXggMjViN2M4YzQ5NmY3Li44M2VmMGUyNmMwNTEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJf
aWZfbmF2aTEwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTEx
X2RyaXZlcl9pZl9uYXZpMTAuaApAQCAtNCw3ICs0LDcgQEAKIC8vICoqKiBJTVBPUlRBTlQgKioq
CiAvLyBTTVUgVEVBTTogQWx3YXlzIGluY3JlbWVudCB0aGUgaW50ZXJmYWNlIHZlcnNpb24gaWYg
CiAvLyBhbnkgc3RydWN0dXJlIGlzIGNoYW5nZWQgaW4gdGhpcyBmaWxlCi0jZGVmaW5lIFNNVTEx
X0RSSVZFUl9JRl9WRVJTSU9OIDB4MkUKKyNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT04g
MHgyRgogCiAjZGVmaW5lIFBQVEFCTEVfTlYxMF9TTVVfVkVSU0lPTiA4CiAKQEAgLTY4OSw4ICs2
ODksMTEgQEAgdHlwZWRlZiBzdHJ1Y3QgewogICAvLyBCVEMgU2V0dGluZwogICB1aW50MzJfdCAg
ICAgQnRjQ29uZmlnOwogICAKKyAgdWludDE2X3QgICAgIFNzRm1pblsxMF07IC8vIFBQdGFibGUg
dmFsdWUgdG8gZnVuY3Rpb24gc2ltaWxhciB0byBWRlRGbWluIGZvciBTUyBDdXJ2ZTsgU2l6ZSBp
cyBQUENMS19DT1VOVCByb3VuZGVkIHRvIG5lYXJlc3QgbXVsdGlwbGUgb2YgMgorICB1aW50MTZf
dCAgICAgRGNCdGNHYltBVkZTX1ZPTFRBR0VfQ09VTlRdOworCiAgIC8vIFNFQ1RJT046IEJvYXJk
IFJlc2VydmVkCi0gIHVpbnQzMl90ICAgICBSZXNlcnZlZFsxNF07CisgIHVpbnQzMl90ICAgICBS
ZXNlcnZlZFs4XTsKIAogICAvLyBTRUNUSU9OOiBCT0FSRCBQQVJBTUVURVJTCiAgIC8vIEkyQyBD
b250cm9sCkBAIC0xMDI3LDE3ICsxMDMwLDkgQEAgdHlwZWRlZiBzdHJ1Y3QgewogCiAvL1JMQyBQ
YWNlIFRhYmxlIHRvdGFsIG51bWJlciBvZiBsZXZlbHMKICNkZWZpbmUgUkxDX1BBQ0VfVEFCTEVf
TlVNX0xFVkVMUyAxNgotI2RlZmluZSBSTENfUEFDRV9SQVRJT19OVU1fTEVWRUxTIDgKLQotdHlw
ZWRlZiBzdHJ1Y3QgewotICB1aW50OF90IEJ5dGVSYXRpb0xvdzsKLSAgdWludDhfdCBGbG9wc1Jh
dGlvTG93OwotICB1aW50OF90IEJ5dGVSYXRpb0hpZ2g7Ci0gIHVpbnQ4X3QgRmxvcHNSYXRpb0hp
Z2g7Ci19IFJsY1BhY2VGbG9wc1BlckJ5dGVfdDsKIAogdHlwZWRlZiBzdHJ1Y3QgewotICBSbGNQ
YWNlRmxvcHNQZXJCeXRlX3QgRmxvcHNQZXJCeXRlVGFibGVbUkxDX1BBQ0VfUkFUSU9fTlVNX0xF
VkVMU107CisgIGZsb2F0IEZsb3BzUGVyQnl0ZVRhYmxlW1JMQ19QQUNFX1RBQkxFX05VTV9MRVZF
TFNdOwogICAKICAgdWludDMyX3QgICAgIE1tSHViUGFkZGluZ1s4XTsgLy8gU01VIGludGVybmFs
IHVzZSAgCiB9IFJsY1BhY2VGbG9wc1BlckJ5dGVPdmVycmlkZV90OwotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
