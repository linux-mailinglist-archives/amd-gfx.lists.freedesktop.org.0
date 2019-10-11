Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF77AD36D0
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E396EB96;
	Fri, 11 Oct 2019 01:21:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D906EB96
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:21:49 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id p10so7430824qkg.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDSIXxdtwEeMi3E6LM+24aUDCwgQJEutvB/6iJ+Xzyw=;
 b=H4i3mQpcCtNlKs7lr5U/+FJ8iht6KSG2NKqupq6NHQbbWYkE6+/Dhiq/hN/7x1peCN
 HAGGEm/gcbk0StqOxqg0WAAveXBE8hIZLWrdvThY/+qn0mWOrUgGJJ+4rVNdrSb9FiVx
 gluMLlvT4I8JwwQIQf4YRT1keyC5H5qOtM/er3US+6Y71A+N9NmU1Y79FM/Qh6p/DPUj
 3csH0BkKar+FSv0t9EdIkku4ztaBd/F/LphJ1yJ1DVApOvckjPTBUBXhzy6X6a0hCm9X
 dO1VQvRcEyNiudlr1DwBsavm9wJHj7epc/0mSu5a3GzhPgw2bupsH0+PTOT7YGyvXuwK
 DPLQ==
X-Gm-Message-State: APjAAAXZRFxsddQJ4JXBbbY0mhgJ1l7jnqNVXyN4cayfiz+U8j+QwXTP
 1LRxXrdFl4inKBA/EedbnvIDIto9
X-Google-Smtp-Source: APXvYqzUQf1kqALF+qI/2rwx9vrlWR26DfwKXD2HpLH9XDWVa9Gkz2cwZHXHI5SN/a6Qhf929UAZwQ==
X-Received: by 2002:a37:a8d5:: with SMTP id
 r204mr12519319qke.377.1570756907981; 
 Thu, 10 Oct 2019 18:21:47 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p199sm3301590qke.18.2019.10.10.18.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:21:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/15] drm/amdgpu: add new SMU 7.1.2 registers for BACO
Date: Thu, 10 Oct 2019 20:21:24 -0500
Message-Id: <20191011012135.18566-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011012135.18566-1-alexander.deucher@amd.com>
References: <20191011012135.18566-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDSIXxdtwEeMi3E6LM+24aUDCwgQJEutvB/6iJ+Xzyw=;
 b=n2Qu9kYaKm1cFry0ZJFAsggzhVTQ/DxQkZs9OdWvC/PBDdyTLlUH34Upz5YGnInKEi
 KtP7qvdnMABEDfbLPnjpzmBHs+6C83DV3yv1uOn731/i0dwen0SltesTo0uzC+a58XbE
 XdLsGBXIdvzRALNUlQ7XfrONp046RXsvlsR76sNhY8XF7RtL5dPg8NOWmhLQyFTQcQRk
 nntONnMcfgZjkZdtvq+HewCIKWM3atVJTPuKPuyurWzKyDqFF8Pwnm1fB5jJHRhUROnI
 znYAIETMhlErQsl+eCRz4KL33dM8s8sYRfbs2VrybqtDGTIoYWzYiwnRhzJXeGlK50i4
 awRg==
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

U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9zbXUvc211XzdfMV8yX2Qu
aCAgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9z
bXVfN18xXzJfc2hfbWFzay5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211
L3NtdV83XzFfMl9kLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211
L3NtdV83XzFfMl9kLmgKaW5kZXggYmQzNjg1MTY2Nzc5Li4zNTE0NDY3NTRjNzIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hc2ljX3JlZy9zbXUvc211XzdfMV8yX2Qu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211L3NtdV83XzFf
Ml9kLmgKQEAgLTQ5LDYgKzQ5LDcgQEAKICNkZWZpbmUgaXhDR19TUExMX0ZVTkNfQ05UTF81ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhjMDUwMDE1
MAogI2RlZmluZSBpeENHX1NQTExfRlVOQ19DTlRMXzYgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAweGMwNTAwMTU0CiAjZGVmaW5lIGl4Q0dfU1BMTF9G
VU5DX0NOVExfNyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDB4YzA1MDAxNTgKKyNkZWZpbmUgaXhDR19TUExMX1NUQVRVUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhDMDUwMDE1QwogI2RlZmlu
ZSBpeFNQTExfQ05UTF9NT0RFICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweGMwNTAwMTYwCiAjZGVmaW5lIGl4Q0dfU1BMTF9TUFJFQURfU1BF
Q1RSVU0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4YzA1
MDAxNjQKICNkZWZpbmUgaXhDR19TUExMX1NQUkVBRF9TUEVDVFJVTV8yICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhjMDUwMDE2OApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9zbXVfN18xXzJfc2hfbWFzay5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9zbXVfN18xXzJfc2hf
bWFzay5oCmluZGV4IDYyNzkwNjY3NGZlOC4uNGJmZDVmOGJhNjZjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvc211L3NtdV83XzFfMl9zaF9tYXNrLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL3NtdS9zbXVfN18xXzJf
c2hfbWFzay5oCkBAIC0xOTQsNiArMTk0LDggQEAKICNkZWZpbmUgQ0dfU1BMTF9GVU5DX0NOVExf
Nl9fU1BMTF9MRl9DTlRSX19TSElGVCAweDE5CiAjZGVmaW5lIENHX1NQTExfRlVOQ19DTlRMXzdf
X1NQTExfQldfQ05UUkxfTUFTSyAweGZmZgogI2RlZmluZSBDR19TUExMX0ZVTkNfQ05UTF83X19T
UExMX0JXX0NOVFJMX19TSElGVCAweDAKKyNkZWZpbmUgQ0dfU1BMTF9TVEFUVVNfX1NQTExfQ0hH
X1NUQVRVU19NQVNLIDB4MgorI2RlZmluZSBDR19TUExMX1NUQVRVU19fU1BMTF9DSEdfU1RBVFVT
X19TSElGVCAweDEKICNkZWZpbmUgU1BMTF9DTlRMX01PREVfX1NQTExfU1dfRElSX0NPTlRST0xf
TUFTSyAweDEKICNkZWZpbmUgU1BMTF9DTlRMX01PREVfX1NQTExfU1dfRElSX0NPTlRST0xfX1NI
SUZUIDB4MAogI2RlZmluZSBTUExMX0NOVExfTU9ERV9fU1BMTF9MRUdBQ1lfUERJVl9NQVNLIDB4
MgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
