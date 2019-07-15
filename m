Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0D69E3C
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C3789FC8;
	Mon, 15 Jul 2019 21:25:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3BD89F97
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:51 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y26so17274886qto.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FOLPIHCK7htzX9/5rLCWiiuj4IQVw9bR4Ilo00M0TCU=;
 b=smqqz1JKrWRl6EbhSDbDYEMrW1R0u2TdNY+bPbjygk3/TgzuOyQXguwfkcvd4YxsXL
 MyAJMgCzdb3UUZlGfcvANLi6yo4sMlVxneuTVqpEXYNPYNtwWG4HAPXLisgY7hoGt2rw
 0XBFY3sOdTzsif7gWiA+0mU6cvyBlhZ9THN53A543Qm05DttXjDr4xbSsQCu7PFOv5Yh
 AQFgT7R9Ub3pfvcmpzUpsUQwpmSkG9k4Wz6wxlFelv3gdI20fEDq8OxnnRsCwJKCDmsW
 2ounn6GnVOvsGJ2a7+M01mJxFxH3a/Vj6U8nxm3OdragNKH2T9o3RkGZKGJqreNbhMTS
 WDdA==
X-Gm-Message-State: APjAAAW/0pz4TtkLtD8WUb+9Be4Pamrw6fiHk7/U1MkHQZrHmg6w6RBC
 VhV4PIcJwXR7oBEJg679+BQw4tcE
X-Google-Smtp-Source: APXvYqwgERSHqjWfafrIvYS6mLl/D6L8DmPhy5uCmd6FvUYayRwtAoWif260PrVPTnvjtZeLzdAi8A==
X-Received: by 2002:a0c:fb01:: with SMTP id c1mr20631006qvp.122.1563225950486; 
 Mon, 15 Jul 2019 14:25:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 073/102] drm/amdgpu: correct ip for
 mmHDP_READ_CACHE_INVALIDATE register access
Date: Mon, 15 Jul 2019 16:24:08 -0500
Message-Id: <20190715212437.31793-71-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FOLPIHCK7htzX9/5rLCWiiuj4IQVw9bR4Ilo00M0TCU=;
 b=aTRTb/tFdRzi5ef+ClX8WAdpY0UF+4NQHIyOrSI5zn/TaYjBNMdRet1e0H5QSV5lZA
 e2pCxYmjwovUhmY/8fUUNuaYn4xgFVrBNgVNOM8jCocY8uG1hZlzR4f1GksfxQfJvDab
 ONuNuDac5fZHg5y+YzpDO5E0b0zDR3njnReroLy8RCR+IBXRZtKyYY2Em8Zbw4CIVXQY
 56vyyLNdb9Gwd2pLf6sNgSg/6iKu0TkOXNt+7X9wQct6DV10+X8yBV3e38pOMrifTjJG
 C6x7WJfbY4+xhJv5uuaNYIArbKkC0TaKbRbD9T87IJBoiLXlXEEIYZNbHrFW4zvayU8i
 047g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1
LmMKaW5kZXggMjE3YWZlMjNhMmY2Li5kYzA5NDY5Zjc3YzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc29jMTUuYwpAQCAtNzAyLDcgKzcwMiw3IEBAIHN0YXRpYyB2b2lkIHNvYzE1X2ludmFsaWRh
dGVfaGRwKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCSBzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcpCiB7CiAJaWYgKCFyaW5nIHx8ICFyaW5nLT5mdW5jcy0+ZW1pdF93cmVnKQotCQlX
UkVHMzJfU09DMTVfTk9fS0lRKE5CSU8sIDAsIG1tSERQX1JFQURfQ0FDSEVfSU5WQUxJREFURSwg
MSk7CisJCVdSRUczMl9TT0MxNV9OT19LSVEoSERQLCAwLCBtbUhEUF9SRUFEX0NBQ0hFX0lOVkFM
SURBVEUsIDEpOwogCWVsc2UKIAkJYW1kZ3B1X3JpbmdfZW1pdF93cmVnKHJpbmcsIFNPQzE1X1JF
R19PRkZTRVQoCiAJCQlIRFAsIDAsIG1tSERQX1JFQURfQ0FDSEVfSU5WQUxJREFURSksIDEpOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
