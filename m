Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D8B5D76D
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B246E063;
	Tue,  2 Jul 2019 20:29:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C46F6E063
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:24 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so43046qto.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/VSKiReMOC0oWIwumCXV1+IV+vW3aWsgacS/TZXLzvY=;
 b=fC+QSpF7B2hb7mK7tLSVQab6nc3RdGGcbIwO1GT45lEUZdFcw9PAsJZiVSX3bX3/1V
 I3WoATv2cYEdtgu5NuTyaUzeu15F82IpVcq7C9crmxfpbYl3hpUDsM9k5sziNezhDC8Y
 pQAAck0CZuP1FdKy9zyREfile65uoZBABffKSsD5VuE0QZYz2BjomLjPK4jQvsutqr7/
 N7uITuzCJEkkW3P4oG6QFJCSnxZ12N6arLU1OEAzCXRMZIbs1YkMYUW/JXDGOXB9PwX2
 xEB7qDNJBQbwkcgCIuWyq2iz/EgvKMsQIhAqDQu5xYq6LT0dk5WElXMSW103FcmRnDK6
 iWlA==
X-Gm-Message-State: APjAAAVtTv2aVKIZL89OqeYYm+c1/uUY6wHluM66LmP2MrDL+/RA+rEd
 A77K0ew+HK1v9bJzo0hShIFdp3bARRI=
X-Google-Smtp-Source: APXvYqx30UoUaTJp31tQKfUWh3M7D4g9UDkqUaLMfq6KAyzF0dU6oVEn3H2SVMCQmEQ2luZPEL5QkA==
X-Received: by 2002:ac8:2f6a:: with SMTP id k39mr27283876qta.13.1562099363123; 
 Tue, 02 Jul 2019 13:29:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 31/53] drm/amdgpu: enable psp ip block for navi14
Date: Tue,  2 Jul 2019 15:28:22 -0500
Message-Id: <20190702202844.17001-32-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/VSKiReMOC0oWIwumCXV1+IV+vW3aWsgacS/TZXLzvY=;
 b=sM/eNQ43Sw7osRmQFI2v2BjuY/JAnXlhIBVlDTdtRNln2lBDoM/uIbHNGeQpTNcnZw
 2zpvJAm95LWRqS+vpaf7WiyYmdql/YLKL4OjiK2zmPTWQqD5lF50RyFwvPU8m0LBQeym
 odi4M2g1NinJFZ0D9eZyzAEwSqNtm/gvoZ/xaMNq1PtBFgemisonVE3baqb5P6umQ3ld
 ZnLqmvbGYd+9PRI8xzCtTGFuaN4CmYy48zgw184y/LcF7Ty+OZdnjOCD+aEFyjmvnrK9
 I9UkBNk1NgObxZELC+4J3grs2eXFCS7GHNJMwReYxdsfP/t425nQmlJ4WzXVut3nuBhz
 ICdw==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IFNub3cgWmhhbmcgPFNub3cuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IDcxOGMyMjMyOWNkZC4uNTU5MzJkY2VkMzEx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTM2Niw2ICszNjYsNyBAQCBpbnQgbnZfc2V0
X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJYW1kZ3B1X2RldmljZV9p
cF9ibG9ja19hZGQoYWRldiwgJm52X2NvbW1vbl9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2Vf
aXBfYmxvY2tfYWRkKGFkZXYsICZnbWNfdjEwXzBfaXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNl
X2lwX2Jsb2NrX2FkZChhZGV2LCAmbmF2aTEwX2loX2lwX2Jsb2NrKTsKKwkJYW1kZ3B1X2Rldmlj
ZV9pcF9ibG9ja19hZGQoYWRldiwgJnBzcF92MTFfMF9pcF9ibG9jayk7CiAJCWlmIChhZGV2LT5l
bmFibGVfdmlydHVhbF9kaXNwbGF5IHx8IGFtZGdwdV9zcmlvdl92ZihhZGV2KSkKIAkJCWFtZGdw
dV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkY2VfdmlydHVhbF9pcF9ibG9jayk7CiAJCWFt
ZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjEwXzBfaXBfYmxvY2spOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
