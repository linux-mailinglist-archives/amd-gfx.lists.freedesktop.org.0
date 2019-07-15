Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3369E23
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA06689F01;
	Mon, 15 Jul 2019 21:25:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0856689ECD
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:28 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id z4so17289240qtc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fu9g24/ZkC0CtZuZ7WXrUD+ev7jTavzPuIPk2XNAtew=;
 b=Fpik2GnYGYslVCRWIZ/nkhklSYvq0rH4ra4Nx/uWNlrm5aDZvzfTA4L98NW9xpqUL+
 miB9RbsLF2r+EhjaiyvoUgCNSWrCGIUgBmKbCRuwHogAeewRU59EzlFmnvY6wmwdKejg
 zRQD5Mz3aODElOdcB/tgG7VxuLLMiwv/v3yDgQIgcy25K+9n6jFstqhiGkMTJKsrhNem
 ypAkII33sKIVlF6FY/IgaDTnhl6ogk04BiAr7PmWC+jXcFT0B2pnbBh6kmTr6oFdnIY8
 cA4WONRe9vGfdleiMUyHpkPjAI/Ce/k+F+qghVmvZl0s6F3eGHlwsSBRAns6rsH4GNU0
 +DIA==
X-Gm-Message-State: APjAAAVzrHcnhJJyZV8e2hMAAfY6Jhts9zZ1ZsvaRVMH7wBkoh952yQ5
 9cTeC5XFkXn/hN5KqcvyJzQCnBPQ
X-Google-Smtp-Source: APXvYqwvj/8OT4p8Pfe9ipYjVYSdPl4cPk2WD51gDijXDsYUJiS5ImkXP93kjl4b5MZBCyb6kVcV1w==
X-Received: by 2002:a05:6214:2b0:: with SMTP id
 m16mr20765576qvv.23.1563225926664; 
 Mon, 15 Jul 2019 14:25:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 047/102] drm/amdkfd: Change arcturus sdma engines number
Date: Mon, 15 Jul 2019 16:23:42 -0500
Message-Id: <20190715212437.31793-45-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fu9g24/ZkC0CtZuZ7WXrUD+ev7jTavzPuIPk2XNAtew=;
 b=LVtpWuYYYW0h3ocW0NSLuDIxa7GW2DB/pY+DJXaDw1//t1siyPfIWASwrgWMeavj7N
 8iqS/aQThmahnL64otQbvVKkyDpZf1NUqZ47cfDtwnWa6iQGYEONgyFRjNiISSWqrGYK
 ELnO3Wf2LaleAwMvDjGw5pq+ycqPNGnDRfv/g/0uJcHAkEfFXjCKjS7WheQhWN3qHjah
 v1VeMCFt7j3x+b+TBJRO6oytlfG2yk/4CHbHJM27kdCoYice/gp/bun6eTbBsjNXf68M
 NDspz2Tvb8JmlBcNEmWfDf0PlbvdRUp9PdAeUsDtaj2eGgYnyH4a3Vu8zfXMnKXuDjO0
 zKpA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <yong.zhao@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>, Oak Zeng <ozeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPG96ZW5nQGFtZC5jb20+CgpBcmN0dXJ1cyBoYXMgOCBzZG1hIGVuZ2lu
ZXMKClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgpSZXZpZXdlZC1i
eTogWW9uZyBaaGFvIDx5b25nLnpoYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwpp
bmRleCA4MTYwMmZiODlkODcuLjUxMWJjMjUyM2YyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2UuYwpAQCAtMzI5LDcgKzMyOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
a2ZkX2RldmljZV9pbmZvIGFyY3R1cnVzX2RldmljZV9pbmZvID0gewogCS5zdXBwb3J0c19jd3Ny
ID0gdHJ1ZSwKIAkubmVlZHNfaW9tbXVfZGV2aWNlID0gZmFsc2UsCiAJLm5lZWRzX3BjaV9hdG9t
aWNzID0gZmFsc2UsCi0JLm51bV9zZG1hX2VuZ2luZXMgPSAyLAorCS5udW1fc2RtYV9lbmdpbmVz
ID0gOCwKIAkubnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSA4LAogfTsKIAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
